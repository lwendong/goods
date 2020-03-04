<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<jsp:include page="logo.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=path%>/css/before/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//刷新验证码
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	//表单验证
	function checkForm(){
		var msg = document.getElementById("msg");
		var name = document.registerForm.name.value;
		var email = document.registerForm.email.value;
		if(name.length > 6){
			msg.innerText = "<spring:message code='nameCheck'></spring:message>！";
			return false;
		}
		//验证邮箱格式
		var reg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
		//邮箱不为空
		if(email != ""){
			//检测邮箱格式
			if(reg.test(email==false)){
				msg.innerText = "<spring:message code='emailCheck'></spring:message>！";
				return false;
			}
		}else{
			msg.innerText = "<spring:message code='emailCheckIn'></spring:message>！";
			return false;
		}
		
		//判断验证码是否为空
		var yzm = document.registerForm.code.value;
		if(yzm == ""){
			msg.innerText = "<spring:message code='verificationCodeCheck'></spring:message>";
			return false;
		}
		//检测两次密码是否一致
		var bpwd = document.registerForm.password.value;
		var rebpwd = document.registerForm.rebpwd.value;
		//两次密码不能为空
		if(bpwd != "" && rebpwd != ""){
			if(bpwd != rebpwd){
				msg.innerText = "<spring:message code='passwordCheck'></spring:message>！";
				return false;
			}
		}else{
			msg.innerText = "<spring:message code='passwordCheckIn'></spring:message>！";
			return false;
		}
		//提交表单
		document.registerForm.submit();
		
		return true;
	}
</script>
</head>
<body>
	<center>
		<div>
			<h2 class="re_lo"><spring:message code='membersReg'></spring:message></h2>
			<div class="regist">
				<form:form action="user/register" method="post" modelAttribute="user"  name="registerForm">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="one_list"><span class="star">*</span>
								<spring:message code='userName'></spring:message>：</td>
							<td>
								<input type="text" name="name" class="reg_input" />
							</td>
							<td width="25%"></td>
						</tr>
						<tr>
							<td class="one_list">&nbsp;</td>
							<td class="prompt" colspan="2">
								（<spring:message code='userNameCheck'></spring:message>！）</td>
						</tr>
						<tr>
							<td class="one_list"><span class="star">*</span>
								E-mail：</td>
							<td>
								<input type="text" name="email" class="reg_input" />
							</td>
							<td width="25%"></td>
						</tr>
						<tr>
							<td class="one_list">&nbsp;</td>
							<td class="prompt" colspan="2">
								（<spring:message code='emailCheck'></spring:message>。）</td>
						</tr>
						<tr>
							<td class="one_list"><span class="star">*</span> <spring:message code='password'></spring:message>：</td>
							<td><input type="password" name="password" class="reg_input" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="one_list">&nbsp;</td>
							<td colspan="2" class="prompt">
								（<spring:message code='passwordCheck'></spring:message>。）</td>
						</tr>
						<tr>
							<td class="one_list"><span class="star">*</span> <spring:message code='RepeatPassword'></spring:message>：</td>
							<td><input type="password" name="rebpwd" class="reg_input" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="one_list">&nbsp;</td>
							<td colspan="2" class="prompt">
								（<spring:message code='passwordMark'></spring:message>。）</td>
						</tr>				
						<tr>
							<td class="one_list"><span class="star">*</span> <spring:message code='verificationCode'></spring:message>：</td>
							<td colspan="2">
								<input type="text"  name="code" class="reg_input" />
								<img class="code_img" id="code" src="validateCode" /> 
								<a href="javascript:refreshCode();"><spring:message code='invisibility'></spring:message>！</a>
							</td>
						</tr>
						<tr>
							<td class="one_list">&nbsp;</td>
							<td class="subm"><div id="msg" class="msg">${msg}</div><br/><input id="text" type="button" name="button" onclick="checkForm()" value="<spring:message code='register'></spring:message>" class="reg_submit" /></td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</center>
</body>
</html>
