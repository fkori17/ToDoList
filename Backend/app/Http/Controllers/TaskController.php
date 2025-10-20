<?php

namespace App\Http\Controllers;

use App\Models\task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $response = task::all();
        return response()->json($response);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $response = task::find($id);
        if (empty($response)) {
            return response()->json(["message"=> "ID not found"],404);
        } else {
            return response()->json($response);
        }
        //
    }

    public function overload()
    {
        $response = task::
        selectRaw('assigned_to, COUNT(title) as task_count')
        ->groupBy('assigned_to')
        ->having('task_count', '>', 1)
        ->get();
        if (empty($response)) {
            return response()->json(["message"=> "No overloaded workers found"],404);
        } else {
            return response()->json($response);
        }
        //
    }

    public function lingering()
    {
        $response = task::
        where('is_completed', 0)
        ->where('created_at', '<', now()->subMonths(4))
        ->get();
        if (empty($response)) {
            return response()->json(["message"=> "No lingering tasks found"],404);
        } else {
            return response()->json($response);
        }
        //
    }

    public function completed()
    {
        $response = task::
        where('is_completed', 1)
        ->get();
        if (empty($response)) {
            return response()->json(["message"=> "No completed tasks found"],404);
        } else {
            return response()->json($response);
        }
        //
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(task $task)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, task $task)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(task $task)
    {
        //
    }
}
