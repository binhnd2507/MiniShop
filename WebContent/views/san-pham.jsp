<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi-VN"/>
<div class="product-widget-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="single-product-widget">
					<h2 class="product-wid-title">Bán Chạy Nhất</h2>
					<a href="TimSanPhamServlet?id=banChay" class="wid-view-more">Xem tất cả</a>
					<c:forEach items="${dsspbc}" var="spbc">
					<div class="single-wid-product">
						<a href="ChiTietSanPhamServlet?idsp=${spbc.id}"><img
							src="img/${spbc.hinhAnh}" alt="${spbc.hinhAnh}" class="product-thumb"></a>
						<h2>
							<a href="ChiTietSanPhamServlet?idsp=${spbc.id}">${spbc.tenSanPham}</a>
						</h2>
						<div class="product-wid-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-wid-price">
							<ins><fmt:formatNumber value="${spbc.donGiaKM}" type="currency"/> </ins>
							<del><fmt:formatNumber value="${spbc.donGia}" type="currency"/> </del>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-product-widget">
					<h2 class="product-wid-title">Giảm Giá Nhiều</h2>
					<a href="TimSanPhamServlet?id=giamGia" class="wid-view-more">Xem tất cả</a>
					<c:forEach items="${dsggn}" var="ggn">
					<div class="single-wid-product">
						<a href="ChiTietSanPhamServlet?idsp=${ggn.id}"><img
							src="img/${ggn.hinhAnh}" alt="img/${ggn.hinhAnh}" class="product-thumb"></a>
						<h2>
							<a href="ChiTietSanPhamServlet?idsp=${ggn.id}">${ggn.tenSanPham}</a>
						</h2>
						<div class="product-wid-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-wid-price">
							<ins><fmt:formatNumber value="${ggn.donGiaKM}" type="currency"/> </ins>
							<del><fmt:formatNumber value="${ggn.donGia}" type="currency"/></del>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-product-widget">
					<h2 class="product-wid-title">Yêu Thích Nhất</h2>
					<a href="TimSanPhamServlet?id=yeuThich" class="wid-view-more">Xem tất cả</a>
					<c:forEach items="${dsspytn}" var="spytn">
					<div class="single-wid-product">
						<a href="ChiTietSanPhamServlet?idsp=${spytn.id}"><img
							src="img/${spytn.hinhAnh}" alt="img/${spytn.hinhAnh}" class="product-thumb"></a>
						<h2>
							<a href="ChiTietSanPhamServlet?idsp=${spytn.id}">${spytn.tenSanPham}</a>
						</h2>
						<div class="product-wid-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
						<div class="product-wid-price">
							<ins><fmt:formatNumber value="${spytn.donGiaKM}" type="currency"/></ins>
							<del><fmt:formatNumber value="${spytn.donGia}" type="currency"/></del>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End product widget area -->