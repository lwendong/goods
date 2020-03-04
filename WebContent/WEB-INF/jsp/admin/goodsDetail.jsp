<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path%>/css/admin/goodsdetail.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<h2>| 商品详情</h2>
	<table>
		<tr>
			<td class="one">商品ID:</td>
			<td class="tow">
				${goods.id }
			</td>
		</tr>
		<tr>
			<td class="one">名称:</td>
			<td class="tow">
				${goods.name }
			</td>
		</tr>
		<tr>
			<td class="one">原价:</td>
			<td class="tow">
				${goods.price }
			</td>
		</tr>
		<tr>
			<td class="one">库存:</td>
			<td class="tow">
				${goods.inventory }
			</td>
		</tr>
		<tr>
			<td class="one_img">图片:</td>
			<td class="tow_img">
				<c:if test="${goods.img != '' }">
					<img alt="" width="250" height="250"
					src="<%=path%>/img/up/${goods.img}"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="one">类型:</td>
			<td class="tow">
				${goods.typeName }
			</td>
		</tr>
		<tr>
			<td class="one">描述:</td>
			<td class="tow">
				${goods.description }
			</td>
		</tr>
		<tr>
			<td class="one">商品销售数:</td>
			<td class="tow">
				${goods.sellNum }
			</td>
		</tr>
		<tr>
			<td class="one">商品人气数:</td>
			<td class="tow">
				${goods.popularityNum }
			</td>
		</tr>
		<tr>
			<td class="one">创建时间:</td>
			<td class="tow">
				<fmt:formatDate value="${goods.createTime }" pattern="yyyy-MM-dd　HH:mm"/>
			</td>
		</tr>
		<tr>
			<td class="one">更新时间:</td>
			<td class="tow">
				<fmt:formatDate value="${goods.updateTime }" pattern="yyyy-MM-dd　HH:mm"/>
			</td>
		</tr>
	</table>
	<div class="upd"><a href="<%=path%>/admin/updateJsp?goodsId=${goods.id }">修改</a></div>
</body>
</html>