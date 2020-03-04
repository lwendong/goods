<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>addNotice.jsp</title>
<link href="css/admin/goodsdetail.css" type="text/css" rel="stylesheet">
</head>    
<body>
	<form:form action="admin/addNotice" method="post" modelAttribute="notice">
		<h2>| 添加公告</h2>
		<table >
			
			<tr>
				<td class="one">标题<font color="red">*</font></td>
				<td class="tow">
					<form:input class="in" path="title"/>
				</td>
			</tr>
			<tr>
				<td class="one1">内容<font color="red">*</font></td>
				<td class="tow1">
					<form:textarea class="area" path="content"/>
				</td>
			</tr>
			<tr>
				<td class="one" align="center">
					<input class="but1" type="submit" value="提交"/>
				</td>
				<td class="but" align="left">
					<input class="but1" type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
