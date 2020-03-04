<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="home"></spring:message></title>
<link href="<%=path%>/css/before/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="notice_title">
		<h2>${notice.title }</h2>
	</div>
	<div class="notice_con">
		&nbsp;&nbsp;${notice.content }
	</div>
	<div class="notice_time"><b><fmt:formatDate value="${notice.time }" pattern="yyyy-MM-dd　HH:mm"/></b></div>
</body>
</html>
