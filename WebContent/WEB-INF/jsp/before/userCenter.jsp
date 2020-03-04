<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code='userCenter'></spring:message></title>
<link href="<%=path%>/css/before/usercontroller.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="user_center">
		<div class="oder_name">
			<h4><img class="center_oAndf" alt="" src="img/order.png"> <spring:message code='myOrder'></spring:message></h4>
		</div>
		<div>
			<div class="order_list">
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th><spring:message code='orderNo'></spring:message></th>
						<th><spring:message code='orderMoney'></spring:message></th>
						<th><spring:message code='orderTime'></spring:message></th>
						<th><spring:message code='orderState'></spring:message></th>
						<th><spring:message code='orderDetails'></spring:message></th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mo" items="${myOrder}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mo.id}</td>
							<td bgcolor="#ffffff"  align="center">${mo.due}</td>
							<td align="center" bgcolor="#ffffff">${mo.time}</td>
							<td bgcolor="#ffffff"  align="center">
							<c:if test="${mo.state == 0}" >
							<spring:message code='nonPayment'></spring:message>&nbsp;&nbsp;
							<a style="text-decoration: none;" class="f6" href="<%=path%>/order/pay?ordersn=${mo.id}"><spring:message code='payment'></spring:message></a>
							</c:if>
							<c:if test="${mo.state == 1}" ><spring:message code='accountPaid'></spring:message></c:if>
							</td>
							<td align="center" bgcolor="#ffffff">
							<a style="text-decoration: none;" class="f6" href="<%=path%>/orderDetail?orderId=${mo.id}" target="_self"><spring:message code='details'></spring:message></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="location ared">
			<h4><img class="center_oAndf" alt="" src="<%=path%>/img/focus.png"> <spring:message code='myAttention'></spring:message></h4>
		</div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th><spring:message code='shopNo'></spring:message></th>
						<th><spring:message code='shopName'></spring:message></th>
						<th><spring:message code='shopImg'></spring:message></th>
						<th><spring:message code='shopPrice'></spring:message></th>
						<th><spring:message code='goLook'></spring:message></th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mf" items="${myFocus}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.id}</td>
							<td bgcolor="#ffffff"  align="center">${mf.name}</td>
							<td align="center" bgcolor="#ffffff" height="60px"> <img
									style="width: 50px; height: 50px;"
									src="<%=path%>/img/up/${mf.img}" border="0"
									title="${mf.name}" /> </td>
							<td align="center" bgcolor="#ffffff">${mf.price}</td>
							<td align="center" bgcolor="#ffffff">
								<a style="text-decoration: none;" class="f6" href="<%=path%>/goodsDetail?id=${mf.id}" target="_blank"><spring:message code='goLook'></spring:message></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>