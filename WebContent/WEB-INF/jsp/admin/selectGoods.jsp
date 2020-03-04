<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>商品管理</title>
	<link href="<%=basePath%>css/admin/goods.css" type="text/css" rel="stylesheet">
	<script src="<%=basePath%>jquery/jquery.min.js"></script>
</head>
<body>
<div class="outer">
	<h2>| 商品列表</h2><a class="add" href="admin/toAddGoods">添加商品</a>
	<c:if test="${allGoods.size() == 0 }">
		您还没有商品。
	</c:if>
	<c:if test="${allGoods.size() != 0 }">
		<table border="1" bordercolor="#343E4A">
			<tr>
				<th width="100px">选择删除</th>
				<th width="300px">ID</th>
				<th width="400px">名称</th>
				<th width="150px">价格</th>
				<th width="150px">库存</th>
				<th width="200px">图片</th>
				<th width="100px">详情</th>
				<th width="100px">删除</th>
			</tr>
			<c:forEach items="${allGoods }" var="goods">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td><input type="checkbox" name="checkbox1" value="${goods.id }"/></td>
					<td>${goods.id }</td>
					<td>${goods.name }</td>
					<td>${goods.price }</td>
					<td>${goods.inventory }</td>
					<td><img alt="" width="50" height="50"
					src="<%=imgPath%>/img/up/${goods.img}"/></td>
					<td><a href="<%=basePath%>admin/selectGoodsOne?id=${goods.id }" target="_self">详情</a></td>
					<td>
						<a onclick="deleteOne('${goods.id }')" target="_blank">
							<img title="删除该商品" alt="" src="<%=basePath%>img/delete.png"/>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="page">
			<button class="dele" onclick="del()">删除</button>
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
		function del(){
			debugger
			if(confirm("您确定删除吗?")){
				var p ='<%=path%>';
				 var selectItem = [];
				 var ck = $("input[type='checkbox']:checked");
				 for(var i = 0; i<ck.length; i++){
					 if(i != ck.length-1){
						 selectItem += $(ck[i]).val() + ",";
					 }else{
						 selectItem += $(ck[i]).val();
					 }
				}
				 if(ck.length == 0){
					 alert("您没有选中任何数据");
				 }else{
					 $.ajax({
					  url: p+"/admin/deleteGoods",
					  data:{"goodsIds": selectItem},
					  type: "post",
					  success: function(data){
					    if(data.message==0){
					    	alert("删除成功");
					    }else{
					    	var a = "以下商品有关联，不允许删除！"+data.message;
					    	alert(a);
					    }
					    window.location.reload();
					  },
				        error: function (XMLHttpRequest, textStatus, errorThrown) {
				            console.log(textStatus, errorThrown);
				            alert("系统繁忙，请稍后再操作！");
				        }
					});
				 }
			}
		}
		function deleteOne(goodId){
			debugger
			var p ='<%=path%>';
			if(confirm("您确定删除吗?")){
				$.ajax({
			        url: p+'/admin/deleteGoodsOne?goodsId='+goodId,
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
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
	</script>
</body>
</html>