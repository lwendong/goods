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
<title><spring:message code="home"></spring:message></title>
<link href="<%=path%>/css/before/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function clearValue(){
		document.myForm.mykey.value = "";
	}
</script>
</head>
<body>
	<div class="top">
		<div class="big_top">
			<div class="big_ul">
				
				<ul>
					<li class="user_a">
						<c:if test="${user!=null}"><spring:message code="welcome"></spring:message> ${user.name }</c:if>
						<c:if test="${user==null}"><a href="toLogin"><spring:message code="login"></spring:message></a></c:if> |
					</li>
					<li class="user_a">
						&nbsp;<a href="toRegister"><spring:message code="register"></spring:message></a> |
					</li>
					<li class="user_a">
						&nbsp;<a href="userControllerCenter"><spring:message code="userCenter"></spring:message></a>
					</li>
					
				</ul>
				<c:if test="${user!= null}">	
					<div class="exit"><a href="user/exit"><spring:message code="exit"></spring:message></a></div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
