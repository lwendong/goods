<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>addGoods.jsp</title>
<link href="css/admin/goodsdetail.css" type="text/css" rel="stylesheet">
</head>    
<body>
	<form:form action="admin/addAupGoods" method="post" modelAttribute="goods" enctype="multipart/form-data">
		<table>
			<h2>| 添加商品</h2>
			<form:hidden path="id"/>
			<tr>
				<td class="one"><font color="red">*</font>名称:</td>
				<td class="tow">
					<form:input class="in" path="name"/>
				</td>
			</tr>
			<tr>
				<td class="one"><font color="red">*</font>描述:</td>
				<td class="tow">
					<form:input class="in" path="description"/>
				</td>
			</tr>
			<tr>
				<td class="one"><font color="red">*</font>原价:</td>
				<td class="tow">
					<form:input class="in" path="price"/>
				</td>
			</tr>
			<tr>
				<td class="one"><font color="red">*</font>库存:</td>
				<td class="tow">
					<form:input class="in" path="inventory"/>
				</td>
			</tr>
			<tr>
				<td class="one"><font color="red">*</font>图片:</td>
				<td class="tow">
					<input class="in" type="file" name="fil"/>
				</td>
			</tr>
			<tr>
				<td class="one"><font color="red">*</font>类型:</td>
				<td class="tow">
					<form:select class="in" path="typeCode">
         				<form:options items="${goodsType}" itemLabel="name" itemValue="id"/>
   					</form:select>
				</td>
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
