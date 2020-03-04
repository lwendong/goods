<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<link href="<%=path%>/css/admin/main.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/jquery/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="big">
	<div class="header">
		<div class="ll"><img alt="" src="<%=path%>/img/system.png"></div>
		<div class="Logo"><u>商品购物网站后台管理</u></div>
		<div class="ll2"><img alt="" src="<%=path%>/img/user.png"></div>
		<div class="us">${user.name}</div>
		<div class="ll"></div>
		<div class="ll2"><img alt="" src="<%=path%>/img/exit.png"></div>
		<div class="us"><a href="admin/exit">exit</a></div>
		<div class="line"><font class="welcome">欢迎${user.name}进入商品购物网站后台管理系统!!!</font></div>
	</div>		
	<div class="left">
		<!-- <div class="manager_goods"></div> -->
		<div class="manager_goods">
			<a href="<%=path%>/admin/selectGoods" target="center">
				<img alt="" src="<%=path%>/img/goodsManager.png">
				&nbsp;&nbsp;商品管理&nbsp;&nbsp;&nbsp;&nbsp;>
			</a>
		</div>
		<div class="manager_gType">
			<a href="<%=path%>/admin/toAddType" target="center">
				<img alt="" src="<%=path%>/img/typeManager.png">
				&nbsp;&nbsp;类型管理&nbsp;&nbsp;&nbsp;&nbsp;>
			</a>
		</div>
		<div class="manager_user">
			<a href="<%=path%>/admin/userInfo" target="center">
				<img alt="" src="<%=path%>/img/userManager.png">
				&nbsp;&nbsp;用户管理&nbsp;&nbsp;&nbsp;&nbsp;>
			</a>
		</div>
		<div class="manager_order">
			<a href="<%=path%>/admin/orderInfo" target="center">
				<img alt="" src="<%=path%>/img/orderManager.png">
				&nbsp;&nbsp;订单管理&nbsp;&nbsp;&nbsp;&nbsp;>
			</a>
		</div>
		<div class="manager_notice">
			<a href="<%=path%>/admin/deleteNoticeSelect" target="center">
				<img alt="" src="<%=path%>/img/noticeManager.png">
				&nbsp;&nbsp;公告管理&nbsp;&nbsp;&nbsp;&nbsp;>
			</a>
		</div>
		<!-- <ul>
			<li><a href="adminNotice/toAddNotice" target="center">添加公告</a></li>
			<li><a href="adminNotice/deleteNoticeSelect" target="center">删除公告</a></li>
		</ul>
		 -->
	</div>
	<div class="content">
		<iframe class="iframe" id="iframe" src="<%=path%>/admin/selectGoods" name="center" frameborder="0"></iframe>
	</div>
</div>
</body>
</html>


