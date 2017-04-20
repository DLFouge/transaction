<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/desc.css'/>">
  </head>
  
<body>
	<div class="divOrder">
		<span>订单号：${order.id}
	<c:if test="order.status ==1">
				(等待付款)
			</c:if>
			<c:elseif test="order.status == 2 ">
				(准备发货)
			</c:elseif>
			<c:elseif test="order.status== 3 ">
				(等待确认)
			</c:elseif>
			<c:elseif test="order.status == 4 ">
				(交易成功)
			</c:elseif>
			<c:if test="order.status== 5">
				(已取消)
			</c:if>
			
		　　　下单时间：${order.orderTime}</span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>收货人信息</dt>
				<dd>${order.address }</dd>
			</dl>
		</div>
		<div class="div2">
			<dl>
				<dt>商品清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th class="tt">商品名称</th>
							<th class="tt" align="left">单价</th>
							<th class="tt" align="left">数量</th>
							<th class="tt" align="left">小计</th>
						</tr>
<c:iterator value="order.list">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="/work/<c:property value='book.imageSmall'/>"/>
								  <a href="selectById?id=<c:property value='book.id'/>"><c:property value="book.name"/></a>
								</div>
							</td>
							<td class="td" >
								<span>&yen;<c:property value="book.currentPrice"/></span>
							</td>
							<td class="td">
								<span><c:property value="book.quantity"/></span>
							</td>
							<td class="td">
								<span>&yen;<c:property value="book.price"/></span>
							</td>			
						</tr>
</c:iterator>
					</table>
				</dd>
			</dl>
		</div>
		<div style="margin: 10px 10px 10px 550px;">
			<span style="font-weight: 900; font-size: 15px;">合计金额：</span>
			<span class="price_t">&yen;${order.total}</span><br/>

	<c:if test="order.status == 1">
		<a href="/work/selectTotal?oid=<c:property value='order.id'/>" class="pay"></a><br/>
    </c:if>
    <c:if test="order.status == 1 and btn == 'concel'">
        <a id="confirm" href="updateOrderStatus?oid=<c:property value="order.id"/>&status=5">取消订单</a><br/>
    </c:if>
    <c:elseif test="order.status == 2 and btn == 'concel'">
    	<a id="confirm" href="updateOrderStatus?oid=<c:property value="order.id"/>&status=5">取消订单</a><br/>
    </c:elseif>
    <c:elseif test="order.status == 3 and btn == 'confirm'">
    	<a id="confirm" href="updateOrderStatus?oid=<c:property value="order.id"/>&status=4">确认收货</a><br/>
    </c:elseif>
    <c:elseif test="order.status == 5">
     	<a id="confirm" href="javascript:alert('交易成功！');">加入购物车</a><br/>
    </c:elseif>
		
		</div>
	</div>
</body>
</html>

