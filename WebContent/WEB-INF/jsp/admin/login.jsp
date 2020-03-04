<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登录</title>
<link href="<%=path%>/css/admin/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//确定按钮
function gogo(){
	document.forms[0].submit();
}
//取消按钮
function cancel(){
	document.forms[0].action = "";
}
</script>
  </head>
  <body>
  	<div class="admin_login">
  		<div class="login">
	  		<form:form action="admin/login" modelAttribute="user" method="post">
	  			<div class="admin_lo">
	  				<ul>
	  					<li class="logo_li"><h1>商品购物网站<br/>后台管理</h1></li>
	  					<li class="login_li">
	  						<h2>登录</h2><br/><br/>
	  						姓名：<form:input path="name" cssClass="textSize"/><br/><br/>
	  						密码：<form:password path="password" cssClass="textSize" maxlength="20"/><br/><br/>
	  						${m}<br/><br/>
	  						<input class="but" type="button" value="登录" onclick="gogo()" >
	  						&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="but" type="button" value="取消" onclick="cancel()" >
	  					</li>	  					
	  				</ul>
	  			</div>
			</form:form>
		</div>
  	</div>
	
  </body>
</html>
