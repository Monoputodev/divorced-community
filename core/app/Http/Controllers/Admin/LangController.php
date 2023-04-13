<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LangInfo;

class LangController extends Controller
{
    public function index(){
        $pageTitle = 'All Lang';
        $langs = LangInfo::all();
        return view('admin.lang_info', compact('pageTitle', 'langs'));
    }

    public function save(Request $request, $id=0){
        $request->validate([
            'name' => 'required|unique:lang_infos,name,'.$id
        ]);
        $lang = new LangInfo();
        $notification = 'Lang added successfully';
        if($id){
            $lang = LangInfo::findOrFail($id);
            $notification = 'Lang updated successfully';
        }
        $lang->name = $request->name;
        $lang->save();

        $notify[] = ['success', $notification];
        return back()->with($notify);
    }

    public function delete($id){
        $lang = LangInfo::findOrFail($id);
        $lang->delete();

        $notify[] = ['success', ' Lang deleted successfully'];
        return back()->with($notify);
    }
}
