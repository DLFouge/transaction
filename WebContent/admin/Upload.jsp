<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/Pages/backPages/css/style.css" media="all" />
</head>
<body>
<section class="content">
	<section class="widget" style="min-height:300px">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>${userAccount.userInfo.username}的Tiwatch应用</h1>
				<h2>上传一个新应用</h2>
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
		<form action="upload.do" method="post" enctype="multipart/form-data">
		<div class="content">
			
			<div class="field-wrap"> 
				<input type="text" name="uid" value="${userAccount.userInfo.id}" style="display:none;"/>
				
				<input type="text" name="website" value="${userAccount.userInfo.useravatar}" style="display:none;"/>
				
				<input type="text" value="应用名称" name="appname"/>
				
			</div>
			<div class="field-wrap">
				<input type="text" value="版本号" name="vid"/>
			</div>
			<div class="field-wrap wysiwyg-wrap">
			<a>应用描述</a>
				<textarea class="post" rows="6" name="description"></textarea>
			</div>
			<div class="field-wrap">
				<a>应用图标（请使用BMP,GIF,PNG,JPEG等主流格式图片）</a><br/>
				<input type="file" name="file"/>
			</div>
			<div class="field-wrap">
				<a>应用文件（请使用应用格式的应用文件）</a><br/>
				<input type="file" name="file"/>
			</div>
			
			<button type="submit" class="green">提交</button> <!-- <button type="submit" class="">重置</button> -->
		</div>
		</form>
	</section>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="<%=basePath%>/Pages/backPages/js/jquery.wysiwyg.js"></script>
	<script src="<%=basePath%>/Pages/backPages/js/custom.js"></script>
	<script src="<%=basePath%>/Pages/backPages/js/cycle.js"></script>
	<script src="<%=basePath%>/Pages/backPages/js/jquery.checkbox.min.js"></script>
	<script src="<%=basePath%>/Pages/backPages/js/jquery.tablesorter.min.js"></script>
</section>
</body>
</html>