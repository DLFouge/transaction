<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>卖家中心</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/js/bootstrap.min.js">
</head>
<body>

<%@ include file="topnav.jsp"%>

<div class="container">
	<h2>卖家中心</h2>
   	<div class="row">
   		<div class=".col-xs-12 line-bottom-2"></div>	
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
   		<div class="col-xs-2 background-color-2" style="margin-top:10px; margin-bottom: 100px;margin-left:15px; " >
         	<h5>我的应用</h5>
         	<div class="btn-group-vertical col-xs-10">
			 <a class="btn btn-default" style="margin-top:2px;margin-bottom:30px;" href="selectByUid">我的商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:30px;" href="payAndSend?status=2&send=1&btn=out">已卖商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:30px;" href="payAndSend?status=2&send=0">待发货商品</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:30px;" href="/transaction/assets/pages/useruploadgoods.jsp">商品上架</a>
			  <a class="btn btn-default" style="margin-top:2px;margin-bottom:30px;" href="javascript:history.go(-1);">返回</a> 	 
			</div>
         </div>
         <div class="col-md-7" style="margin-bottom:5px; ">
         		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:900px;margin-top:10px;">
				   	<div>
				      	<ul class="nav navbar-nav">
				      		<li><a href="#">我是卖家>以上传商品</a></li>			        
				      	</ul>
				     </div>
				 </nav>
				 
				 
				 <s:iterator value="page.list">
				 <div class="row " style="width:900px;background:#FCFCFC;border: 1px #B7B7B7 solid;margin-top:5px;margin-left:2px;">
				 	<div class="col-xs-2" style="margin-top:30px; margin-bottom: 80px;margin-left:30px;  " >
			   			<img id="hz" src="/transaction/shopping_img/<s:property value="goods.pictureTop"/>" width="100" height="100" class="img-responsive img-rounded" style="margin-top:10px;margin-bottom:10px;margin-left:15px;">        		
			         </div>
			         <div class="col-md-7" style="margin-top:20px;margin-bottom:30px;margin-left:30px; ">
			         	<br>
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">商品名称：<s:property value="goods.goodsName"/></label>
						</div>
						<br>
				
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">商品数量：<s:property value="quantity"/></label>
						</div>
						<br>
				
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">小计：<s:property value="subtotal"/></label>
						</div>
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">买家地址：<s:property value="order.address"/></label>
						</div>
						<div class="col-xs-8 text-center">
							<label class = "pull-left" style="margin-left:25px;">下单时间：<s:property value="order.orderTime"/></label>
						</div>
						<br>
				
						<br>
							<div>
							<s:if test="btn == out">
								<a href="sendGoods?orderItemId=<s:property value="orderItemId"/>">发货</a>
							</s:if>
							</div>
			         </div>
				 </div>	
				 
				</s:iterator>				 			 				 	
         </div>
	</div>
	
	<ul class="pagination" style="margin-left:680px">
	<!-- 上一页 -->
		<s:if test="pageCode == 1">
	  		<li><a href="#">&laquo;</a></li>
		 </s:if>
	 	<s:else>
	 		<li><a href="<s:property value="page.url"/>&pageCode=<s:property value="pageCode-1"/>">&laquo;</a></li>
	 	</s:else>
	 	
	 <!-- 中间页码判断 -->
	 <!-- 总页面少于三页 -->
	 <s:if test="page.totalPage <3">
	 	<s:set var="begin" value="1"></s:set>
	 	<s:set var="end" value="page.totalPage"></s:set>
	 </s:if>
	 <!-- 总页面大于三页的情况 -->
	 <s:else>
	 	<s:set var="begin" value="pageCode - 1"></s:set>
	 	<s:set var="end" value="pageCode + 1"></s:set>
	 	<s:if test="#begin < 1">
	 		<s:set var="begin" value="1"></s:set>
	 		<s:set var="end" value="3"></s:set>
	 	</s:if>
	 	<s:if test="#end >page.totalPage">
	 		<s:set var="begin" value="pageCode -2"></s:set>
	 		<s:set var="end" value="page.totalPage"></s:set>
	 	</s:if>
	 </s:else>
	 
	 <%-- 显示页码列表 --%>
		<s:iterator begin="#begin" end="#end" id="index">
			<s:if test="index==pageCode">
				<li class="disabled"><s:property value="#index"/></li>
			</s:if>
			<s:else>
				<li>
				<a href="<s:property value='page.url'/>&pageCode=<s:property value='#index'/>"><s:property value="#index"/></a></li>
			</s:else>
		</s:iterator>
		<%-- 显示点点点 --%>
		<s:if test="pageCode+1 < page.totalPage">
			<li><span class="spanApostrophe">...</span></li>
		</s:if>
	 	
	  
	  <!-- 下一页 -->
	  <s:if test="pageCode == page.totalPage">
	  		<li><a href="#">&raquo;</a></li>
	  </s:if>
	 <s:else>
	 		<li><a href="<s:property value="page.url"/>&pageCode=<s:property value="pageCode+1"/>">&raquo;</a></li>
	 </s:else>
	</ul>
	
</div>
<div class="background-color-3" style="height: 135px; margin-top: 85px;">
</div>

</body>
</html>