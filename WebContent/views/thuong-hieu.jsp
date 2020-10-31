<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="brands-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="brand-wrapper">
					<div class="brand-list">
						<c:forEach items="${dsth}" var="th">
							<img src="img/${th.hinhAnh}" alt="img/${th.hinhAnh}">
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End brands area -->