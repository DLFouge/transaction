<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=basePath%>/admin/css/style.css" media="all" />
<title>Insert title here</title>
</head>
<body>
<section class="content">
	
	<div class="widget-container">
		<section class="widget">
			<header> 
				<span class="icon">&#128318;</span>
				<hgroup>
					<h1>用户详情</h1>
					<h2></h2>
				</hgroup>
				<aside>
					<span>
						<a href="#">&#9881;</a>
						<ul class="settings-dd">
							<li><label>Option a</label><input type="checkbox" /></li>
							<li><label>Option b</label><input type="checkbox" checked="checked" /></li>
							<li><label>Option c</label><input type="checkbox" /></li>
						</ul>
					</span>
				</aside>
			</header>
			<div class="content">
				<ul class="user_info">
							<li><h3>頭像：</h3><br/><img id="3" src="/transaction/user_img/<s:property value="userInfo.photoAddress"/>" width="100" height="100" class="img-responsive img-circle"></li><br/>
							<li><h3>昵稱：<s:property value="userInfo.nickName"/></h3><br/><a></a></li><br/>
							<li><h3>真實姓名：<s:property value="userInfo.realName"/></h3><br/><a></a></li><br/>
							<li><h3>身份證：<s:property value="userInfo.idetityCart"/></h3><br/><a></a></li><br/>
							<li><h3>學號：<s:property value="userInfo.studentCart"/></h3><br/><a></a></li><br/>						
						</ul>
			</div>
		</section>
		
		
</body>
<script src="<%=basePath%>/assets/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/admin/js/jquery.wysiwyg.js"></script>
<script src="<%=basePath%>/admin/js/custom.js"></script>
<script src="<%=basePath%>/admin/js/cycle.js"></script>
<script src="<%=basePath%>/admin/js/jquery.checkbox.min.js"></script>
<script src="<%=basePath%>/admin/js/flot.js"></script>
<script src="<%=basePath%>/admin/js/flot.resize.js"></script>
<script src="<%=basePath%>/admin/js/flot-graphs.js"></script>
<script src="<%=basePath%>/admin/js/flot-time.js"></script>
<script src="<%=basePath%>/admin/js/cycle.js"></script>
<script src="<%=basePath%>/admin/js/jquery.tablesorter.min.js"></script>
</html>