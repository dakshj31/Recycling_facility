<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FacilityController;

Route::get('/', function () {
    return redirect()->route('facilities.index');
});

// Auth
Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Protected facilities routes
Route::middleware('auth')->group(function () {
    Route::resource('facilities', FacilityController::class);
});