<?php

namespace App\Http\Controllers;

use Intervention\Image\ImageManagerStatic as Image;
use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

// namespace Intervention\Image\Facades;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::orderBy('id', 'DESC')->get();
        // dd($blogs);
        return view('admin.pages.blog.index', compact('blogs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // dd(public_path());
        return view('admin.pages.blog.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'order' => 'required|integer|unique:blogs,order'
        ]);

        $blog = new Blog;
        $blog->title = $validated['title'];
        $blog->description = $validated['description'];
        $blog->order = $validated['order'];
        $blog->status = $request->input('status') ? 1 : 0;

        if ($request->hasFile('image')) {
            try {
                $image = $request->file('image');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('images'), $imageName);
                $blog->image = $imageName;
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload the image'];
                return back()->withNotify($notify);
            }
        }

        $blog->save();

        $notify[] = ['success', 'Blog post created successfully'];
        return redirect()->route('blog.index')->withNotify($notify);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function show(Blog $blog)
    {
        return view('admin.pages.blog.view', compact('blog'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function edit(Blog $blog)
    {
        return view('admin.pages.blog.edit', compact('blog'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            // 'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'order' => 'required|integer|unique:blogs,order,' . $id
        ]);

        $blog = Blog::find($id);
        $blog->title = $validated['title'];
        $blog->description = $validated['description'];
        $blog->order = $validated['order'];
        $blog->status = $request->input('status') ? 1 : 0;

        if ($request->hasFile('image')) {
            try {
                $image = $request->file('image');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('images'), $imageName);
                $blog->image = $imageName;
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload the image'];
                return back()->withNotify($notify);
            }
        }

        $blog->save();

        $notify[] = ['success', 'Blog post updated successfully'];
        return redirect()->route('blog.index')->withNotify($notify);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog $blog)
    {


        // delete the blog from the database
        $blog->delete();
        $notify[] = ['success', 'Blog post updated successfully'];
        return redirect()
            ->route('blogs.index')
            ->withNotify($notify);
    }

    /**
     * Active the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function Active(Blog $blog)
    {
        $blog->status = '1';
        if ($blog->save()) {
            $notify[] = ['success', 'Blog post Activation successfull'];
            return redirect()
                ->route('blogs.index')
                ->withNotify($notify);
        } else {
            $notify[] = ['error', 'blog Activation Unsuccessful'];
            return back()->withNotify($notify);
        }
    }
    /**
     * Inactive  the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function Inactive(Blog $blog)
    {
        // dd($blog->status);
        $blog->status = '0';
        if ($blog->save()) {
            $notify[] = ['success', 'Blog post Deactivation successfull'];
            return redirect()
                ->route('blogs.index')
                ->withNotify($notify);
        } else {
            $notify[] = ['error', 'blog Deactivation Unsuccessful'];
            return back()->withNotify($notify);
        }
    }
}
