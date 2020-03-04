<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="shopName"></spring:message></title>
<link href="<%=path%>/css/before/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function clearValue(){
		document.form.search.value = "";
	}
</script>
</head>
<body>
	<div class="box_lo">
		<div class="top">
			<div class="big_top">
				<div class="big_ul">
					
				</div>
			</div>
		</div>
		<div class="bottom_big">
			<div class="bottom_top">
				<!-- LOGO -->
				<div class="h_logo">
					<div class="return_im"><a href="before"><img alt="" src="img/return.png"></a></div>
					<spring:message code="shopName"></spring:message>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
