<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>NT-Store</title>
    <link href="{{asset('public/frontend/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/prettyPhoto.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/price-range.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/animate.css')}}" rel="stylesheet">
	<link href="{{asset('public/frontend/css/main.css')}}" rel="stylesheet">
	<link href="{{asset('public/frontend/css/responsive.css')}}" rel="stylesheet">
	<link href="{{asset('public/frontend/css/sweetalert.css')}}" rel="stylesheet">
	
    <link rel="shortcut icon" href="{{{'public/frontend/images/ico/favicon.ico'}}}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +34 950 188 821</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> SamPham@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"><img src="{{URL::to('public/frontend/images/logo1.png')}}" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									VIE
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Tiếng Việt</a></li>
									<li><a href="#">English</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									VND
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">VND</a></li>
									<li><a href="#">$</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="{{URL::to('/favorites')}}"><i class="fa fa-star"></i>Yêu Thích</a></li>

								<?php
									use Illuminate\Support\Facades\Session;
									$user_id = Session::get('user_id');
									$shipping_id = Session::get('shipping_id');
									if($user_id != NULL && $shipping_id == NULL){
								?>
								<li><a href="{{URL::to('/checkout')}}"><i class="fa fa-crosshairs"></i>Thanh Toán</a></li>
								<?php
								} else if($user_id != NULL && $shipping_id != NULL){
									?>
									<li><a href="{{URL::to('/payment')}}"><i class="fa fa-crosshairs"></i>Thanh Toán</a></li>
									<?php
								} else {
									?>
									<li><a href="{{URL::to('/login-checkout')}}"><i class="fa fa-crosshairs"></i>Thanh Toán</a></li>
									<?php
								}
									?>
									

								<li><a href="{{URL::to('/show-cart')}}"><i class="fa fa-shopping-cart"></i>Giỏ Hàng</a></li>

								
								<?php									
									$user_id = Session::get('user_id');
									if($user_id != NULL){
								?>
								<li><a href="{{URL::to('/logout-checkout')}}"><i class="fa fa-lock"></i>Đăng Xuất</a></li>
								<?php
								} else{
									?>
									<li><a href="{{URL::to('/login-checkout')}}"><i class="fa fa-lock"></i>Đăng Nhập</a></li>
									<?php
								}
									?>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-7">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="{{URL::to('/Trang_Chu')}}" class="active">Trang Chủ</a></li>
								<li class="dropdown"><a href="#">Cửa Hàng<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="{{URL::to('/')}}">Sản Phẩm</a></li>
										<li><a href="{{URL::to('/show-cart')}}">Giỏ Hàng</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Tin Tức<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="{{URL::to('/blog')}}">Danh Sách Tin Tức</a></li>
										<li><a href="{{URL::to('/other-blog')}}">Tin Tức Khác</a></li>
                                    </ul>
                                </li> 
								<!-- <li><a href="{{URL::to('/error')}}">404</a></li> -->
								<li><a href="{{URL::to('/contact')}}">Liên Hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-5">
						<form action="{{URL::to('/tim-kiem')}}" method="GET">
							{{ csrf_field() }}
							<div class="search_box pull-right">
								<input type="text" name="name" placeholder="Tìm kiếm sản phẩm">
								<button style="height: 35px; border: none" type="submit">Search</button>
							</div>
						</form>						
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>NT</span>-STORE</h1>
									<h2>Super BrandDay</h2>
									<p>Ngày siêu thương hiệu với các sản phẩm mới và rất nhiều quà tặng hấp dẫn đang chờ các bạn. Vào xem ngay thôi nào! </p>
									<button type="button" class="btn btn-default get">Xem ngay</button>
								</div>
								<div class="col-sm-6">
									<img style="width:400px; height:420px;" src="{{URL::to('public/frontend/images/a1.jpg')}}" class="girl img-responsive" alt="" />									
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>NT</span>-STORE</h1>
									<h2>Đại lễ Sale to</h2>
									<p>Cơ hội nhận được voucher giảm giá đặc biệt lên đến 5 triệu khi mua các sản phẩm của Shop. </p>
									<button type="button" class="btn btn-default get">Xem ngay</button>
								</div>
								<div class="col-sm-6">
									<img style="width:400px; height:420px;" src="{{URL::to('public/frontend/images/a2.jpg')}}" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>NT</span>-STORE</h1>
									<h2>Tủ Lạnh Panasonic 167L Inverter</h2>
									<h3>Giá chỉ 12,500k. </h3>
									<p>Bộ lọc tinh thể bạc AG Clean kháng khuẩn bảo vệ sức khỏe</p>									
									<p>Tiết kiệm điện năng tối ưu nhờ công nghệ Econavi Inverter</p>
									<button type="button" class="btn btn-default get">Xem ngay</button>
								</div>
								<div class="col-sm-6">
									<img style="width:400px; height:420px;" src="{{URL::to('public/frontend/images/a1.png')}}" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>DANH MỤC SẢN PHẨM</h2>
						<div class="panel-group category-products" id="accordian">
							@foreach($category as $key =>$cate)							
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title"><a href="{{URL::to('/danh-muc-san-pham/'.$cate->category_id)}}">{{$cate->category_name}}</a></h4>
									</div>
								</div>
							@endforeach
						</div>
					
						<div class="brands_products">
							<h2>THƯƠNG HIỆU SẢN PHẨM</h2>
							<div class="brands-name">								
								<ul class="nav nav-pills nav-stacked">
									@foreach($brand as $key =>$brand)
										<li><a href="{{URL::to('/thuong-hieu-san-pham/'.$brand->brand_id)}}"> <span class="pull-right"></span>{{$brand->brand_name}}</a></li>	
									@endforeach								
								</ul>
							</div>
						</div>
                        <!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>PHẠM VI GIÁ</h2>
							<div class="well text-center">
								 <!-- <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b> -->
								 <form action="{{URL::to('/tim-kiem-gia')}}" method="GET">
									{{ csrf_field() }}
									<div class="search_box pull-right">									
										<input type="text" name="min_price" id="min_price" placeholder="Giá tối thiểu">
										<input type="text" name="max_price" id="max_price" placeholder="Giá tối đa">
										<button style="height: 35px; border: none; width: 155px;" type="submit">Search</button>
									</div>
								</form>	
							</div>
						</div><!--/price-range-->					
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					@yield('content')
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>NT</span>-STORE</h2>
							<p>Mọi người có thể xem thêm các chính sách, dịch vụ của cửa hàng ở dưới đây.</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
                                        <img src="{{URL::to('public/frontend/images/a1.png')}}" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Sản Phẩm Mới</p>
								<h2>28 April 2023</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
									    <img src="{{URL::to('public/frontend/images/a3.jpg')}}" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Sản Phẩm Mới</p>
								<h2>24 April 2023</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
                                        <img src="{{URL::to('public/frontend/images/a1.jpg')}}" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Sản Phẩm Mới</p>
								<h2>12 March 2023</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
                                        <img src="{{URL::to('public/frontend/images/a2.jpg')}}" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Sản Phẩm Mới</p>
								<h2>03 May 2023</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="{{URL::to('public/frontend/images/map.png')}}" alt="" />
							<p>NT-Store vươn tầm thế giới</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Dịch Vụ</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Trợ Giúp Trực Tuyến</a></li>
								<li><a href="#">Liên hệ chúng tôi</a></li>
								<li><a href="#">Tình trạng đặt hàng</a></li>
								<li><a href="#">Thay đổi địa điểm</a></li>
								<li><a href="#">Câu hỏi thường gặp</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Thể Loại</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Smart Tivi</a></li>
								<li><a href="#">Laptop</a></li>
								<li><a href="#">Điều hòa</a></li>
								<li><a href="#">Tủ lạnh</a></li>
								<li><a href="#">Khác</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>CHÍNH SÁCH</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Điều khoản sử dụng</a></li>
								<li><a href="#">Chính sách bảo mật</a></li>
								<li><a href="#">Chính sách hoàn lại tiền</a></li>
								<li><a href="#">Hệ thống thanh toán</a></li>
								<li><a href="#">Hệ thống vé</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>GIỚI THIỆU VỀ STORE</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Thông tin công ty</a></li>
								<li><a href="#">Nghề nghiệp</a></li>
								<li><a href="#">Vị trí cửa hàng</a></li>
								<li><a href="#">Chương trình liên kết</a></li>
								<li><a href="#">Bản quyền</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>LIÊN HỆ</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Địa chỉ email của bạn" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Nhận các bản cập nhật gần đây nhất từ
​									​trang web của chúng tôi và được cập nhật bản thân của bạn.</p>
							</form>
						</div>
					</div>					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">© 2023 Hanoi University Of Industry | Design By <a href="http://w3layouts.com">SamPham</a></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	 
    <script src="{{asset('public/frontend/js/jquery.js')}}"></script>
	<script src="{{asset('public/frontend/js/bootstrap.min.js')}}"></script>
	<script src="{{asset('public/frontend/js/jquery.scrollUp.min.js')}}"></script>
	<script src="{{asset('public/frontend/js/price-range.js')}}"></script>
    <script src="{{asset('public/frontend/js/jquery.prettyPhoto.js')}}"></script>
    <script src="{{asset('public/frontend/js/main.js')}}"></script>
	<script src="{{asset('public/frontend/js/sweetalert.min.js')}}"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.add-to-cart').click(function(){
				var id = $(this).data('id');
				var cart_product_id = $('.cart_product_id_' + id).val();
				var cart_product_name = $('.cart_product_name_' + id).val();
				var cart_product_image = $('.cart_product_image_' + id).val();
				var cart_product_price = $('.cart_product_price_' + id).val();
				var cart_product_qty = $('.cart_product_qty_' + id).val();
				var _token = $('input[name="_token"]').val();
				
				$.ajax({
					url: "{{url('/add-cart-ajax')}}",
					method: 'POST',
					data: {cart_product_id:cart_product_id,cart_product_name:cart_product_name,cart_product_image:cart_product_image,cart_product_price:cart_product_price,cart_product_qty:cart_product_qty,_token:_token},

					success:function(data){
						swal({
                            title: "Đã thêm sản phẩm vào giỏ hàng",
							text: "Bạn có thể mua hàng tiếp hoặc tới giỏ hàng để tiến hành thanh toán",
							showCancelButton: true,
							cancelButtonText: "Xem tiếp",
							confirmButtonClass: "btn-success",
							confirmButtonText: "Đi đến giỏ hàng",
							closeOnConfirm: false
						},
						function() {
							window.location.href = "{{url('/gio-hang')}}";
						});
					}
				});
			});
		});
	</script>
</body>
</html>