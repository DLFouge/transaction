<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="<%=basePath%>/Pages/backPages/css/style.css" media="all" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#127748;</span>
			<hgroup>
				<h1>my concern</h1>
				<h2>All uploaded files</h2>
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
			<div id="dropzone" class="dropzone gallery">
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-dashboard.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-dashboard.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-dashboard.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-dashboard.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-dashboard.png" alt="" width="200" height="150" /></a> 
				<a href="#"><img src="images/mobile-stats.png" alt="" width="200" height="150" /></a> 
			</div>
		</div>
	</section>
</section>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.wysiwyg.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/custom.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/cycle.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.checkbox.min.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot.resize.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot-graphs.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot-time.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/cycle.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.tablesorter.min.js"></script>
</body>
</html>