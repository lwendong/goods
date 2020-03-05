<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=path%>/css/before/myinfo-manager.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/jquery/jquery.min.js"></script>
<title>我的信息</title>
</head>
<body>
<fieldset>
	<legend>
		<span>我的评论</span>
	</legend>
	<table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
        <tr>
          <th bgcolor="#ffffff"><spring:message code="oparetion"></spring:message></th>
          <th bgcolor="#ffffff"><spring:message code="commentId"></spring:message></th>
          <th bgcolor="#ffffff"><spring:message code="goodsName"></spring:message></th>
          <th bgcolor="#ffffff"><spring:message code="Comment"></spring:message></th>
          <th bgcolor="#ffffff"><spring:message code="time"></spring:message></th>
        </tr> 
       <c:forEach var="cb" items="${commentVoBeanList}"> 
        <tr>
          <td bgcolor="#ffffff" align="center">
              	<button class="btn"  onclick="deleteComment('${cb.id}')"><spring:message code="delete"></spring:message></button>
          </td>
          <td align="center" bgcolor="#ffffff">
          	${cb.id}
          </td>
          <td align="center" bgcolor="#ffffff">
          	${cb.goodsName}
          </td>
          <td align="center" bgcolor="#ffffff">
            <span class="c">${cb.comment}</span>
          </td>
          <td align="center" bgcolor="#ffffff"><fmt:formatDate value="${cb.time}" pattern="yyyy-MM-dd　HH:mm"/> </td>
        </tr>
   	  </c:forEach>  	
    </table>  
</fieldset>
<div class="modal" id="myModal">
    <div class="modal-header">
      <h3 class="modal-title"><spring:message code="updatecomment"></spring:message></h3>
    </div>
    <input type="hidden" id="id">
    <div class="modal-body">
    	<table>
    		<tr>
    			<td class="table_one"><spring:message code="Serialnumber"></spring:message>:</td>
    			<td><input type="text" class="form-control" id="commentid"></td>
    		</tr>
    		<%-- <tr>
    			<td class="table_one"><spring:message code="goodsSerialnumber"></spring:message>:</td>
    			<td><input type="text" class="form-control" id="goodid"></td>
    		</tr> --%>
    		<tr>
    			<td class="table_one"><spring:message code="recomment"></spring:message>:</td>
    			<td><input type="text" class="form-control" id="comment"></td>
    		</tr>
    	</table>
		<button class="btn-info"  title="loadReport" onclick="updateComment()"><spring:message code="update"></spring:message></button>
    </div>
</div>
<script type="text/javascript">
	function loadReportFormatter(value, row, index) {//格式化
	    var id = value;
	    var result = "";
	    result += '<button class="btn-info"  title="loadReport" onclick="updateComment(' + id + ')"><spring:message code="update"></spring:message></button>';
	    result += '<button class="btn"  onclick="deleteComment(' + id + ')"><spring:message code="delete"></spring:message></button>';
	    return result;
	}
	function updateComment(){
		debugger
		var commentid = $("#commentid").val();
		var comment = $("#comment").val();
		$.ajax({
	        url:'/shop/updateCommentByid',
	        type: 'post',
	        dateType:"json",
	        data:JSON.stringify({
	        	"commentId":commentid,
	        	"comment":comment
	        }),
	        contentType: 'application/json; charset=UTF-8',
	        success: function (retuslt) {
	        	window.location.reload();
	        	/* $("#commentid").val(retuslt.id);
	        	$("#goodid").val(retuslt.goodid);
	        	$("#comment").val(retuslt.comment); */
	        	//alert(JSON.stringify(retuslt));
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            console.log(textStatus, errorThrown);
	            alert("系统繁忙，请稍后再操作！");
	        }
	    });		
	}
	function deleteComment(id){
		$.ajax({
	        url:'/shop/deleteComment',
	        type: 'post',
	        dateType:"json",
	        data:id,
	        contentType: 'application/json; charset=UTF-8',
	        success: function (retuslt) {
	        	window.location.reload();
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            console.log(textStatus, errorThrown);
	            alert("系统繁忙，请稍后再操作！");
	        }
	    });		
	}
	
	function updateInfo(){
		var data={};
		data.comment=$("#comment").val();
		data.id=$("#commentid").val();
		$.ajax({
	        url:'/updateCommentByid',
	        type: 'post',
	        dateType:"json",
	        data:JSON.stringify(data),
	        contentType: 'application/json; charset=UTF-8',
	        success: function (retuslt) {
	        	window.location.reload();
	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            console.log(textStatus, errorThrown);
	            alert("系统繁忙，请稍后再操作！");
	        }
	    });		
	}
</script>
</body>
</html>