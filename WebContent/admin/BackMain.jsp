<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<link rel="stylesheet" href="<%=basePath%>/admin/css/style.css" media="all" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台服务管理</title>
</head>
<body>
<div class="testing">
<header class="main">
	<h1><strong>中南大学</strong> 二手跳蚤市场</h1>
	<input type="text" value="search" />
</header>
<section class="user">
	<div class="profile-img">
		<p><img src="<%=basePath%>/admin/images/uiface2.png" alt="" height="40" width="40" />欢迎<s:property value="loginname"/></p>
	</div>
	<div class="buttons">
		<button class="ico-font">&#9206;</button>
		<span class="button dropdown">
			<a href="#">公告 <span class="pip">4</span></a>
			<ul class="notice">
				<li>
					<hgroup>
						<h1>You have a new task</h1>
						<h2>Report web statistics week by week.</h2> 
					</hgroup>
					<p><span>14:24</span></p>
				</li>
				<li>
					<hgroup>
						<h1>New comment</h1>
						<h2>Comment on <em>About page</em> by Darren.</h2> 
					</hgroup>
					<p><span>11:04</span></p>
				</li>
				<li>
					<hgroup>
						<h1>Broken link</h1>
						<h2>We've spotted a broken link on the <em>Blog page</em>.</h2> 
					</hgroup>
					<p><span>10:46</span></p>
				</li>
				<li>
					<hgroup>
						<h1>User report</h1>
						<h2><em>Lee Grant</em> has been promoted to admin.</h2> 
					</hgroup>
					<p><span>09:57</span></p>
				</li>
			</ul>
		</span> 
		<span class="button dropdown">
			<a href="#">个人中心<span class="pip">6</span></a>
			<ul class="notice">
				<li>
					<hgroup>
						<h1>Hi, I need a favour</h1>
						<h2>John Doe</h2>
						<h3>Lorem ipsum dolor sit amet, consectetuer sed aidping putamus delo de sit felume...</h3>
					</hgroup>
					<p><span>11:24</span></p>
				</li>
			</ul>
		</span> 
		<span class="button">Live</span>
		 <span class="button">帮助</span>
		 <span class="button blue"><a href="adminExit">退出登录</a></span>
	</div>
</section>
</div>
<nav>
	<ul>
		<li class="section"><a href="findAllCategory" target="adminRight"><span class="icon"><img src="<%=basePath%>/admin/images/briefcase.png" height="25" width="27"/></span> 商品分类管理</a></li>
		<li>
			<a href="selectApplyUser?btn=check" target="adminRight"><span class="icon"><img src="<%=basePath%>/admin/images/briefcase.png" height="25" width="27"/></span> 未审核</a>
				
		</li>
		<li>
			<a href="selectApplyUser?btn=pass&status=2" target="adminRight"><span class="icon"><img src="<%=basePath%>/admin/images/upload.png" height="25" width="27"/></span> 已审核 <span class="pip"></span></a>
			<ul class="submenu">
				<li><a href="#">Upload file</a></li>
				<li><a href="#">View files</a></li>
			</ul>
		</li>
		<li>
			<a href="selectApplyUser?btn=refuse&status=3" target="adminRight"><span class="icon"><img src="<%=basePath%>/admin/images/admin.png" height="25" width="27"/></span> 已拒绝用户 <span class="pip">12</span></a>
			<ul class="submenu">
				<li><a href="#">New post</a></li>
				<li><a href="#">All posts</a></li>
				<li><a href="#">View comments</a></li>
			</ul>
		</li>	
		<li><a href="http://www.csu.edu.cn/"><span class="icon"><img src="<%=basePath%>/admin/images/link.png" height="25" width="27"/></span> 中南大学</a></li>
		<li>
			<a href="../assets/pages/index.jsp"><span class="icon"><img src="<%=basePath%>/admin/images/home2.png" height="25" width="27"/></span> 返回首页</a>
			<ul class="submenu">
				<li><a href="icon-fonts.html">Icon fonts</a></li>
			</ul>
		</li>
	</ul>
</nav>

<section class="alert">
	<form method="#" action="#">
		 <button class="green"><a href="#" target="adminRight">上传公告</a></button>
	</form>
</section>
<div id="iframe">
<iframe id="rightframe"  src="findAllCategory" scrolling="no" name="adminRight" height="1400px;">
</div>
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
</body>
</html>