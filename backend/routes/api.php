<?php
use App\Http\Controllers\Api\TransaksiController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ProdukController;
use App\Http\Controllers\Api\TransaksiDetailController;
use App\Http\Controllers\Api\SpendingReportController;
use App\Http\Controllers\Api\DetailSpendingController;
use App\Http\Controllers\Api\HardwareController;

// Proteksi semua endpoint user
Route::apiResource('users', UserController::class)->middleware('auth:sanctum');

// Proteksi endpoint logout
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');

// GET produk (bisa diakses semua user)
Route::get('produk', [ProdukController::class, 'index']);
Route::get('produk/{produk}', [ProdukController::class, 'show']);
// Lookup produk by barcode
Route::get('produk/barcode/{code}', [ProdukController::class, 'byBarcode']);

// Proteksi CRUD produk hanya untuk user dengan token
Route::post('produk', [ProdukController::class, 'store'])->middleware('auth:sanctum');
Route::put('produk/{produk}', [ProdukController::class, 'update'])->middleware('auth:sanctum');
Route::delete('produk/{produk}', [ProdukController::class, 'destroy'])->middleware('auth:sanctum');

Route::post('/login', [LoginController::class, 'login']);
Route::apiResource('transaksi', TransaksiController::class);
Route::patch('transaksi/{id}/status', [TransaksiController::class, 'updateStatus']);
Route::apiResource('transaksi_detail', TransaksiDetailController::class);
Route::apiResource('spending-report', SpendingReportController::class);
Route::apiResource('detail-spending', DetailSpendingController::class);

// Hardware bridge endpoint (backend-only). Requires Sanctum auth.
Route::post('hardware/command', [HardwareController::class, 'command'])->middleware('auth:sanctum');
// public webhook for hardware devices (use device key header for auth)
Route::post('hardware/webhook', [HardwareController::class, 'receive']);
Route::get('hardware/webhook', function(){ return response('OK - use POST for webhook', 200); });

Route::post('hardware/barcode', [HardwareController::class, 'barcode']);
Route::get('hardware/barcode', function () {
    $barcode = Cache::pull('last_scanned_barcode'); 
    return response()->json([
        'barcode' => $barcode,
    ]);
});