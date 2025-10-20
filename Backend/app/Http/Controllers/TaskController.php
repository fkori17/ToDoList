<?php

namespace App\Http\Controllers;

use App\Models\task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use function Laravel\Prompts\error;

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
        $validator = Validator::make($request->all(), [
            'title' => 'required|string',
            'description' => 'string',
            'assigned_to' => 'string',
            'is_completed' => 'boolean',
        ], [
            'title.required' => 'Title is required',
            'is_completed.boolean' => 'Is Completed must be true or false',
            'description.string' => 'Description must be a string',
            'title.string' => 'Title must be a string',
            'assigned_to.string' => 'Assigned To must be a string',
        ]);

        if ($validator->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Validation errors',
                    'errors' => $validator->errors()->toArray()],
                422
            );
        }

        $newRecord = new task();
        $newRecord->title = $request->title;
        $newRecord->description = $request->description;
        $newRecord->assigned_to = $request->assigned_to;
        $newRecord->is_completed = $request->is_completed ?? false;
        $newRecord->save();

        return response()->json([
            'success' => true,
            'message' => 'Task created successfully',
            'data' => $newRecord
        ], 201);
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
