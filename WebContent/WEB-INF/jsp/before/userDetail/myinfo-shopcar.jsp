<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=path%>/jquery/jquery.min.js"></script>
<title>我的信息</title>
<link href="<%=path%>/css/before/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//确认
function pay(){
	window.location.href="/shop/cart/orderConfirm";
}


//隐藏table
window.onload = function(){
	debugger
	$("#sr").css("display","none");
	var list= '${cartlist}';
	list = eval(list);
	if(list.length == 0){
		/* $('tr').find('th:eq(0)').hide();  */
		$("#mytable").hide();
		$("#sr").css("display","block");
	}
	
}
</script>
</head>
<body>
	<div class="cart_big">
		<div id="sr" align="center">
			<h1 class='result'>
				购物车为空
				<a class="a_text" href="before" target="_parent"> 
					<img src="img/continue.png" alt="continue" /> 继续购物
				</a>
			</h1>
		</div>
		<table id="mytable" class="goods_info_table" cellpadding="5" cellspacing="1" >
			<tr>
				<th>商品信息</th>
				<th>单价（元）</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
			<tr>
				<td class="cart_space" colspan="5"></td>
			</tr> 
			<!-- 这里使用了jstl标签-->
			<c:forEach var="ce" items="${cartlist}"> 
				<tr>
					<td class="goods_info">
						<a class="a_text" href="goodsDetail?id=${ce.goodsId}"> 
							<img class="goods_img" src="img/up/${ce.goodsImg}" title="${ce.goodsDescription}" />
						</a><br/>
						<a class="a_text" href="goodsDetail?id=${ce.goodsId}" class="f6">${ce.goodsName}</a>
					</td>
					<td class="goods_info_115" >
						<span>${ce.goodsPrice}</span>
					</td>
					<td class="goods_info_115" >
						${ce.orderNum}
					</td>
					<td class="goods_info_115">
						￥&nbsp;<span>${ce.smallsum}</span>&nbsp;
					</td>
					<td class="goods_info_185">
						<a class="a_text" style="text-decoration: none;" href="/shop/cart/deleteAgoods?id=${ce.goodsId}&num=${ce.orderNum}" onClick="return confirm('确定删除?');" title="删除">
						<img src="img/delete.png" />
						</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="goods_info_right" colspan="4" height="41px;" />
				<font class="total">
					购物金额总计(不含运费) ￥&nbsp;${total}元
				</font></td>
				<td class="goods_info" >
					<a href="/shop/cart/clear" onClick="return confirm('确定清空购物车?');"><input type="button" value="清空购物车" class="bnt_clear"/></a>
				</td>
			</tr>
			<tr>
				<td class="goods_info_right" colspan="4">
					<a class="a_text" href="before" target="_parent"> 
						<img src="img/continue.png" alt="continue" /> 继续购物
					</a>
				</td>
				<td class="goods_info">
					<div class="a_text_check" onclick="pay()" >
						<img title="结算" src="img/check.png" alt="checkout" />
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>