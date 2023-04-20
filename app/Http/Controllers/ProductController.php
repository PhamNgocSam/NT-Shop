<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Gloudemans\Shoppingcart\Facades\Cart;
session_start();

class ProductController extends Controller
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

    public function add_product()
    {
        $this->AuthLogin();
        $cate_product = DB::table('tbl_category_product')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->orderBy('brand_id')->get();
        return view('admin.add_product')->with('cate_product', $cate_product)->with('brand_product', $brand_product);
    }

    public function all_product()
    {
        $this->AuthLogin();
        $all_product = DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl-brand','tbl-brand.brand_id','=','tbl_product.brand_id')
        ->orderBy('tbl_product.product_id')->paginate(10);
        $manager_product = view('admin.all_product')->with('all_product', $all_product);
        return view('admin_layout')->with('admin.all_product', $manager_product);
    }

    public function save_product(Request $request)
    {
        $this->AuthLogin();
        $data = array();
        $data['product_name'] = $request->product_name;
        $data['product_quantity'] = $request->product_quantity;
        $data['product_desc'] = $request->product_desc;
        $data['product_price'] = $request->product_price;
        $data['category_id'] = $request->product_cate;
        $data['brand_id'] = $request->product_brand;
        $data['product_status'] = $request->product_status;

        $get_image = $request->file('product_image');
        if($get_image)
        {
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('public/upload/product',$new_image);
            $data['product_image'] = $new_image;
            DB::table('tbl_product')->insert($data);
            Session::put('message', 'Thêm sản phẩm thành công!');
            return Redirect::to('all-product');
        }

        DB::table('tbl_product')->insert($data);
        Session::put('message', 'Thêm sản phẩm thành công!');
        return Redirect::to('add-product');
    }

    public function active_product($product_id)
    {
        $this->AuthLogin();
        DB::table('tbl_product')->where('product_id',$product_id)->update(['product_status'=>1]);
        Session::put('message', 'Kích hoạt sản phẩm thành công!');
        return Redirect::to('all-product');
    }

    public function unactive_product($product_id)
    {
        $this->AuthLogin();
        DB::table('tbl_product')->where('product_id',$product_id)->update(['product_status'=>0]);
        Session::put('message', 'Đã ẩn sản phẩm!');
        return Redirect::to('all-product');
    }

    public function edit_product($product_id)
    {
        $this->AuthLogin();
        $cate_product = DB::table('tbl_category_product')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->orderBy('brand_id')->get();
        $edit_product = DB::table('tbl_product')->where('product_id',$product_id)->get();
        $manager_product = view('admin.edit_product')->with('edit_product', $edit_product)->with('cate_product', $cate_product)->with('brand_product', $brand_product);
        return view('admin_layout')->with('admin.edit_product', $manager_product);
    }

    public function update_product(Request $request, $product_id)
    {
        $this->AuthLogin();
        $data = array();
        $data['product_name'] = $request->product_name;
        $data['product_quantity'] = $request->product_quantity;
        $data['product_desc'] = $request->product_desc;
        $data['product_price'] = $request->product_price;
        $data['category_id'] = $request->product_cate;
        $data['brand_id'] = $request->product_brand;
        $data['product_status'] = $request->product_status;

        $get_image = $request->file('product_image');
        if($get_image)
        {
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('public/upload/product',$new_image);
            $data['product_image'] = $new_image;
            DB::table('tbl_product')->where('product_id',$product_id)->update($data);
            Session::put('message', 'Cập nhật sản phẩm thành công!');
            return Redirect::to('all-product');
        }

        DB::table('tbl_product')->where('product_id',$product_id)->update($data);
        Session::put('message', 'Cập nhật sản phẩm thành công!');
        return Redirect::to('all-product');
    }

    public function delete_product($product_id)
    {
        $this->AuthLogin();
        DB::table('tbl_product')->where('product_id',$product_id)->delete();
        Session::put('message', 'Xóa sản phẩm thành công!');
        return Redirect::to('all-product');
    }

    //end backend product

    public function details_product($product_id)
    {
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        $details_product = DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl-brand','tbl-brand.brand_id','=','tbl_product.brand_id')
        ->where('tbl_product.product_id',$product_id)->get();

        foreach($details_product as $key => $value){
            $category_id = $value->category_id;
        }

        $related_product = DB::table('tbl_product')
        ->join('tbl_category_product','tbl_category_product.category_id','=','tbl_product.category_id')
        ->join('tbl-brand','tbl-brand.brand_id','=','tbl_product.brand_id')
        ->where('tbl_category_product.category_id',$category_id)->whereNotIn('tbl_product.product_id',[$product_id])->get();

        return view('pages.sanpham.show_details')->with('category',$cate_product)->with('brand',$brand_product)->with('product_details',$details_product)->with('related',$related_product);
    }

    public function search_price(Request $request)
    {
        $minPrice = (int) $request->input('min_price');
        $maxPrice = (int) $request->input('max_price');

        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        $search_price = DB::table('tbl_product')->whereBetween('product_price', [$minPrice, $maxPrice])->get();

        return view('pages.sanpham.search_price', ['tbl_product' => $search_price])->with('category',$cate_product)->with('brand',$brand_product)->with('search_price',$search_price);
    }

    //sản phẩm yêu thích
    public function add_to_favorites($product_id){
        $favorites = session()->get('favorites', []);
        if (!in_array($product_id, $favorites)) {
            $favorites[] = $product_id;
            session()->put('favorites', $favorites);
        }
        return redirect()->back()->with('success', 'Sản phẩm đã được thêm vào danh sách yêu thích.');
    }

    public function favorites(){
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderBy('category_id')->get();
        $brand_product = DB::table('tbl-brand')->where('brand_status','1')->orderBy('brand_id')->get();

        $favorites = session()->get('favorites', []);
        $products = DB::table('tbl_product')->whereIn('product_id', $favorites)->get();

        return view('pages.sanpham.favorites', compact('products'))->with('category',$cate_product)->with('brand',$brand_product);
    }

    public function delete_to_favorites($product_id)
    {
        $favorites = session()->get('favorites', []);
        if (($key = array_search($product_id, $favorites)) !== false) {
            unset($favorites[$key]);
            session()->put('favorites', $favorites);
        }
        return redirect()->back()->with('success', 'Sản phẩm đã được xóa khỏi danh sách yêu thích.'); 
    }
}
