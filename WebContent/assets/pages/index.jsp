<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>主页</title>
</head>
<body>
<%@ include file="basejscss.jsp"%>
	<iframe id="frame" src="<%=basePath%>/assets/pages/topnav.jsp" scrolling="no" frameborder="0"
		name="top" width="1360px" height="185px"> </iframe>
	<div style="width: 100%">
		<div
			style="height: 55px; width: 200px; background-color: #b40505; margin-left: 95px;"
			class="text-center pull-left">
			<h3 style="color: #fff; font-family: 微软雅黑">全部商品分类</h3>
		</div>
		<div style="width: 1000px;">
			<ul class="nav nav-tabs pull-right" style="margin-right: 160px;">
				<li><a class="text-color-grad font-weight" href="selectByCid?categoryId=E77B357DCB294F709EF106C51EF6081C" target="_top">书籍</a></li>
				<li><a class="text-color-grad font-weight" href="#">运动</a></li>
				<li><a class="text-color-grad font-weight" href="#">数码</a></li>
				<li><a class="text-color-grad font-weight" href="#">影音</a></li>
				<li><a class="text-color-grad font-weight" href="#">艺术</a></li>
				<li><a class="text-color-grad font-weight" href="#">家居</a></li>
			</ul>
		</div>
	</div>
	<br><br>
	<iframe id="frame"
		src="<s:url value='/transaction/selectAllCategory'/>" frameborder="0"
		scrolling="no" name="middle" width="1360px" height="435px"> </iframe>
	<iframe id="frame" src="<%=basePath%>/assets/pages/mainpagegoods.jsp" frameborder="0"
		scrolling="no" name="bottom" width="1360px" height="665px">
	</iframe>
	<iframe id="frame" src="selectbooks?categoryId=E77B357DCB294F709EF106C51EF6081C" frameborder="0"
		scrolling="no" name="bottom" width="1360px" height="575px">
	<br><br><br>
	</iframe>
		<iframe id="frame" src="<%=basePath%>/assets/pages/mainpageplays.jsp" frameborder="0"
		scrolling="no" name="bottom" width="1360px" height="575px">
	</iframe>
	<br>
	<br>
	<div class="container">
    <div class="row">
    	<h4 class="font-weight-1">-<span class="glyphicon glyphicon-thumbs-up text-color-red"></span>精选推荐-</h4>
    	<br>
   		<div class="col-xs-2">
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj1.jpg" class="img-responsive img-rounded"> 
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   		
   		</div>
   		<div class="col-xs-2">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj2.jpg" class="img-responsive img-rounded"> 
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   		
   		</div>
   		<div class="col-xs-2">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj1.jpg" class="img-responsive img-rounded">
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   	 	
   		</div>
   		<div class="col-xs-2">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj2.jpg" class="img-responsive img-rounded">
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   	 	
   		</div>
   		<div class="col-xs-2">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj1.jpg" class="img-responsive img-rounded">
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   	 	
   		</div>
   		<div class="col-xs-2">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/tj1.jpg" class="img-responsive img-rounded">
   			<p>高极音响，震撼你的耳朵震撼你的耳朵震撼你的耳朵震撼你的耳朵</p>
   			<p class="text-color-red">￥35.9</p>   	 	
   		</div>
   	</div>
 </div>
 <br> <br> <br>
	<%@ include file="bottom.jsp"%>
</body>
</html>