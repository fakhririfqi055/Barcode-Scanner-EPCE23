#include <HardwareSerial.h>     // Library Arduino untuk akses UART hardware (Serial0/1/2) pada ESP32
#include "GM65_scanner.h"       // Library komunitas untuk perintah-perintah GM65 (frame 9 byte, dsb.)
#include <WiFi.h>               // Library WiFi
#include <HTTPClient.h> 
   
// Membuat instance UART1 pada ESP32. ESP32 punya beberapa UART; di sini kita pakai UART1.
HardwareSerial GM65Serial(1);

// Membuat instance driver GM65 dan mengaitkan ke UART1 di atas.
// Driver ini menyediakan fungsi: init(), set_working_mode(), scan_once(), dll.
// Di balik layar, driver membentuk frame perintah 9-byte (prefix 0x7E ... suffix 0xAB 0xCD) lalu mengirimnya via UART.
GM65_scanner scanner(&GM65Serial);

// Pin UART GM65 pada ESP32 (sesuai wiring). RX_PIN menerima data dari TX GM65; TX_PIN mengirim data ke RX GM65.
const int RX_PIN = 16;
const int TX_PIN = 17;

// BTN_SCAN  : untuk memicu 1x pemindaian (Command Trigger Mode).
// BTN_MODE  : untuk toggle label transaksi "Input Barang" vs "Output Barang".
const int BTN_SCAN = 18;
// const int BTN_MODE = 22;

// 0 = Input Barang, 1 = Output Barang.
int gantiMode = 0;

// WIFI_SSID : untuk nama wifi
// WIFI_PASS : untuk password wifi
char WIFI_SSID[] = "Kerang";
char WIFI_PASS[] = "12345678";

// Membantu engosongkan buffer RX UART dari byte-byte sisa/ACK agar pembacaan berikutnya murni berisi data barcode.
// Sebelum mengirim perintah scan_once() dan setelah mengganti mode kerja.
void flushGM65() {
  while (GM65Serial.available()) GM65Serial.read();
}

// Tujuan: menunggu sampai paket data (payload barcode ASCII) masuk lengkap atau hingga timeout.
// Mekanisme: polling GM65Serial.available() dan mengumpulkan byte ke String.
// Catatan: start di-reset tiap kali ada byte baru agar memberi kesempatan paket utuh terkumpul.
String readGM65Data(unsigned long timeout = 100) {
  String data = "";
  unsigned long start = millis();
  while (millis() - start < timeout) {
    while (GM65Serial.available()) {
      char c = GM65Serial.read();  // membaca 1 byte
      data += c;                   // simpan ke buffer String
      start = millis();            // reset timer saat ada byte masuk (memperpanjang window)
    }
  }
  data.trim(); // hapus whitespace di awal/akhir (/r dan /n)
  return data;
}

// Tujuan: memfilter "respon singkat" GM65 yang BUKAN barcode—contoh yang sering muncul "31"/"0031".
// Jika tidak difilter, ACK bisa salah ditampilkan sebagai hasil scan.
// String kosong dianggap bukan barcode; "31"/"0031" dipastikan ACK; string sangat pendek (<=4) diabaikan.
bool isAckResponse(const String &data) {
  String clean = data;
  clean.trim();
  clean.replace("\r", "");
  clean.replace("\n", "");
  if (clean.length() == 0) return true;              // tidak ada data = bukan barcode
  if (clean == "31" || clean == "0031") return true; // pola ACK umum
  if (clean.length() <= 4) return true;              // barcode normal >4 char (heuristik)
  return false;                                      // selain itu diasumsikan barcode valid
}

void connectWiFi() {
  Serial.print("Menghubungkan ke WiFi: ");
  Serial.println(WIFI_SSID);

  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASS);

  int retry = 0;
  while (WiFi.status() != WL_CONNECTED && retry < 20) {
    delay(500);
    Serial.print(".");
    retry++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("\nWiFi Connected!");
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());
  } else {
    Serial.println("\nGagal terhubung ke WiFi!");
  }
}

void sendToBackend(String barcode, int mode) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("WiFi disconnected, cannot send!");
    return;
  }

  WiFiClient client;
  HTTPClient http;

  String url = "http://10.219.11.147:8000/api/hardware/barcode";
  Serial.println(url);

  http.begin(client, url);
  http.setTimeout(5000);

  http.addHeader("Content-Type", "application/json");
  http.addHeader("Accept", "application/json");
  http.addHeader("X-DEVICE-KEY", "YOUR_DEVICE_KEY"); // kalau backend butuh key, pastikan SAMA

  String payload = "{";
  payload += "\"barcode\":\"" + barcode + "\",";
  payload += "\"mode\":" + String(mode);
  payload += "}";

  Serial.print("Payload: ");
  Serial.println(payload);

  int httpCode = http.POST(payload);
  Serial.print("HTTP code: ");
  Serial.println(httpCode);

  if (httpCode > 0) {
    String response = http.getString();
    Serial.print("Response: ");
    Serial.println(response);
  } else {
    Serial.print("HTTP error: ");
    Serial.println(http.errorToString(httpCode));
  }

  http.end();
}

void setup() {
  // Inisiasi pin
  // Logika: tombol idle = HIGH, ditekan = LOW (karena ditarik ke GND saat ditekan).
  pinMode(BTN_SCAN, INPUT_PULLUP);
  //pinMode(BTN_MODE, INPUT_PULLUP);

  // Buka USB Serial (monitor) untuk debugging pada 115200 bps.
  Serial.begin(115200);

  // Buka UART1 untuk GM65 pada 9600 bps, format 8 data bit, no parity, 1 stop bit; dan set pin RX/TX.
  GM65Serial.begin(9600, SERIAL_8N1, RX_PIN, TX_PIN);

  // ===== Inisialisasi modul GM65 via library =====
  // 1) scanner.init() biasanya melakukan reset/preset yang aman agar GM65 dalam kondisi known-good.
  // 2) enable_setting_code() opsional, mengizinkan konfigurasi via barcode (jika kamu ingin gunakan manual code).
  scanner.init();

  // Ubah GM65 ke "Command Trigger Mode" (mode = 1).
  // Konsekuensi: GM65 tidak scan terus-menerus; ia menunggu perintah "scan_once()" untuk menembakkan 1x scan.
  scanner.set_working_mode(1);

  // Beri jeda kecil agar GM65 sempat mengirim ACK setelah set mode.
  // ACK ini sering tampil "31" di monitor; kita akan buang agar tidak mengganggu pembacaan barcode.
  delay(250);
  
  Serial.println("GM65 Ready untuk Scan");

  connectWiFi();
}

void loop() {
  // Variabel statis untuk deteksi edge (transisi) tombol—menghindari retrigger saat tombol ditekan.
  static bool lastScanBtn = HIGH;
  //static bool lastModeBtn = HIGH;

  // Baca kondisi tombol saat ini.
  bool scanPressed = digitalRead(BTN_SCAN);
  //bool modePressed = digitalRead(BTN_MODE);

  // Deteksi edge: dari HIGH (idle) menjadi LOW (ditekan)
  if (lastScanBtn == HIGH && scanPressed == LOW) {
    // Bersihkan buffer RX agar sisa-sisa byte sebelumnya (ACK/misal noise) tidak ikut terbaca
    flushGM65();

    // Kirim perintah trigger 1x scan ke GM65 via driver.
    // Di balik layar, driver mengirim frame 9-byte "scan once".
    scanner.scan_once();

    // Memberikan waktu singkat agar ACK masuk dulu, lalu buang. Ini mencegah ACK tertangkap sebagai hasil scan.
    delay(80);
    flushGM65(); // Memastikan lagi agar ACK 31 tidak masuk ke dalam scan barcode

    // Beri waktu lagi agar payload barcode (ASCII) terkirim lengkap sebelum kita memanggil readGM65Data().
    delay(150);
  }
  // Update state tombol scan untuk deteksi edge berikutnya
  lastScanBtn = scanPressed;

  // Tombol Mode input Barang / Output Barang
  //if (lastModeBtn == HIGH && modePressed == LOW) {
    //gantiMode = !gantiMode; // toggle 0<->1
    //if (gantiMode == 0) {
      //Serial.println("\nMode diubah : INPUT BARANG");
    //} else {
      //Serial.println("\nMode diubah : OUTPUT BARANG");
    //}
    // Debounce sederhana agar satu tekan tidak dihitung berkali-kali (switch mechanical bounce)
    //delay(250);
  }
  // Update state tombol mode untuk deteksi edge berikutnya
  //lastModeBtn = modePressed;

  // Jika ada data dari GM65 -> baca & tampilkan jika valid
   if (GM65Serial.available()) {
    // Kumpulkan data sampai timeout (default 150 ms di call ini) supaya 1 paket utuh
    String data = readGM65Data(150);
    // Hapus karakter non-printable yang kadang ikut.
    // Rentang ASCII printable: 32-126. Di luar rentang ini dihapus.
    for (int i = 0; i < data.length(); i++) {
      if (data[i] < 32 || data[i] > 126) {
        data.remove(i, 1);
        i--;
      }
    }

    // Saring respon ACK/pendek (bukan barcode)
    if (isAckResponse(data)) return;

    // Cetak ketika lolos pengecekan dengan label arah transaksi.
    if (data.length() > 0) {
      //if (gantiMode == 0) {
        //Serial.print("Input Barang : ");
      //} else {
        //Serial.print("Output Barang : ");
      //}
      Serial.println(data);

      sendToBackend(data, gantiMode);
    }
  }
}