<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<jsp:include page="headuserController.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>商品详情</title>
<script src="<%=path%>/jquery/jquery.min.js"></script>
<link href="<%=path%>/css/before/usercontroller.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/before/goodsdetail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function goCart() {
		sessionStorage.setItem("jump", "cart");
		document.putcartform.submit();
	}
	function gofocus(gno) {
		window.location.href = "/shop/cart/focus?goodsId=" + gno;
	}
	var baselocation='<%=basePath%>';
	
	var goodsId='${goods.id }';
	function submitInfo(){
		var data=$("#textareaComment").val();
		var commentdata={};
		if(data!=null){
			commentdata.comment = data;
			commentdata.goodsId = goodsId;
			$.ajax({
		        url: baselocation + 'addComment',
		        type: 'post',
		        dateType:"json",
		        data:JSON.stringify(commentdata),
		        contentType: 'application/json; charset=UTF-8',
		        complete:function(XMLHttpRequest, textStatus) {
		    			// 通过XMLHttpRequest取得响应头，sessionstatus
		                var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
		                if (sessionstatus == "TIMEOUT") {
		                    var win = window;
		                    while (win != win.top){
		                        win = win.top;
		                    }
		                    win.location.href= XMLHttpRequest.getResponseHeader("CONTEXTPATH");
		                }else{
		                	window.location.reload();
		                }
	            }
		    });	
			
		}
	}
</script>
</head>
<body>
<div class="list">
		<div class="list-group">
			<!--用户中心左侧导航 start-->
			<div class="list-top">
				<ul class="goods_deta">
					<li class="list_return"><a href="before"><img alt="" src="img/return1.png"></a></li>
					<li class="list_li" color="#fff"><spring:message code="goodsDetail"></spring:message></li>
				</ul>
				
			</div>
			<div class="line"></div>
			<div class="list_bottom_gd">
				<form action="cart/putCart" name="putcartform" method="post">
					<div class="goods">
						<div class="goodsInfo">
							<input type="hidden" name="goodsId" value="${goods.id }"/>
							<img src="<%=imgPath%>/img/up/${goods.img}" width="230px" height="230px" />
						</div>
						<!--商品表述-->
						<div class="goods_desc">
							<div class="name">
								<h2>${goods.name }</h2>
							</div>
							<div class="goods_show">
								<ul>
									<li><span><spring:message code="price"></spring:message>:</span> <strong class="xj">${goods.price }</strong> <spring:message code="yuan"></spring:message></li>
									<li><span><spring:message code="discount"></spring:message>:</span>
										<strong class="xj">${goods.price } </strong><spring:message code="yuan"></spring:message>
									</li>
									<li><span><spring:message code="type"></spring:message>:</span> ${goods.typeName }</li>
									<li>
										<span><spring:message code="Purchasequantity"></spring:message>:</span>
										<input type="text" name="shoppingnum" class="good_txt" value="1" /> 
										<span class="xj">(<spring:message code="inventory"></spring:message>${goods.inventory })</span>
									</li>
								</ul>
							
								<p class="bottom10 top5">
									<img src="img/putcart.png" style="cursor: pointer" onclick="goCart(${goods.id})" />
									<span class="xj"><< <spring:message code="Clickaddcart"></spring:message>&nbsp;&nbsp;</span>
									<c:if test="${isFocus==1}">
										<input type="button" style="cursor: pointer" class="bnt2" 
											onclick="gofocus('${goods.id }')" value="<spring:message code="FocusonYes"></spring:message>"  disabled="disabled"/>
									</c:if>
									<c:if test="${isFocus!=1}"><!-- <a href="toLogin"></a> -->
										<input type="button" style="cursor: pointer" class="bnt2" 
										onclick="gofocus('${goods.id }')" value="<spring:message code="Focuson"></spring:message>" />
												
									</c:if>
									
								</p>${msg }
							</div>
						</div>
						<!--end-->
					</div>  
				</form>
				<div class="container">
					<div class="goods_com"><spring:message code="Productevaluation"></spring:message></div>
   					<c:forEach items="${commentVoBeanList}" var="comment" varStatus="status">
	                    <div class="media">
                             <h3 class="media-heading">${comment.name}</h3>
                             <p class="middle"><spring:message code="comment"></spring:message>：${comment.comment}</p>
                             <p>${status.index+1}<spring:message code="tower"></spring:message>&nbsp;&nbsp;
                             	<fmt:formatDate value="${ comment.time }" pattern="yyyy-MM-dd　HH:mm"/> <spring:message code="published"></spring:message>
                       		 </p>
	                    </div>
	                </c:forEach>
	                <div class="write"><spring:message code="Writeacomment"></spring:message></div>
	                <textarea class="com_text" id="textareaComment" rows="3" name="textarea"></textarea>
	                <button class="bnt" id="submit-info-btn" onclick="submitInfo()"><spring:message code="comment"></spring:message></button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
