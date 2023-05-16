@extends('admin_layout')
@section('admin_content')
        <br>
        <h2>Chào Mừng Bạn Đến Với Trang Admin!</h2>
        <br>
		<div class="market-updates">
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-eye"> </i>
					</div>
					 <div class="col-md-8 market-update-left">
					 <h4>Visitors</h4>
					 <h3>{{ $visitor_count }}</h3>
					<p>Số lượng người xem</p>
				  </div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-users" ></i>
					</div>
					<div class="col-md-8 market-update-left">
					<h4>Users</h4>
						<h3>{{ $total_users }}</h3>
						<p>Tài khoản người dùng</p>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-3">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-usd"></i>
					</div>
					<div class="col-md-8 market-update-left">
						<h4>Sales</h4>
						<h3>{{ number_format($total_sold) }}</h3>
						<p>Doanh thu (VND)</p>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-4">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					</div>
					<div class="col-md-8 market-update-left">
						<h4>Orders</h4>
						<h3>{{ $total_orders }}</h3>
						<p>Số lượng đơn hàng</p>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>	
		<!-- //market-->
		<div class="row">
			<div class="panel-body">
				<div class="col-md-12 w3ls-graph">
					<!--agileinfo-grap-->
						<div class="agileinfo-grap">
							<div class="agileits-box">								
								<header class="agileits-box-header clearfix">
									<h3>Doanh thu theo ngày</h3>								
										<div class="toolbar">											
											
										</div>
								</header>
								<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
								<div class="agileits-box-body clearfix">
								
								<div >
									<canvas id="chart1"></canvas>
									<script>
										// Lấy dữ liệu biểu đồ từ controller truyền sang view
										var data1 = {!! $data1 !!};

										// Tạo biểu đồ Bar Chart
										var ctx = document.getElementById('chart1').getContext('2d');
										var chart1 = new Chart(ctx, {
											type: 'bar',
											data: {
												labels: data1.map(item => 'Ngày ' + item.date),
												datasets: [{
													label: 'Tổng đơn hàng (VND)',
													data: data1.map(item => item.total),
													backgroundColor: 'red',
													borderColor: 'rgba(75, 192, 192, 1)',
													borderWidth: 1
												}]
											},
											options: {
												scales: {
													y: {
														beginAtZero: true,
														max: Math.max(...data1.map(item => item.total)) + 100000 // Tùy chỉnh giá trị y tối đa
													}
												}
											}
										});
									</script>
    							</div>
								
								<br><br>
								<header class="agileits-box-header clearfix">
									<h3>Doanh thu theo tháng</h3>								
										<div class="toolbar">											
											
										</div>
								</header>
								<div >
									<canvas id="chart"></canvas>
									<script>
										// Lấy dữ liệu biểu đồ từ controller truyền sang view
										var data = {!! $data !!};

										// Tạo biểu đồ Bar Chart
										var ctx = document.getElementById('chart').getContext('2d');
										var chart = new Chart(ctx, {
											type: 'bar',
											data: {
												labels: data.map(item => 'Tháng ' + item.month),
												datasets: [{
													label: 'Tổng đơn hàng (VND)',
													data: data.map(item => item.total),
													backgroundColor: 'red',
													borderColor: 'rgba(75, 192, 192, 1)',
													borderWidth: 1
												}]
											},
											options: {
												scales: {
													y: {
														beginAtZero: true,
														max: Math.max(...data.map(item => item.total)) + 1000000 // Tùy chỉnh giá trị y tối đa
													}
												}
											}
										});
									</script>
    							</div>
								
								
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
@endsection