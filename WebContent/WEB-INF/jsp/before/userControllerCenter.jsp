<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<jsp:include page="headuserController.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=path%>/css/before/usercontroller.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/jquery/jquery.min.js"></script>
<title><spring:message code="userCenter"></spring:message>用户中心</title>
<script type="text/javascript">
	window.onload = function(){
		debugger
		var jump = sessionStorage.getItem("jump");
		if(jump==null){
			$('#iframe').attr('src', "userMyInfo");
		}else{
			sessionStorage.removeItem("jump");
			$('#iframe').attr('src', "cart/selectCart");
		}
		
	}
</script>
</head>
<body>
	<div class="list">
		<div class="list-group">
			<!--用户中心左侧导航 start-->
			<div class="list-top">
				<ul>
					<li class="list_return"><a href="before"><img alt="" src="img/return1.png"></a></li>
					<li class="list_li"><a href="userMyInfo" target="content-nav" class="list-group-item active"><spring:message code="myInformation"></spring:message></a></li>
					<li class="list_li"><a href="myinfoManager" target="content-nav" class="list-group-item"><spring:message code="myInformationManager"></spring:message></a></li>
					<!-- <li class="list_li"><a href="myinfoPassword" target="content-nav" class="list-group-item">修改我的密码 </a></li> -->
					<li class="list_li"><a href="userCenter" target="content-nav" class="list-group-item"><spring:message code="Myordermanagement"></spring:message></a></li>
					<li class="list_li"><a href="cart/selectCart" target="content-nav" class="list-group-item"><spring:message code="Checkoutmyshoppingcart"></spring:message></a></li>
					<li class="list_li"><a href="myComment" target="content-nav" class="list-group-item"><spring:message code="Checkoutmycomments"></spring:message></a></li>
				</ul>
				
			</div>
			<div class="line"></div>
			<div class="list_bottom">
				<iframe id="iframe" name="content-nav" frameborder="0" scrolling="auto" width="100%" height="800" ></iframe>  						
			</div>
		</div>
	</div>
</body>
</html>