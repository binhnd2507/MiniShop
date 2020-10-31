<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi-VN"/>

<div class="maincontent-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="latest-product">
					<h2 class="section-title">Sản Phẩm Mới</h2>
					<div class="product-carousel">
					<c:forEach items="${dsspm}" var="spm">
						<div class="single-product" id="${spm.id}">
							<div class="product-f-image">
								<img src="img/${spm.hinhAnh}" alt="img/${spm.hinhAnh}">
								<div class="product-hover">
									<a href="javascript:themVaoGio('${spm.id}', '1');" class="add-to-cart-link">
										<i class="fa fa-shopping-cart"></i> Thêm vào giỏ
									</a> 
									<a href="ChiTietSanPhamServlet?idsp=${spm.id}" class="view-details-link">
									<i class="fa fa-link"></i> Xem chi tiết</a>
								</div>
							</div>
							<h2>
								<a href="ChiTietSanPhamServlet?idsp=${spm.id}">${spm.tenSanPham}</a>
							</h2>

							<div class="product-carousel-price">
								<ins><fmt:formatNumber value="${spm.donGiaKM}" type="currency"/> </ins>
								<del><fmt:formatNumber value="${spm.donGia}" type="currency"/> </del>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main content area -->