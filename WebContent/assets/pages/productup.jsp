<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/js/bootstrap.min.js">
</head>
<body>

<%@ include file="topnav.jsp"%>

<div class="container">
	<h2>卖家中心</h2>
   	<div class="row">
   		<div class="col-xs-12 line-bottom-2"></div>	
   	</div>
   	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:97%;margin-top:20px;">
   	<div>
      	<ul class="nav navbar-nav">
      		<li class="active"><a href="#">首页</a></li>
         	<li><a href="#">规则中心</a></li>
         	<li><a href="#">安全中心</a></li>
         	<li><a href="#">服务中心</a></li>
         	<li><a href="#">卖家论坛</a></li> 
      	</ul>
     </div>
	 </nav>
	 
	 <div class="row">
   		<div class="col-xs-2 background-color-2" style="margin-top:10px; margin-bottom: 100px;margin-left:15px; box-shadow: 
         	inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;" >
         	<h5 class="font-weight margin-left-3">信息中心</h5>
         	<div class="btn-group-vertical col-xs-12">
			 <a class="btn btn-default btn-block" style="margin-top:2px;margin-bottom:10px;" href="selectByUid">我的商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:10px;" href="payAndSend?status=2&send=1">已卖商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:10px;" href="payAndSend?status=2&send=0">待发货商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:10px;" href="/transaction/assets/pages/useruploadgoods.jsp">商品上架</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:10px;" href="javascript:history.go(-1);">返回</a> 	 
			</div>
         </div>
         <div class="col-md-7" style="margin-bottom:5px;box-shadow: 
         		inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;">
         		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:900px;margin-top:10px;">
				   	<div>
				      	<ul class="nav navbar-nav">
				      		<li><a href="#">我是卖家>以上传商品</a></li>			        
				      	</ul>
				     </div>
				 </nav>
				 
				 
				 <s:iterator value="pagingDate.list">
				 <div class="row   col-xs-12" style="width:900px;background:#FCFCFC; margin-top:5px;margin-left:2px;border: 1px #B7B7B7 solid;">
				 	<div class="col-xs-2" style="margin-top:30px; margin-bottom: 30px; " >
			   			<img id="hz" src="/transaction/shopping_img/<s:property value="pictureTop"/>" width="100" height="100" class="img-responsive img-rounded" style="margin-top:10px;margin-bottom:10px;margin-left:15px;">        		
			         </div>
			         <div class="col-xs-7" style="margin-top:29px;margin-bottom:30px;">
			         	<br>
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">商品名称：<s:property value="goodsName"/></label>
						</div>
						<br>
				
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">商品价格：<s:property value="goodsPrice"/></label>
						</div>
						<br>
				
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">上架时间：<s:property value="onSaleTime"/></label>
						</div>
						<br>
				
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">新旧程度：<s:property value="degree"/></label>
						</div>
						<br>
							
			         </div>
			         <br><br><br>
			         <div class="col-xs-2">
		
							<a class="pull-right" href="editGoods?goodsId=<s:property value="goodsId"/>"><button type="button" class="btn btn-default">编辑</button></a>
		
					</div>
				 </div>	
				 
				 
				</s:iterator>				 			 				 	
         </div>
	</div>
	
	<ul class="pagination pull-right">
	<!-- 上一页 -->
		<s:if test="pageCode == 1">
	  		<li><a href="#">&laquo;</a></li>
		 </s:if>
	 	<s:else>
	 		<li><a href="<s:property value="pagingDate.url"/>&pageCode=<s:property value="pageCode-1"/>">&laquo;</a></li>
	 	</s:else>
	 	
	 <!-- 中间页码判断 -->
	 <!-- 总页面少于三页 -->
	 <s:if test="pagingDate.totalPage <3">
	 	<s:set var="begin" value="1"></s:set>
	 	<s:set var="end" value="pagingDate.totalPage"></s:set>
	 </s:if>
	 <!-- 总页面大于三页的情况 -->
	 <s:else>
	 	<s:set var="begin" value="pageCode - 1"></s:set>
	 	<s:set var="end" value="pageCode + 1"></s:set>
	 	<s:if test="#begin < 1">
	 		<s:set var="begin" value="1"></s:set>
	 		<s:set var="end" value="3"></s:set>
	 	</s:if>
	 	<s:if test="#end >pagingDate.totalPage">
	 		<s:set var="begin" value="pageCode -2"></s:set>
	 		<s:set var="end" value="pagingDate.totalPage"></s:set>
	 	</s:if>
	 </s:else>
	 
	 <%-- 显示页码列表 --%>
		<s:iterator begin="#begin" end="#end" id="index">
			<s:if test="index==pageCode">
				<li class="disabled"><s:property value="#index"/></li>
			</s:if>
			<s:else>
				<li>
				<a href="<s:property value='pagingDate.url'/>&pageCode=<s:property value='#index'/>"><s:property value="#index"/></a></li>
			</s:else>
		</s:iterator>
		<%-- 显示点点点 --%>
		<s:if test="pageCode+1 < pagingDate.totalPage">
			<li><span class="spanApostrophe">...</span></li>
		</s:if>
	 	
	  
	  <!-- 下一页 -->
	  <s:if test="pageCode == pagingDate.totalPage">
	  		<li><a href="#">&raquo;</a></li>
	  </s:if>
	 <s:else>
	 		<li><a href="<s:property value="pagingDate.url"/>&pageCode=<s:property value="pageCode+1"/>">&raquo;</a></li>
	 </s:else>
	</ul>
	
</div>
<div >
	<img id="icon" src="../dist/img/bottom.jpg" class="img-responsive img-rounded">
</div>
</body>
</html>