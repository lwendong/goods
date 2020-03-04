<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="logo.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><spring:message code="loginPage"></spring:message></title>
	<link href="<%=path%>/css/before/login.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	
	</style>
	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.loginform.submit();
		
		
	}
	//取消按钮
	function cancel(){
		document.loginform.action="";
	
	}
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	</script>
  </head>
  <body>
  	<center>
  		<h2 class="login_text"><spring:message code="login"></spring:message></h2>
	  	<form:form action="user/login" method="post" modelAttribute="user"  name = "loginform">
		<table>
		
			<tr>
				<td>E-Mail：</td>
				<td><input type="text" name="email"  class="textSize"/></td>
			</tr>
			<tr>
				<td><spring:message code="password"></spring:message>：</td>
				<td><input type="password" name="password" class="textSize"/></td>
			</tr>		
			<tr>
				<td><spring:message code="verificationCode"></spring:message>：</td>
				<td><input type="text" name="code" class="textSize"/></td>
			</tr>		
			<tr class="v_code">
				<td >
					<img class="v_img" id="code" src="validateCode"/>
				</td>
				<td class="ared">
					<a href="javascript:refreshCode();"><font color="blue"><spring:message code="invisibility"></spring:message>！</font></a>
				</td>
			</tr>		
			<tr >
				<td colspan="2">
					<div id="msg" class="msg">${msg}</div>
				</td>
			</tr>
			<tr>
				<td class="but" colspan="2">
					<input type="image" src="img/gogo.png" onclick="gogo()">
					<input type="image" src="img/cancel.png" onclick="cancel()">
				</td>
			</tr>
		</table>
		</form:form>
		
	</center>
  </body>
</html>
