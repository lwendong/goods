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
<title>订单详情</title>

</head>
<body>
	<div class="big">
		<div class="order">
			<h3><spring:message code="orderDetail"></spring:message></h3> 
		</div>
		<div class="nFlowBox" style="height:500px; overflow-y: scroll;">
			<table width="99%" align="center" border="0" cellpadding="5"
				cellspacing="1" bgcolor="#dddddd" >
				<tr>
					<th><spring:message code="goodsSerialnumber"></spring:message></th>
					<th><spring:message code="shopName"></spring:message></th>
					<th><spring:message code="goodsImag"></spring:message></th>
					<th><spring:message code="goodsPrice"></spring:message></th>
					<th><spring:message code="buyNum"></spring:message></th>
				</tr>
				<tr>
					<td colspan="5" height="15px"
						style="border: 0 none; background: #FFF"></td>
				</tr> 
				<c:forEach var="mf" items="${myOrderDetail}"> 
					<tr>
						<td bgcolor="#ffffff" align="center">${mf.goodId}</td>
						<td bgcolor="#ffffff"  align="center">${mf.goodsName}</td>
						<td align="center" bgcolor="#ffffff" height="60px"> <img
								style="width: 50px; height: 50px;"
								src="<%=imgPath%>/img/up/${mf.goodsImg}" border="0"
								title="${mf.goodsName}" /> </td>
						<td align="center" bgcolor="#ffffff">${mf.goodsPrice}</td>
						<td align="center" bgcolor="#ffffff">${mf.orderNum}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>