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
                        <h2>Thanh Toán</h2>
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
                        <form action="TimSanPhamServlet?trangChon=thanhToan" method="post">
                        	<input type="hidden" name="trangChon" value="thanhToan">
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
                        <div class="woocommerce">
                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">
                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">
                                            <h3>Thông Tin Giao Hàng</h3>
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">Họ tên <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="Nhập họ tên" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Địa chỉ giao hàng <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="Nhập địa chỉ" id="billing_address_1" name="billing_address_1" class="input-text ">
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="billing_email">Email <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="email" value="" placeholder="Nhập email" id="billing_email" name="billing_email" class="input-text ">
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">ĐTDĐ <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="tel" value="" placeholder="Nhập số điện thoại" id="billing_phone" name="billing_phone" class="input-text ">
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="woocommerce-shipping-fields">
                                            <h3 id="ship-to-different-address">
                        <label class="checkbox" for="ship-to-different-address-checkbox">Giao hàng ở địa chỉ khác?</label>
                        <input type="checkbox" value="1" name="ship_to_different_address" checked="checked" class="input-checkbox" id="ship-to-different-address-checkbox">
                        </h3>
                                            <div class="shipping_address" style="display: block;">
                                                <p id="shipping_first_name_field" class="form-row form-row-first validate-required">
                                                    <label class="" for="shipping_first_name">Người nhận hàng <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="Nhập họ tên người nhận" id="shipping_first_name" name="shipping_first_name" class="input-text ">
                                                </p>
                                                <p id="shipping_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                    <label class="" for="shipping_address_1">Địa chỉ giao hàng <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="Nhập địa chỉ" id="shipping_address_1" name="shipping_address_1" class="input-text ">
                                                </p>
                                                <p id="shipping_postcode_field" class="form-row form-row-last address-field validate-required validate-postcode" data-o_class="form-row form-row-last address-field validate-required validate-postcode">
                                                    <label class="" for="shipping_postcode">ĐTDĐ <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="tel" value="" placeholder="Nhập số điện thoại" id="shipping_postcode" name="shipping_postcode" class="input-text ">
                                                </p>
                                                <div class="clear"></div>
                                            </div>
                                            <p id="order_comments_field" class="form-row notes">
                                                <label class="" for="order_comments">Ghi chú</label>
                                                <textarea cols="5" rows="2" placeholder="Nhập ghi chú" id="order_comments" class="input-text " name="order_comments"></textarea>
                                            </p>


                                        </div>

                                    </div>

                                </div>

                                <h3 id="order_review_heading">Chi tiết đơn hàng</h3>

                                <div id="order_review" style="position: relative;">
                                    <table class="shop_table">
                                        <thead>
                                            <tr>
                                                <th class="product-name">Sản phẩm</th>
                                                <th class="product-total">Đơn giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${sessionScope.gioHang.danhSachSanPhamMua()}" var="spm">
                                            <tr class="cart_item">
                                                <td class="product-name">
                                                    ${spm.tenSanPham} <strong class="product-quantity">× ${spm.soLuongMua}</strong> </td>
                                                <td class="product-total">
                                                    <span class="amount"><fmt:formatNumber value="${spm.donGiaKM}" type="currency"/> </span> </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="cart-subtotal">
                                                <th>Thành tiền</th>
                                                <td><span class="amount"><fmt:formatNumber value="${sessionScope.gioHang.tongTien()}" type="currency"/></span>
                                                </td>
                                            </tr>
                                            <tr class="shipping">
                                                <th>Phí giao hàng</th>
                                                <td>
                                                    Miễn phí
                                                    <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                                </td>
                                            </tr>
                                            <tr class="order-total">
                                                <th>Tổng tiền</th>
                                                <td><strong><span class="amount"><fmt:formatNumber value="${sessionScope.gioHang.tongTien()}" type="currency"/></span></strong> </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_bacs">
                                                <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                                <label for="payment_method_bacs">Thanh toán khi nhận hàng </label>
                                            </li>
                                            <li class="payment_method_cheque">
                                                <input type="radio" data-order_button_text="" value="cheque" name="payment_method" class="input-radio" id="payment_method_cheque">
                                                <label for="payment_method_cheque">Thanh toán bằng thẻ ATM nội địa </label>
                                            </li>
                                            <li class="payment_method_paypal">
                                                <input type="radio" data-order_button_text="Proceed to PayPal" value="paypal" name="payment_method" class="input-radio" id="payment_method_paypal">
                                                <label for="payment_method_paypal">PayPal <img alt="PayPal Acceptance Mark" src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png"><a title="What is PayPal?" onclick="javascript:window.open('https://www.paypal.com/gb/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;" class="about_paypal" href="https://www.paypal.com/gb/webapps/mpp/paypal-popup">What is PayPal?</a>
                                                </label>
                                                <div style="display:none;" class="payment_box payment_method_paypal">
                                                    <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="form-row place-order">
                                            <input type="submit" data-value="Place order" value="Đặt hàng" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </form>
                        </div>                       
                    </div>                    
                </div>
            </div>
        </div>
    </div>