<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;

Route::get('/', [TaskController::class, 'index']);
Route::get('/id/{id}', [TaskController::class, 'show']);
Route::get('/completed', [TaskController::class, 'completed']);
Route::get('/overload', [TaskController::class, 'overload']);
Route::get('/lingering', [TaskController::class, 'lingering']);