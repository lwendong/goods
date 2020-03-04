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
<title><spring:message code="OrderConfirmation"></spring:message></title>
<link href="<%=path%>/css/before/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitorder(){
		if(window.confirm("<spring:message code='confirmTheInformation'></spring:message>")){
			window.location.href="/shop/order/orderSubmit"
			return true;
		}
		return false;
	}
</script> 
</head>
 <body>
	<div class="nFlowBox">
  		<form action="" method="post">
    		<h6><spring:message code="shopList"></spring:message></h6>
            <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
	            <tr>
	              <th bgcolor="#ffffff"><spring:message code="shopName"></spring:message></th>
	              <th bgcolor="#ffffff"><spring:message code="price"></spring:message></th>
	              <th bgcolor="#ffffff"><spring:message code="buyNum"></spring:message></th>
	              <th bgcolor="#ffffff"><spring:message code="subtotal"></spring:message></th>
	            </tr> 
	           <c:forEach var="ce" items="${cartlist}"> 
	            <tr>
	              <td bgcolor="#ffffff" align="center">
	                  	${ce.goodsName}
	              </td>
	              <td align="center" bgcolor="#ffffff">
	              	<img class="goods_img" src="<%=path%>/img/up/${ce.goodsImg}" title="${ce.goodsDescription}" />
	              </td>
	              <td align="center" bgcolor="#ffffff">
	                ${ce.orderNum}
	              </td>
	              <td align="center" bgcolor="#ffffff"><spring:message code="moneyMark"></spring:message>&nbsp;${ce.smallsum}&nbsp;<spring:message code="yuan"></spring:message></td>
	            </tr>
	       	  </c:forEach>
	       	  	<tr>
	       	  		<td class="td_right" colspan="4" align="right">
	       	 			<spring:message code="due"></spring:message>
	       	 			<font class="pricetype" size="5" color="red"><spring:message code="moneyMark"></spring:message>&nbsp;${total}&nbsp;<spring:message code="yuan"></spring:message></font>  	
	              </td>
	          </tr>   	
	        </table>   
	        <div align="center" style="margin:45px auto;">
	       		 <img title="<spring:message code="pay"></spring:message>" style="cursor:pointer;"  onclick="submitorder()" src="<%=path%>/img/bnt_subOrder.png" />
	    	</div> 
	    </form>
	</div>
</body>
</html>




