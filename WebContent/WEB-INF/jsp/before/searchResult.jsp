<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="<%=path%>/css/before/head.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/jquery/jquery.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	$("#sr").css("display","none");
	var list= '${searchlist}';
	list.replace("[]","");
	if(list.length == 0){
		$('tr').find('th:eq(0)').hide(); 
		$("#myTable").hide();
		$("#sr").css("display","block");
	}
	
}
</script>
<title>搜索结果</title>
<link href="css/before/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="index">
	<div class="index_center">
		<div id="sr"><h1 class='result'><spring:message code="sr"></spring:message></h1></div>
		<table id="myTable" width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
			<tr>
				<th><spring:message code="goodsName"></spring:message></th>
				<th><spring:message code="goodsImag"></spring:message></th>
				<th><spring:message code="goodsPrice"></spring:message></th>
				<th><spring:message code="Goandsee"></spring:message></th>
			</tr>
			<tr>
				<td colspan="5" height="15px"
					style="border: 0 none; background: #FFF"></td>
			</tr>
			<c:forEach items="${searchlist }" var="mf">
				<tr>
					<td bgcolor="#ffffff" align="center">${mf.name }</td>
					<td align="center" bgcolor="#ffffff" height="60px"><img
						style="width: 50px; height: 50px;"
						src="img/up/${mf.img }" border="0" title="${mf.description }" />
					</td>
					<td bgcolor="#ffffff" align="center">${mf.price }</td>
					<td align="center" bgcolor="#ffffff">
						<a style="text-decoration: none;color:" href="goodsDetail?id=${mf.id}"><spring:message code="Goandsee"></spring:message></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>
