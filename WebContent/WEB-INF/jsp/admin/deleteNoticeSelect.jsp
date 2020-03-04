<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>selectGoods.jsp</title>
	<link href="css/admin/goods.css" type="text/css" rel="stylesheet">
	
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
	</script>
	<script type="text/javascript">
  		function checkDel(id){
  			if(window.confirm("是否删除该公告？")){
  				window.location.href = "/shop/admin/deleteNotice?id="+id;
  			}
  		}
  </script>
</head>
<body>
<div class="outer">
	<c:if test="${allNotices.size() == 0 }">
		没有公告。
	</c:if>
	<c:if test="${allNotices.size() != 0 }">
		<h2>| 公告列表</h2><a class="add" href="admin/toAddNotice">添加公告</a>
		<table border="1">
			<tr>
				<th width="350px">ID</th>
				<th width="650px">标题</th>
				<th width="300px">时间</th>
				<th width="100px">详情</th>
				<th width="100px">操作</th>
			</tr>
			<c:forEach items="${allNotices }" var="notice">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${notice.id }</td>
					<td>${notice.title }</td>
					<td>${notice.time }</td>
					<td><a href="admin/selectANotice?id=${notice.id }" target="_self">详情</a></td>
					<td>
						<a href="javascript:checkDel('${notice.id }')">
							<img title="删除该公告" alt="" src="<%=basePath%>/img/delete.png"/>
						</a>
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
	</c:if>
</div>
</body>
</html>