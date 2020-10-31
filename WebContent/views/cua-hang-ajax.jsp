<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi-VN" />
            <div class="row">
            <c:forEach items="${dssp}" var="sp">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <a href="ChiTietSanPhamServlet?idsp=${sp.id}"><img src="img/${sp.hinhAnh}" alt="img/${sp.hinhAnh}"></a>
                        </div>
                        <h2><a href="ChiTietSanPhamServlet?idsp=${sp.id}">${sp.tenSanPham}</a></h2>
                        <div class="product-carousel-price">
                            <ins><fmt:formatNumber value="${sp.donGiaKM}" type="currency"/></ins> <del><fmt:formatNumber value="${sp.donGia}" type="currency"/></del>
                        </div>  
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="javascript:themVaoGio('${sp.id}', '1');">Thêm vào giỏ</a>
                        </div>                       
                    </div>
                </div>
             </c:forEach>   
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                          <ul class="pagination">
	                          <c:if test="${tongSoTrang > 1}">
	                           	<li>
	                              <a href="javascript:trangSanPham('${(trang-1) > 0 ? trang-1 : 1}');" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                              </a>
	                            </li>
	                            
	                            <c:forEach var="i" begin="${viTriDau}" end="${viTriCuoi}" step="1">
		                            <c:if test="${i == trang}">
		                            	<li><a href="javascript:trangSanPham('${i}');" style="color: red; background-color: bisque;">${i}</a></li>
		                            </c:if>
		                            <c:if test="${i != trang}">
		                            	<li><a href="javascript:trangSanPham('${i}');">${i}</a></li>
		                            </c:if>
	                           	</c:forEach> 
	                           	
	                            <li>
	                              <a href="javascript:trangSanPham('${(trang+1) < tongSoTrang ? trang+1 : tongSoTrang}');" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                              </a>
	                            </li>
	                          </c:if>
                          </ul>
                        </nav>                        
                    </div>
                </div>
            </div>
        </div>
    </div>