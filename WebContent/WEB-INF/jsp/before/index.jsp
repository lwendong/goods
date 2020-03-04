<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="home"></spring:message></title>
<link href="<%=path%>/css/before/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		function openNotice(url){
			window.open (url, '<spring:message code="announcement"></spring:message>', 'height=400, width=400, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');
		}
		function hiddenDiv(){
			 var tbox=document.getElementById("sale");   
			 tbox.style.display = tbox.style.display=="none"?"":"none";   
		}
		function hiddenPDiv(){
			 var tbox=document.getElementById("popular");   
			 tbox.style.display = tbox.style.display=="none"?"":"none";   
		}
</script>
</head>
<body>
	<div class="index">
		<div class="index_center">
			<div class="index_center_left">
				<!-- 销售排行 -->
				<div class="sale">
					<div class="sale_font" onclick="hiddenDiv()" ><img class="sa" alt="" src="img/sale.png"><h3  class="h" ><spring:message code="salesRank"></spring:message></h3></div>
					<div id="sale">
						<c:forEach items="${salelist }" var="sg" varStatus="status">
							<ul>
								<li><img class="top_img" src="img/top_${status.index+1 }.png" /></li>
								<li class="goods_img">
									<a href="goodsDetail?id=${sg.id }"> 
										<img title="${sg.description }" class="samllimg" alt="" src="<%=imgPath%>/img/up/${sg.img}" />
									</a>
								</li>
								<li class="goods_naAndPri">
									<div class="hi"><p><a href="goodsDetail?id=${sg.id }" >${sg.name }</a></p>
									</div>
									 <spring:message code="price"></spring:message>：<font class="f1"><spring:message code="moneyMark"></spring:message>${sg.price }<spring:message code="yuan"></spring:message></font>
								 </li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<!-- 人气排行 -->
				<div class="popular">
					<div class="sale_font" onclick="hiddenPDiv()"><img class="sa" alt="" src="img/sale.png"><h3 class="h"><spring:message code="top"></spring:message></h3></div>
					<div id="popular">
						<c:forEach items="${focuslist }" var="sg" varStatus="status">
							<ul>
								<li><img class="top_img" src="img/top_${status.index+1 }.png" /></li>
								<li class="goods_img">
								<a href="goodsDetail?id=${sg.id }"> 
									<img title="${sg.description }" class="samllimg" alt="" src="<%=imgPath%>/img/up/${sg.img}" /></a></li>
								<li class="goods_naAndPri">
								<div class="hi"><p><a href="goodsDetail?id=${sg.id }">${sg.name }</a></p></div>
								 <div class="f1"><spring:message code="price"></spring:message>：<spring:message code="moneyMark"></spring:message>${sg.price }<spring:message code="yuan"></spring:message></div>><br /></li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="index_center_middle">
				<!-- 商城图片 -->
				<img class="middle_img" alt="" src="img/yicang.jpg" />
				<!-- 最新商品 -->
				<div class="new">
					<div class="new_title">
						<h3><spring:message code="new"></spring:message></h3>
					</div>
					<div class="new_goods">
						<ul>
							<c:forEach items="${lastedlist }" var="sg">
								<li>
									<div>
										<p class="pic">
											<a href="goodsDetail?id=${sg.id }">
											<img class="new_show" title="${sg.description}" src="<%=imgPath%>/img/up/${sg.img}" /></a>
										</p>
										<p class="wz">
											<div class="hi">
												<a href="goodsDetail?id=${sg.id }">${sg.name }</a>
											</div></br>
											<p><em><spring:message code="presentPrice"></spring:message>:<spring:message code="moneyMark"></spring:message>${sg.price}</em></p>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- 公告栏 -->
			<div class="index_center_right">
				<div class="notice">
					<div class="notice_title">
						<h2><spring:message code="announcement"></spring:message></h2>
					</div>
					<div class="notice_con">
						<ul>
							<c:forEach items="${noticelist}" var="nt">
								<li><div class="hi"><a href="javascript:openNotice('/shop/selectANotice?noticeId=${nt.id }');">${nt.title }</a></div></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
