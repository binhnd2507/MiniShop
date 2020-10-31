<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cửa hàng nước hoa</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <fmt:setLocale value="vi-VN"/>
    <script>
		function themVaoGio(id, slm) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(this.readyState == 4 && this.status == 200){
					var s = this.responseText;
					var tongTien = s.substring(0, s.indexOf(','));
					var soMatHang = s.substring(s.indexOf(',') + 1);
					document.getElementById("tongTien").innerHTML = tongTien;
					document.getElementById("soMatHang").innerHTML = soMatHang;
				}
			};
			xhr.open("get", "ThemVaoGioServlet?idsp="+id+"&slm="+slm, true);
			xhr.send();
		}
		function trangSanPham(trang) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(this.readyState == 4 && this.status == 200){
					document.getElementById("trangSanPham").innerHTML = this.responseText;
				}
			};
			xhr.open("get", "CuaHangSanPhamServlet?trang="+trang);
			xhr.send();
		}
		function xoa(idsp) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var s = this.responseText;
					var idsp = s.substring(0, s.indexOf(','));
					var tongTien = s.substring(s.indexOf(',') + 1, s.lastIndexOf(','));
					var soMatHang = s.substring(s.lastIndexOf(',') + 1);
					document.getElementById(idsp).style.display = "none";
					document.getElementById("tongTien").innerHTML = tongTien + " đ";
					document.getElementById("soMatHang").innerHTML = soMatHang;
					document.getElementById("congThanhTien").innerHTML = tongTien + " đ";
					document.getElementById("tongTienTatCa").innerHTML = tongTien + " đ";
				}
			};
			xhr.open("get", "XoaSanPhamTrongGioServlet?idsp=" + idsp);
			xhr.send();
		}
	</script>
  </head>
  <body>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li>Xin chào! ${sessionScope.nd.hoTen}</li>
                            <li><a href="trang-gio-hang.jsp"><i class="fa fa-shopping-cart"></i> Giỏ hàng của tôi</a></li>
                            <li><a href="trang-thanh-toan.jsp"><i class="fa fa-paypal"></i> Thanh toán</a></li>
                            <li><a href="DangXuatServlet"><i class="fa fa-user"></i> Đăng xuất</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        <form action="TimSanPhamServlet" method="post">
                        	<input type="hidden" name="trangChon" value="sanPham">
                        	<input type="text" placeholder="Tìm kiếm sản phẩm" name="tenSanPham">
                        	<input type="submit" value="Tìm">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="img/logo.png"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                    <fmt:formatNumber value="${sessionScope.gioHang.tongTien()}" type="number" var="tongTien"/>
                        <a href="trang-gio-hang.jsp">Giỏ hàng : <span class="cart-amunt" id="tongTien">${tongTien} đ</span> <i class="fa fa-shopping-cart"></i> <span class="product-count" id="soMatHang">${sessionScope.gioHang.soMatHang()}</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="trang-chu.jsp">Trang chủ</a></li>
                        <li><a href="trang-cua-hang.jsp">Cửa hàng</a></li>
                        <!-- <li><a href="trang-san-pham.jsp">Sản phẩm</a></li> -->
                        <li><a href="trang-gio-hang.jsp">Giỏ hàng</a></li>
                        <li><a href="trang-thanh-toan.jsp">Thanh toán</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->