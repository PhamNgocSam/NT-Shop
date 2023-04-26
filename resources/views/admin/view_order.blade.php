@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            Thông Tin Khách Hàng
        </div>
               
        <div class="table-responsive">
            <table class="table table-striped b-t b-light">
                <thead>
                <tr>                   
                    <th>Tên Khách Hàng</th>
                    <th>Địa Chỉ</th>
                    <th>Số Điện Thoại</th>
                </tr>
                </thead>
                <tbody>                
                    <tr>
                        <td>{{$nguoinhan->shipping_name}}</td>
                        <td>{{$nguoinhan->shipping_address}}</td>   
                        <td>{{$nguoinhan->shipping_phone}}</td>                        
                    </tr>
                </tbody>
            </table>
        </div>   
    </div>
</div>

<br><br>

<div class="table-agile-info">
    <div class="panel panel-default">
        <div class="panel-heading">
            Chi Tiết Đơn Hàng
        </div>
               
        <div class="table-responsive">
            <?php
                use Gloudemans\Shoppingcart\Facades\Cart;					
                $content = Cart::content();
             ?>
            <table class="table table-striped b-t b-light">
                <thead>
                <tr>                   
                    <th>Tên Sản Phẩm</th>
                    <th>Số Lượng Trong Kho</th>
                    <th>Số Lượng Mua</th>
                    <th>Giá</th>
                    <th>Tổng Tiền</th>
                </tr>
                </thead>
                <tbody>     
                    <?php
                        $total = 0;
                    ?>
                    @foreach($hang_theo_id as $key => $hang)   
                        <?php                           
                            $subtotal = $hang->product_price*$hang->product_sales_quantity;
                            $total+=$subtotal;
                        ?>      
                        <tr>
                            <td>{{ $hang->product_name }}</td>
                            <td>{{ $hang->product_quantity }}</td>
                            <td>
                                {{ $hang->product_sales_quantity }}
                                <!-- <input type="number" min="1" name="product_sales_quantity" value="{{ $hang->product_sales_quantity }}">
                                <input type="hidden" name="order_product_id" class="order_product_id" value="{{$hang->product_id}}"> -->
                            </td>
                            <td>{{ number_format($hang->product_price).' '.'VND'}}</td>
                            <td>{{ number_format($subtotal).' '.'VND'}}</td>                          
                        </tr>
                    @endforeach

                    <tr>
                        <td colspan="2">
                            Thanh Toán: {{number_format($total).' '.'VND'}}
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            @foreach($order as $key => $or)
                            <form method="post" action="{{url('/update-order-qty')}}">
                                @csrf
                                <input type="hidden" name="order_id" value="{{ $or->order_id }}">
                                <select style="height: 26px; width: 250px;" name="order_status">
                                    <option value="">---Chọn hình thức đơn hàng---</option>
                                    <option value="1">Đang chờ xử lý!</option>
                                    <option value="2">Đang giao hàng!</option>
                                    <option value="3">Giao hàng thành công!</option>
                                    <option value="4">Hủy đơn hàng!</option>                                   
                                </select>
                                <button type="submit">Cập nhật</button>
                            </form>
                            @endforeach
                        </td>
                    </tr>

                </tbody>
            </table>
            <br>
            <a style="margin-left: 17px;" target="_blank" href="{{url('/print-order/'.$hang->order_id)}}">In Đơn Hàng</a>

        </div>   
    </div>
</div>
@endsection