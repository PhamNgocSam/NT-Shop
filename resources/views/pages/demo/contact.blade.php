@extends('welcome')
@section('content')

    <div class="bg">
        <div class="row">    		
            <div class="col-sm-10">    			   			
                <h2 class="title text-center">Liên Hệ Với Chúng Tôi</h2>    			    				    				
                <div id="gmap" class="contact-map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d21081.61068237928!2d105.82938343226816!3d20.92287940738535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad92877d10ef%3A0x3ee750a30bb1ed74!2sNt%20Store!5e0!3m2!1svi!2s!4v1682213022879!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>			 		
        </div>  

        <div class="row" style="margin-top: 30px;">  	
            <div class="col-sm-6">
                <div class="contact-form">
                    <h2 class="title text-center">Liên Lạc</h2>
                    <div class="status alert alert-success" style="display: none"></div>
                    <form id="main-contact-form" class="contact-form row" name="contact-form">
                        <div class="form-group col-md-6">
                            <input type="text" name="name" class="form-control" required="required" placeholder="Họ và tên">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="email" name="email" class="form-control" required="required" placeholder="Email">
                        </div>
                        <div class="form-group col-md-12">
                            <input type="text" name="subject" class="form-control" required="required" placeholder="Số điện thoại">
                        </div>
                        <div class="form-group col-md-12">
                            <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Lời nhắn của bạn"></textarea>
                        </div>                        
                        <div class="form-group col-md-12">
                            <input type="submit" name="submit" class="btn btn-primary pull-right" value="Gửi">
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="contact-info">
                    <h2 class="title text-center">Thông Tin Liên Lạc</h2>
                    <address>
                        <p>NT-Store Inc.</p>
                        <p>Ngũ Hiệp, Thanh Trì, Hà Nội, Việt Nam</p>
                        <p>WRGX+QR Thanh Trì, Hà Nội, Việt Nam</p>
                        <p>Mobile: +34 950 188 821</p>
                        <p>Fax: 1-714-252-0026</p>
                        <p>Email: SamPham@gmail.com</p>
                    </address>
                    <div class="social-networks">
                        <h2 class="title text-center">Mạng Xã Hội</h2>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-youtube"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>    			
        </div>  
    </div>
    
@endsection