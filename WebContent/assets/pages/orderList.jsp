<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="topnav.jsp"%>
<div class="fullscreen" >
	<div style="margin-left:100px;">
	<h2>我的订单</h2>
   	<div class="row">
   		<div class=".col-xs-12 line-bottom-2"></div>	
   	</div>
   	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:10px;width:90%;">
   	<div>
      	<ul class="nav navbar-nav">
      
      		<li class="active"><a href="selectAllOrder">所有订单</a></li>
         	<li><a href="selectByStatus?status=1">待付款</a></li>
         	<li><a href="selectByStatus?status=2">待发货</a></li>
         	<li><a href="selectByStatus?status=3">待收货</a></li>
         	<li><a href="selectByStatus?status=4">交易成功</a></li>
         	<li><a href="selectByStatus?status=5">已取消</a><li>
      	</ul>
     </div>
	 </nav>
     <div style="padding: 5px 5px 5px;">
   		<form class="bs-example bs-example-form" role="form">
	      	<div class="row">    
	         	<div class="col-lg-4">
	            	<div class="input-group">
	               		<input type="text" class="form-control">	               			
	               		<span class="input-group-btn">
	                  		<button class="btn btn-default" type="button">
	                     		订单搜索
	                  		</button>
	               		</span>
	            	</div><!-- /input-group -->
	         	</div><!-- /.col-lg-6 -->
	      	</div><!-- /.row -->
   		</form>
	</div>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:10px;width:90%;">
   	<div>
      	<ul class="nav navbar-nav">
      		<li style="margin-left:150px"><a href="#">宝贝</a></li>
         	<li style="margin-left:120px"><a href="#">单价（元）</a></li>
         	<li style="margin-left:5px"><a href="#">数量</a></li>
         	<li style="margin-left:100px"><a href="#">实付款（元）</a></li>
         	<li style="margin-left:50px"><a href="#">订单状态</a></li>
         	<li style="margin-left:100px"><a href="#">操作</a></li>
      	</ul>
     </div>
	 </nav>
	
	<s:iterator value="pagingDate.list">
	<div class="panel panel-default" style="width:90%;">
	
   		<nav class="navbar navbar-default navbar-static-top" role="navigation">
		   	<div>
		      	<ul class="nav navbar-nav">
		      		<li><a href="#"><input type="checkbox"></a></li>
		         	<li><a href="#"><s:property value="orderTime"/></a></li>
		         	<li><a href="#">订单号：<s:property value="orderId"/></a></li>
		      	</ul>
		     </div>
		 </nav>
		 <nav class="navbar navbar-default navbar-static-top" role="navigation">
		     <div class="table-responsive">
		     	<table>
		     		<tbody>
		     			<s:iterator value="list">
	      				<tr>
            				<td align="center"><a href="goodsDetail?goodsId=<s:property value='goods.goodsId'/>"><img id="hz" width="100" height="100" style="margin-top:15px;margin-left:20px;margin-right:20px;" src="/transaction/shopping_img/<s:property value="goods.pictureTop"/>" class="img-responsive img-rounded"></a></td>
            				<td width="220"><s:property value="goods.goodsName"/></td>
            				<td width="100"><s:property value="goods.goodsPrice"/></td>
            				<td><s:property value="quantity"/></td>
         				</tr>
	     				</s:iterator>
		     		</tbody>
		     	</table>
		   	 </div>		     
		     <div>
		     	<ul class="nav navbar-nav">
		     		<li style="margin-left:620px;margin-top:-100px;"><s:property value="total"/></li>
	         		<li style="margin-left:765px;margin-top:-100px;"><s:if test="status ==1">
					(等待付款)
				</s:if>
				<s:elseif test="status == 2 ">
					(准备发货)
				</s:elseif>
				<s:elseif test="status == 3 ">
					(等待确认)
				</s:elseif>
				<s:elseif test="status == 4 ">
					(交易成功)
				</s:elseif>
				<s:if test="status == 5">
					(已取消)
				</s:if></li>
				<li style="margin-left:930px;margin-top:-140px;">
					<br/>
				<s:if test="status ==1">
					<a href="/transaction/selectTotal?oid=<s:property value='orderId'/>">支付</a><br/>
					<a style="display: block;" class="a-oncilk">
					<span  style="display: none">updateStatus?oid=<s:property value="orderId"/>&status=5</span>
					取消</a><br/>	
				</s:if>
		  		<s:if test="status == 2">
		  			<a style="display: block;" class="a-oncilk">
		  			<span  style="display: none">updateStatus?oid=<s:property value="orderId"/>&status=5</span>
		  			取消</a><br/>	
		  		</s:if>
				<s:elseif test="status == 3 ">
					<a href="updateStatus?oid=<s:property value="orderId"/>&status=4">确认收货</a><br/>
				</s:elseif>
				<s:if test="status == 4">
					<a href="deleteOrder?oid=<s:property value="orderId"/>">删除订单</a><br/>
				</s:if>
				</li>
		     	</ul>
		     </div>		     
		    </nav> 
	</div>
 </s:iterator>
	
	<ul class="pagination" style="margin-left:680px">
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
				<li >
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
</div>
<!-- 底部导航 -->
	<%@ include file="bottom.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".a-oncilk").bind("click",function(){
				if(confirm("你确定取消吗？"))
					{
					url=$(this).children("span").text();
					window.location.href=url;
					}
				
				
				
			})
		})
	</script>
</body>
</html>