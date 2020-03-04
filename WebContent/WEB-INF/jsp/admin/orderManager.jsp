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
    <title>订单管理</title>
	<link href="css/admin/goods.css" type="text/css" rel="stylesheet">
	<script type="text/javascript">
		function changeColor(obj){
			obj.className="bgcolor";
		}
		function changeColor1(obj){
			obj.className="";
		}
		function checkDel(id){
  			if(window.confirm("是否删除该订单？")){
  				window.location.href="/shop/admin/deleteorderManager?id="+id;
  			}
  		}
	</script>
</head>
<body>
<div class="outer">
	<h2>| 订单列表</h2>
	<table border="1">
		<tr>
			<th width="350px">订单编号</th>
			<th width="300px">用户ID</th>
			<th width="300px">订单金额</th>
			<th width="100px">订单状态</th>
			<th width="300px">订单日期</th>
			<th width="180px">操作</th>
		</tr>
		<c:forEach var="n" items="${orderList}">
		<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
			<td>${n.id}</td>
			<td>${n.userId}</td>
			<td>${n.payment}</td>
			<td><c:if test="${n.state == 0}" >未付款</c:if><c:if test="${n.status == 1}" >已付款</c:if></td>
			<td>${n.time}</td>
			<td>
				<c:if test="${n.state == 0}" >
					<a href="javaScript:checkDel('${n.id}')">
						<img title="删除该订单" alt="" src="<%=basePath%>/img/delete.png"/>
					</a>
				</c:if>
				<c:if test="${n.state != 0}" >
					订单已完成支付
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