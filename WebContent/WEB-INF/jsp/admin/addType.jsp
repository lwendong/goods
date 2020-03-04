<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/admin/type.css" type="text/css" rel="stylesheet">
<script src="jquery/jquery.min.js"></script>
</head>
<body>
<div class="outer">
	<form action="<%=path%>/admin/addType" method="post">
		<h2>| 类型添加</h2>
		类型名称: <input class="te" type="text" name="name"/>&nbsp;&nbsp;&nbsp;&nbsp;
		类型code: <input class="te" type="text" name="code"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="but" type="submit" value="添加"/>
	</form>
	<c:if test="${allTypes.size() == 0 }">
		您还没有类型。
	</c:if>
	<c:if test="${allTypes.size() != 0 }">
		<h2>| 商品类型</h2>
		<table border="1" >
			<tr>
				<th>类型ID</th>
				<th>类型名称</th>
				<th>类型code</th>
				<th>删除操作</th>
			</tr>
			<c:forEach items="${allTypes }" var="goodsType">
				<tr>
					<td>${goodsType.id }</td>
					<td>${goodsType.name }</td>
					<td>${goodsType.code }</td>
					<td>
						<a href="javascript:void(0);" class="dele" onclick="deleteTy('${goodsType.id}')">
							<img title="删除该商品" alt="" src="<%=basePath%>/img/delete.png"/>
						</a>
						<%-- <a onclick="deleteTy(${goodsType.id}) ">
							<img title="删除该商品类型" alt="" src="<%=basePath%>/img/delete.png"/>
						</a> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="typepage">
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
	<script type="text/javascript">
		
		function deleteTy(typeId){
			debugger
			var p ="<%=path%>";
			if(confirm("您确定删除吗?")){
				$.ajax({
			        url: p+'/admin/deleteType?id='+typeId,
			        type: 'post',
			        dateType:"json",
			        contentType: 'application/json; charset=UTF-8',
			        success: function (data) {
			        	alert(data.message);
			        	window.location.reload();
			        },
			        error: function (XMLHttpRequest, textStatus, errorThrown) {
			            console.log(textStatus, errorThrown);
			            alert("系统繁忙，请稍后再操作！");
			        }
			    });	
			}		
		}
	</script>
</body>
</html>