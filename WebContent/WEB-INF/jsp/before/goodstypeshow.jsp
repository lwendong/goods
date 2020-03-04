<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="home"></spring:message></title>
<link href="<%=path%>/css/before/typeshow.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
</head>
<body>
<div class="index">
	<div class="index_center">
		<div class="index_center_middle">
			<div class="new">
				<div class="new_goods">
					<ul>
						<c:forEach items="${goodsBytype }" var="sg">
							<li>
								<div>
									<p class="pic">
										<a href="goodsDetail?id=${sg.id }">
											<img title="${sg.description}" src="img/up/${sg.img}" />
										</a>
									</p>
									<p class="wz">
										<div class="hi">
											<a href="goodsDetail?id=${sg.id }">${sg.name }</a>
										</div></br>
										<p><em><spring:message code="presentPrice"></spring:message>:<spring:message code="moneyMark"></spring:message>${sg.price}</em></p>
									</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
