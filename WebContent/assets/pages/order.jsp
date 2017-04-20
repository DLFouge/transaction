<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

		<!-- 底部导航 -->
	<%@ include file="topnav.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12 line-bottom-1">
				<h4>生成订单</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
		
			<div class="col-xs-12" style="margin-top: 0px;">
   					<div class="panel-heading">
    				 	<label>您的位置：</label>
    				 	<a><font color="#000000"> 首页</font></a>
    				 	<label> > </label>
    				 	<a><font color="#000000"> 我的淘宝</font></a>
    				 	<label> > </label>
    				 	<a><font color="#000000"> 生成订单</font></a>
   					</div>
			</div>
			
			<div class="col-xs-12" style="margin-top: 20px;">
				<div class="panel-body">
				
   						<div class="col-xs-4" style="height:350px;">
  							 
  							 <div style="height:30px;border:1px solid #DCDCDC;background:#F3F3F3;">
  							 	<label style="font-size:12px;margin-top: 5px;margin-left: 20px;">订单信息</label>
            				 </div>
            				 
            				 <div style="height:304.73px;border:1px solid #DCDCDC;background:#fbfbfb;">
            				 	<ul>
            				 		<li>
            				 			<div>收货地址：</div>
            				 			<div><s:property value="order.address"/> </div>
            				 		</li>
            				 		<li>
            				 			<div>合计金额</div>
            				 			<div><s:property value="order.total"/></div>
            				 		</li>
            				 		<li>
            				 			<div>订单编号：</div>
            				 			<div><s:property value="order.orderId"/></div>
            				 		</li>
            				 		<li>
            				 			<div>
            				 				欢迎再次购买！
            				 			</div>
            				 			<div class="trade-imfor-dd"></div>
            				 			<div>
            				 			<br>           				 			
            				 			 <a href="/transaction/selectOrder?oid=<s:property value="order.orderId"/> "id="linkPay"><button class="btn btn-danger pull-left btn-block" style="margin-left:-25px;">支&nbsp;付</button></a></div>
            				 		</li>
            				 	</ul>
           					 </div>	
           				</div>	 
						
   						<div class="col-xs-8" style="height:334.73px;border:1px solid #DCDCDC;text-align:center;">
   							订单状态
   							<img src="<%=basePath%>/assets/dist/img/cg.jpg" class="img-responsive img-rounded">
   						</div>
   				</div>
			</div>
			
			</div>
			</div>
		<!-- 底部导航 -->
	<%@ include file="bottom.jsp"%>

</body>
</html>