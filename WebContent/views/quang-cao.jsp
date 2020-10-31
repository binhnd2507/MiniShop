<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="slider-area">
	<!-- Slider -->
	<div class="block-slider block-slider4">
		<ul class="" id="bxslider-home4">
			<c:forEach items="${dsqc}" var="qc">
				<li><img src="img/${qc.hinhAnh}" alt="Slide">
					<div class="caption-group">
						<h2 class="caption title">
							<span class="primary"><strong>${qc.thongDiep}</strong></span>
						</h2>
						<h4 class="caption subtitle">${qc.thongDiep}</h4>
						<a class="caption button-radius" href="#"><span class="icon"></span>Chi
							tiết</a>
					</div></li>
			</c:forEach>
		</ul>
	</div>
	<!-- ./Slider -->
</div>
<!-- End slider area -->