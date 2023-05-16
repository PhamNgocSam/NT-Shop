<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $ip_address = $request->ip();
        $visit_date = now();

        DB::table('tbl_visitors')->insert([
            'ip_address' => $ip_address,
            'visit_date' => $visit_date
        ]);

        $visitor_count = DB::table('tbl_visitors')->distinct('ip_address')->count('ip_address');
        $visitor_count = DB::table('tbl_visitors')->count();

        $total_users = DB::table('tbl_user')->count();
        $total_orders = DB::table('tbl_order')->count();
        $total_sold = DB::table('tbl_order')->sum('order_total');

        $orders_day = DB::table('tbl_order')
            ->select(DB::raw('SUM(order_total) as total'), DB::raw('DATE(created_at) as date'))
            ->groupBy('date')
            ->get();

        $orders_month = DB::table('tbl_order')
        ->select(DB::raw('MONTH(created_at) as month'), DB::raw('SUM(order_total) as total'))
        ->groupBy(DB::raw('MONTH(created_at)'))
        ->orderBy(DB::raw('MONTH(created_at)'))
        ->get();

        // Chuyển dữ liệu sang dạng JSON để truyền cho view
        $data = json_encode($orders_month);
        $data1 = json_encode($orders_day);
        
        return view('admin.dashboard', compact('data','data1', 'visitor_count', 'total_users', 'total_orders', 'total_sold'));
    }
}
