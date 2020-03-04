<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户管理</title>
	<link href="css/admin/goods.css" type="text/css" rel="stylesheet">
	<script type="text/javascript">
		window.onload=function(){
			var state = '${state}';
			if(state != ""){
				alert(state);
				state = "";
			}
		}
		function checkDel(id){
			
  			if(window.confirm("是否改变该用户状态？")){
  				window.location.href="/shop/admin/upUserManager?id="+id;
  			}
  		}
	</script>
</head>
<body>
<div class="outer">
	<h2>| 用户列表</h2>
	<table border="1" >
		<tr>
			<th width="400px">用户ID</th>
			<th width="300px">用户E-mail</th>
			<th width="300px">用户密码</th>
			<th width="250px">用户状态</th>
			<th width="250px">状态操作</th>
		</tr>
		<c:forEach var="n" items="${userList}">
		<tr>
			<td>${n.id}</td>
			<td>${n.email}</td>
			<td>${n.password}</td>
			<td>${n.state}</td>
			<td>
				<c:if test="${n.state == 0 }">
					<a class="yes" href="javascript:void(0)" onclick="checkDel('${n.id}')">冻结用户</a>
				</c:if>
				<c:if test="${n.state == 1 }">
					<a class="yes" href="javascript:void(0)" onclick="checkDel('${n.id}')">解除冻结</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="page">
			&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;共${totalPage}页&nbsp;&nbsp;
			第${pageNo}页&nbsp;&nbsp;
			<c:url var="url_pre" value="admin/selectGoods">
				<c:param name="pageNo" value="${pageNo - 1 }"/>
			</c:url>
			<c:url var="url_next" value="admin/selectGoods">
				<c:param name="pageNo" value="${pageNo + 1 }"/>
			</c:url>
			<!-- 第一页没有上一页 -->
			<c:if test="${pageNo != 1 }">
				<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<!-- 最后一页，没有下一页 -->
			<c:if test="${pageNo != totalPage && totalPage != 0}">
				<a href="${url_next}">下一页</a>
			</c:if>
		</div>
</div>
</body>
</html>