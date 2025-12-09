<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\TransaksiDetail;

class TransaksiDetailController extends Controller
{
    public function index()
    {
        return response()->json(TransaksiDetail::with('produk')->get());
    }
}
