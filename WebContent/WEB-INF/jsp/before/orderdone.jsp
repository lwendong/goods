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
<title><spring:message code='orderSuccess'></spring:message></title>
	<script type="text/javascript">
		//确定按钮
		function gogo(){
			document.payForm.submit();
		}
	</script>
</head>
<body>
<div class="nFlowBox">
   <h2 style="text-align:center; height:30px; line-height:30px;">
   		<spring:message code="successMessage"></spring:message>:
   		<font style="color:red" size='5'>${ordersn}</font>
   </h2><br/>
   <center>
	   <form action="order/pay" method="post" name="payForm">
        	<input type="hidden" name="ordersn" value="${ordersn}"/>
        	<input type="image" src="images/before/Chinapay_logo.jpg" onclick="gogo()"/>
	   </form>
   </center>
</div>
 </body>
</html>
