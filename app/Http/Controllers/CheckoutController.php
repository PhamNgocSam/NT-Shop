<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Gloudemans\Shoppingcart\Facades\Cart;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\App;
use Rap2hpoutre\FastExcel\FastExcel;
session_start();

class CheckoutController extends Controller
{
    public function AuthLogin()
    {
        $admin_id = Session::get('admin_id');
        if($admin_id)
        {
            return Redirect::to('Dashboard');
        }
        else{
            return Redirect::to('Admin')->send();
        }
    }

    public function login_checkout()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        return view('pages.checkout.login_checkout')->with('category',$cate_product)->with('brand',$brand_product);
    }

    public function add_user(Request $request)
    {
        $data = array();
        $data['user_name'] = $request->user_name;
        $data['user_address'] = $request->user_address;
        $data['user_phone'] = $request->user_phone;
        $data['user_email'] = $request->user_email;
        $data['user_password'] = md5($request->user_password);

        $user_id = DB::table('tbl_user')->insertGetId($data);

        Session::put('user_id',$user_id);
        Session::put('user_name',$request->user_name);
        return Redirect::to('/checkout');
    }

    public function checkout()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        return view('pages.checkout.show_checkout')->with('category',$cate_product)->with('brand',$brand_product);
    }

    public function save_checkout_user(Request $request)
    {
        $data = array();
        $data['shipping_name'] = $request->shipping_name;
        $data['shipping_address'] = $request->shipping_address;
        $data['shipping_phone'] = $request->shipping_phone;
        $data['shipping_email'] = $request->shipping_email;
        $data['shipping_notes'] = $request->shipping_notes;

        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);

        Session::put('shipping_id',$shipping_id);
        return Redirect::to('/payment');
    }

    public function logout_checkout()
    {
        Session::flush();
        return Redirect::to('/login-checkout');
    }

    public function login_user(Request $request)
    {
        $email = $request->email_account;
        $password = md5($request->password_account);
        $result = DB::table('tbl_user')->where('user_email',$email)->where('user_password',$password)->first();

        if($result)
        {
            Session::put('user_id',$result->user_id);
            return Redirect::to('/checkout');
        }
        else{
            return Redirect::to('/login-checkout');
        }
    }

    public function payment()
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        return view('pages.checkout.payment')->with('category',$cate_product)->with('brand',$brand_product);
    }

    public function order_place(Request $request)
    {
        //insert payment method
        $data = array();
        $data['payment_method'] = $request->payment_option;
        $data['payment_status'] = 'Đang chờ xử lý!';
        $payment_id = DB::table('tbl_payment')->insertGetId($data);

        //insert order
        $order_data = array();
        $order_data['order_total'] = str_replace(',', '', Cart::total(0));
        $order_data['order_status'] = 1;
        $order_data['user_id'] = Session::get('user_id');
        $order_data['shipping_id'] = Session::get('shipping_id');
        $order_data['payment_id'] = $payment_id;
        $order_id = DB::table('tbl_order')->insertGetId($order_data);

        //insert order details
        $content = Cart::content(); 
        foreach($content as $v_content)
        {
            $order_d_data['order_id'] = $order_id;
            $order_d_data['product_id'] = $v_content->id;
            $order_d_data['product_name'] = $v_content->name;
            $order_d_data['product_price'] = $v_content->price;
            $order_d_data['product_sales_quantity'] = $v_content->qty;
            DB::table('tbl_order_details')->insert($order_d_data);       
        }
        if($data['payment_method'] == 1)
        {
            $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
            $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

            return view('pages.checkout.handcash')->with('category',$cate_product)->with('brand',$brand_product);
        }
        else{
            $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
            $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

            return view('pages.checkout.handcash')->with('category',$cate_product)->with('brand',$brand_product);
        }
    }

    public function manage_order()
    {       
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_user','tbl_order.user_id','=','tbl_user.user_id')
        ->select('tbl_order.*','tbl_user.user_name')
        ->orderBy('tbl_order.order_id')->paginate(5);
        $manager_order = view('admin.manage_order')->with('all_order', $all_order);
        return view('admin_layout')->with('admin.manage_order', $manager_order);
    }

    public function view_order($orderId)
    {
        $this->AuthLogin();
        $order = DB::table('tbl_order')->where('order_id',$orderId)->get();
        foreach($order as $key => $ord){
            $user_id = $ord->user_id;
            $shipping_id = $ord->shipping_id;
        }

        $order_by_id = DB::table('tbl_order')
        ->join('tbl_user','tbl_order.user_id','=','tbl_user.user_id')
        ->join('tbl_shipping','tbl_order.shipping_id','=','tbl_shipping.shipping_id')
        ->join('tbl_order_details','tbl_order_details.order_id','=','tbl_order.order_id')
        ->select('tbl_order.*','tbl_user.*','tbl_shipping.*','tbl_order_details.*')->first();

        $hang_theo_id = DB::table('tbl_order_details')
        ->join('tbl_product','tbl_product.product_id','=','tbl_order_details.product_id')
        ->join('tbl_order','tbl_order.order_id','=','tbl_order_details.order_id')
        ->where('tbl_order_details.order_id',$orderId)       
        ->get();

        $nguoinhan = DB::table('tbl_order')->join('tbl_shipping','tbl_shipping.shipping_id','=','tbl_order.shipping_id')->where('tbl_order.order_id',$orderId)->first();

        $manager_order_by_id = view('admin.view_order')->with('order', $order)->with('order_by_id', $order_by_id)->with('nguoinhan', $nguoinhan)->with('hang_theo_id', $hang_theo_id);
        return view('admin_layout')->with('admin.view_order', $manager_order_by_id);
    }

    public function print_order($checkout_code){
        $pdf = App::make('dompdf.wrapper');
        $pdf->loadHTML($this->print_order_convert($checkout_code));
        return $pdf->stream();
    }

    public function print_order_convert($checkout_code){
        //return $checkout_code;
        $order_details = DB::table('tbl_order_details')->where('order_id',$checkout_code)->get();
        $order = DB::table('tbl_order')->where('order_id',$checkout_code)->get();

        foreach($order as $key => $ord){
            $user_id = $ord->user_id;
            $shipping_id = $ord->shipping_id;
        }

        $user = DB::table('tbl_user')->where('user_id',$user_id)->first();
        $shipping = DB::table('tbl_shipping')->where('shipping_id',$shipping_id)->first();

        $order_product = DB::table('tbl_order_details')->where('order_id',$checkout_code)->get();

        $output = '';
        
        $output.='
        <style>
            body{
                font-family: DejaVu Sans;
            }

            table, th, td{
                border: 1px solid;
                border-collapse: collapse;
                text-align: center;
            }

            .table-styling{
                border-collapse: collapse;
                width: 100%;
            }

            h3{
                text-align: center;
            }

            .title{
                text-align: center;
            }
        </style>

        <h3>CỬA HÀNG NT-STORE</h3>
        <p class="title">(Hóa đơn thanh toán)</p>

        <p>Thông tin người nhận:</p>
        <table class="table-styling">
            <thead>
                <tr>
                    <th>Tên Người Nhận</th>
                    <th>Địa Chỉ</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                    <th>Ghi Chú</th>
                </tr>
            </thead>

            <tbody>';
                $output.='
                    <tr>
                        <td>'.$shipping->shipping_name.'</td>
                        <td>'.$shipping->shipping_address.'</td>
                        <td>'.$shipping->shipping_phone.'</td>
                        <td>'.$shipping->shipping_email.'</td>
                        <td>'.$shipping->shipping_notes.'</td>
                    </tr>';
                $output.='
            </tbody>
        </table>
            
        <p>Thông tin đơn hàng:</p>
        <table class="table-styling">
            <thead>
                <tr>
                    <th>Tên Sản Phẩm</th>
                    <th>Giá Sản Phẩm</th>
                    <th>Số Lượng</th>
                    <th>Phí Vận Chuyển</th>
                    <th>Tổng Tiền</th>
                </tr>
            </thead>

            <tbody>';
                $total = 0;
                foreach($order_product as $key => $product){                  
                    $subtotal = $product->product_price * $product->product_sales_quantity;
                    $total += $subtotal;
                    $output.='
                        <tr>
                            <td>'.$product->product_name.'</td>
                            <td>'.number_format($product->product_price).' '.'VND'.'</td>
                            <td>'.$product->product_sales_quantity.'</td>
                            <td>Free Ship</td>
                            <td>'.number_format($subtotal).' '.'VND'.'</td>
                        </tr>';
                }                   
                    $output.='
            </tbody>
        </table>

        <br>
        <b>Thanh toán: '.number_format($total).' '.'VND'.'</b>
        <br>
        <b>Hình thức thanh toán: Thanh toán khi nhận hàng!</b>
        <br>

        <p>Ký tên:</p>
        <b style="margin-left: 10%">Người giao hàng</b>
        <b style="margin-left: 40%">Người nhận hàng</b>
        ';
        return $output;
    }

    //Export ra file excel
    public function export_csv()
    {
        $order = DB::table('tbl_order')->get();
        return (new FastExcel($order))->export('order.xlsx');
    }

    //Cập nhật trạng thái đơn hàng
    public function update_order_qty(Request $request){
        $order_id = $request->input('order_id');
        $order_status = $request->input('order_status');

        // Cập nhật trạng thái đơn hàng trong CSDL
        $result = DB::table('tbl_order')->where('order_id', $order_id)->update(['order_status' => $order_status]);

        return Redirect::to('/manage-order');
    }               
}
