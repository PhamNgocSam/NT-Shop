@extends('welcome')
@section('content')

    <section id="cart_items">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="{{URL::to('/')}}">Trang Chủ</a></li>
                <li class="active">Sản Phẩm Yêu Thích Của Bạn</li>
            </ol>
        </div>
			
        <div class="table-responsive cart_info">
            <?php
                use Gloudemans\Shoppingcart\Facades\Cart;					
                $content = Cart::content();
            ?>
            @if (count($products) == 0)
            <p>Không có sản phẩm nào trong danh sách yêu thích.</p>
            @else
            <table class="table table-condensed">
                <thead>
                    <tr class="cart_menu">
                        <td class="image">Hình Ảnh</td>
                        <td class="description">Mô Tả</td>
                        <td class="price">Giá</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    @foreach($products as $product)
                    <form>
                        @csrf		                        
                            <tr>
                                <td class="cart_product">
                                    <a href="{{URL::to('/chi-tiet-san-pham/'.$product->product_id)}}">
                                        <img src="{{URL::to('public/upload/product/'.$product->product_image)}}" width="50" alt="">
                                    </a>
                                </td>
                                <td class="cart_description">
                                    <h4>{{$product->product_name}}</h4>
                                    <p>Sản Phẩm ID: {{$product->product_id}}</p>
                                </td>
                                <td class="cart_price">
                                    <p>{{number_format($product->product_price).' '.'vnd'}}</p>
                                </td>                       
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="{{URL::to('/delete-to-favorites/'.$product->product_id)}}"><i class="fa fa-times text-danger text"></i></a>
                                </td>
                            </tr>	
                    </form>
                    @endforeach					
                </tbody>
            </table>
            @endif
        </div>        
	</section>

@endsection