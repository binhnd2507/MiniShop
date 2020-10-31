<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi-VN"/>

<div class="product-big-title-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-bit-title text-center">
					<h2>Giỏ Hàng</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Page title area -->


<div class="single-product-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="single-sidebar">
					<h2 class="sidebar-title">Tìm kiếm</h2>
					<form action="TimSanPhamServlet" method="post">
						<input type="hidden" name="trangChon" value="gioHang">
						<input type="text" placeholder="Nhập tên sản phẩm" name="tenSanPham"> 
						<input type="submit" value="Tìm kiếm">
					</form>
				</div>

				<div class="single-sidebar">
					<h2 class="sidebar-title">Kết quả tìm kiếm</h2>
					<c:forEach items="${dssptk}" var="sptk">
					<div class="thubmnail-recent">
						<img src="img/${sptk.hinhAnh}" class="recent-thumb" alt="img/${sptk.hinhAnh}">
						<h2>
							<a href="ChiTietSanPhamServlet?idsp=${sptk.id}">${sptk.tenSanPham}</a>
						</h2>
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
					<div class="woocommerce">
						<form method="post" action="CapNhatGioHangServlet">
							<table cellspacing="0" class="shop_table cart">
								<thead>
									<tr>
										<th class="product-remove">Xóa</th>
										<th class="product-thumbnail">Hình</th>
										<th class="product-name">Sản phẩm</th>
										<th class="product-price">Giá</th>
										<th class="product-quantity">Số lượng</th>
										<th class="product-subtotal">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${sessionScope.gioHang.danhSachSanPhamMua()}"
										var="spm">
										<tr class="cart_item" id="${spm.id}">
											 <td class="product-remove"><a title="Remove this item"
												class="remove" href="javascript:xoa('${spm.id}')">×</a></td> 

											<td class="product-thumbnail"><a
												href="ChiTietSanPhamServlet?idsp=${spm.id}"><img width="145" height="145"
													alt="poster_1_up" class="shop_thumbnail"
													src="img/${spm.hinhAnh}"></a></td>

											<td class="product-name"><a href="ChiTietSanPhamServlet?idsp=${spm.id}">${spm.tenSanPham}</a></td>

											<td class="product-price"><span class="amount"><fmt:formatNumber value="${spm.donGiaKM}" type="currency"/></span>
											</td>

											<td class="product-quantity">
												<div class="quantity buttons_added">
													<input type="number" size="4" class="input-text qty text" title="Qty" value="${spm.soLuongMua}" min="0" step="1" name="slMua" style="text-align: center;">
												</div>
											</td>
											<td class="product-subtotal"><span class="amount"><fmt:formatNumber value="${spm.thanhTien()}" type="currency"/></span>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td class="actions" colspan="6">
											<div class="coupon">
												<label for="coupon_code">Mã giảm giá:</label> <input type="text"
													placeholder="Nhập mã giảm giá" value="" id="coupon_code"
													class="input-text" name="coupon_code"> <input
													type="submit" value="Sử dụng" name="apply_coupon"
													class="button">
											</div> 
											<input type="submit" value="Cập nhật" name="update_cart"
											class="button"> 
											<input type="submit" value="Thanh Toán" name="proceed" formaction="trang-thanh-toan.jsp" class="checkout-button button alt wc-forward">
										</td>
									</tr>
								</tbody>
							</table>
						</form>

						<div class="cart-collaterals">

							<div class="cart_totals ">
								<h2>TỔNG GIỎ HÀNG</h2>

								<table cellspacing="0">
									<tbody>
										<tr class="cart-subtotal">
											<th>Cộng thành tiền</th>
											<fmt:formatNumber value="${sessionScope.gioHang.tongTien()}" type="number" var="congThanhTien"></fmt:formatNumber>
											<td><span class="amount" id="congThanhTien">${congThanhTien} đ</span></td>
										</tr>

										<tr class="shipping">
											<th>Phí giao hàng</th>
											<td>Miễn phí</td>
										</tr>

										<tr class="order-total">
											<th>Tổng tiền</th>
											<fmt:formatNumber value="${sessionScope.gioHang.tongTien()}" type="number" var="tongTienTatCa"></fmt:formatNumber>
											<td><strong><span class="amount" id="tongTienTatCa">${tongTienTatCa} đ</span></strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
