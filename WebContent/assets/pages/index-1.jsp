<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="../jquery/jquery.min.js"></script>
<script type="text/javascript"  src="../bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<iframe id="frame"  src="topnav.jsp" scrolling="no" frameborder="0" name="top" width="1360px"height="185px">
</iframe>
<div style="height:55px;width:200px;background-color: #b40505; margin-left:45px;" class="text-center pull-left">
	<h3  style="color:#fff;font-family: 微软雅黑">全部商品分类</h3>
</div>
<div style="width:1000px;" >
		<ul class="nav nav-tabs nav-justified" >
   			<li><a class="text-color-grad font-weight" href="#">书籍</a></li>
   			<li><a class="text-color-grad font-weight" href="#">运动</a></li>
 	  		<li><a class="text-color-grad font-weight" href="#">数码</a></li>
  			<li><a class="text-color-grad font-weight" href="#">影音</a></li>
   			<li><a class="text-color-grad font-weight" href="#">艺术</a></li>
   			<li><a class="text-color-grad font-weight" href="#">家居</a></li>
		</ul>
	</div>
<iframe id="frame"  src="<s:url value='/transaction/selectAllCategory'/>" frameborder="0" scrolling="no" name="middle" width="1360px" height="435px">
</iframe>
<iframe id="frame"  src="mainpagegoods.jsp" frameborder="0" scrolling="no" name="bottom" width="1360px" height="735px">
</iframe>
<%@ include file="bottom.jsp"%>
</body>
</html>