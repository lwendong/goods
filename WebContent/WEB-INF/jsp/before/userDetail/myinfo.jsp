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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=path%>/jquery/jquery.min.js"></script>

<link href="<%=path%>/css/before/myinfo.css" rel="stylesheet" type="text/css" />
<title>我的信息</title>

</head>
<body>
<fieldset>
	<legend>
		<span>我的信息</span>
	</legend>
		
		<c:forEach items="${user}" var="buser" varStatus="status">	
			<table class="myinfo" id="table">
				<tr>
					<th>编号:</th>
					<td>${buser.id}</td>
				</tr>
				<tr>
					<th>名称:</th>
					<td>${buser.name}</td>
				</tr>
				<tr>
					<th>电子邮箱:</th>
					<td>${buser.email}</td>
				</tr>
				<tr>
					<th>密码:</th>
					<td>${buser.password}</td>
				</tr>
			</table>
		</c:forEach>
</fieldset>

</body>
</html>