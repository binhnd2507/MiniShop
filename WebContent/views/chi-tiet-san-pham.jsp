<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi-VN"/>
<div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Sản Phẩm</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Tìm kiếm</h2>
                        <form action="TimSanPhamServlet" method="post">
                        	<input type="hidden" name="trangChon" value="sanPham">
                            <input type="text" placeholder="Nhập tên sản phẩm" name="tenSanPham">
                            <input type="submit" value="Tìm kiếm">
                        </form>
                    </div>
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Kết quả tìm kiếm</h2>
                        <c:forEach items="${dssptk}" var="sptk">
	                        <div class="thubmnail-recent">
	                            <img src="img/${sptk.hinhAnh}" class="recent-thumb" alt="img/${sptk.hinhAnh}">
	                            <h2><a href="ChiTietSanPhamServlet?idsp=${sptk.id}">${sptk.tenSanPham}</a></h2>
	                            <div class="product-sidebar-price">
	                                <ins><fmt:formatNumber value="${sptk.donGiaKM}" type="currency"/></ins> 
	                                <del><fmt:formatNumber value="${sptk.donGia}" type="currency"/></del>
	                            </div>                             
	                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="product-breadcroumb">
                            <a href="trang-chu.jsp">Trang chủ</a>
                            <a href="TimSanPhamServlet?id=${loai.id}">${loai.tenLoai}</a>
                            <a href="">${thuongHieu.tenThuongHieu}</a>
                            <a href="ChiTietSanPhamServlet?idsp=${ctsp.id}">${ctsp.tenSanPham}</a>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img">
                                        <img src="img/${ctsp.hinhAnh}" alt="">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name">${ctsp.tenSanPham}</h2>
                                    <div class="product-inner-price">
                                        <ins><fmt:formatNumber value="${ctsp.donGiaKM}" type="currency"/></ins> 
                                        <del><fmt:formatNumber value="${ctsp.donGia}" type="currency"/></del>
                                    </div>    
                                    
                                    <form action="ThemVaoGioServlet" class="cart" method="post">
                                    	<input type="hidden" name="idsp" value="${ctsp.id}">
                                        <div class="quantity">
                                            <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="slm" min="1" step="1">
                                        </div>
                                        <button class="add_to_cart_button" type="submit">Thêm vào giỏ</button>
                                    </form>   
                                    
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Mô tả</a></li>
                                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Đánh giá</a></li>
                                        </ul>
                                        
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>Mô tả</h2>  
												<p>${ctsp.moTa}</p>
                                            </div>
                                            
                                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                                <h2>Đánh giá của bạn</h2>
                                                <div class="submit-review">
                                                <form action="DanhGiaServlet" method="post">
                                                	<input type="hidden" name="idsp" value="${ctsp.id}">
                                                    <p><label for="name">Tên</label> <input name="name" type="text"></p>
                                                    <p><label for="email">Email</label> <input name="email" type="email"></p>
                                                    <div class="rating-chooser">
                                                        <p>Điểm đánh giá</p>
                                                        <div class="rating-wrap-post">
                                                        	<select name="cboDiem">
                                                        		<option value="1">1</option>
                                                        		<option value="2">2</option>
                                                        		<option value="3">3</option>
                                                        		<option value="4">4</option>
                                                        		<option value="5">5</option>
                                                        	</select>
                                                        	<i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <p><label for="review">Đánh giá của bạn</label> <textarea name="danhGia" id="" cols="30" rows="10"></textarea></p>
                                                    <p><input type="submit" value="Submit"></p>
                                                </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">Sản phẩm liên quan</h2>
                            <div class="related-products-carousel">
                            <c:forEach items="${dssplq}" var="splq">
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img src="img/${splq.hinhAnh}" alt="img/${splq.hinhAnh}">
                                        <div class="product-hover">
                                            <a href="javascript:themVaoGio('${splq.id}', '1')" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                            <a href="ChiTietSanPhamServlet?idsp=${splq.id}" class="view-details-link"><i class="fa fa-link"></i> Xem chi tiết</a>
                                        </div>
                                    </div>

                                    <h2><a href="ChiTietSanPhamServlet?idsp=${splq.id}">${splq.tenSanPham}</a></h2>

                                    <div class="product-carousel-price">
                                        <ins><fmt:formatNumber value="${splq.donGiaKM}" type="currency"/></ins> <del><fmt:formatNumber value="${splq.donGia}" type="currency"/></del>
                                    </div> 
                                </div>
                            </c:forEach>                                     
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>