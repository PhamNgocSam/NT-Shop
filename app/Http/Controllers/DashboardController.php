<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        // if (Auth::check()) {
        //     $user_id = Auth::user()->id;
        // } else {
        //     $user_id = null;
        // }
        
        // DB::table('tbl_visitors')->updateOrInsert(
        //     ['user_id' => $user_id],
        //     ['view_count' => DB::raw('view_count + 1')]
        // );
        // $view_count = DB::table('tbl_visitors')->where('user_id', $user_id)->value('view_count');
        
        $total_users = DB::table('tbl_user')->count();
        $total_orders = DB::table('tbl_order')->count();
        $total_sold = DB::table('tbl_order_details')->sum('product_sales_quantity');
        return view('admin.dashboard', compact( 'total_users', 'total_orders', 'total_sold'));
    }
}
