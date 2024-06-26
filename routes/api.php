<?php

use App\Http\Controllers\AccessController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/authorization', [AuthController::class, 'authorization']);
Route::post('/registration', [UserController::class, 'registration']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->group(function() {
    Route::get('/logout', [AuthController::class, 'logout']);
    // Работа с файлами
    Route::post('/files', [FileController::class, 'loadFiles']);
    Route::patch('/files/{file_id}', [FileController::class, 'editFile']);
    Route::delete('/files/{file_id}', [FileController::class, 'deleteFile']);
    Route::get('/files/shared', [FileController::class, 'getUserFiles']);
    Route::get('/files/disk', [FileController::class, 'getAllFiles']);
    Route::get('/files/{file_id}', [FileController::class, 'downloadFile']);

    // Работа с правами
    Route::post('/files/{file_id}/accesses', [AccessController::class, 'addAccesses']);
    Route::delete('/files/{file_id}/accesses', [AccessController::class, 'deleteAccesses']);

});
