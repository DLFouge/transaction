<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/struts-tags" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>下订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/showitem.css'/>">
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/jquery/round.js'/>"></script>
<style type="text/css">
#addr{width: 500px; height: 32px;border: 1px solid #7f9db9; padding-left: 10px; line-height: 32px;}
</style>

<script type="text/javascript">
	//计算合计
	$(function() {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text(round(total, 2));
	});
</script>
  </head>
  
  <body>
  	<%@ include file="topnav.jsp"%>
<form id="form1" action="createOrder" method="post">
<table width="82%" align="center" cellpadding="0" cellspacing="0" style="margin-top:45px">
	<tr bgcolor="#F2F2F2">
		<td width="400px" height="45px" colspan="5"><span style="font-weight: 900;font-size:21px">&nbsp;&nbsp;&nbsp;生成订单</span></td>
	</tr>
	<tr align="center" height="45px" style="18px">
		<td width="10%">&nbsp;</td>
		<td width="50%">商品名称</td>
		<td>单价</td>
		<td>数量</td>
		<td>小计</td>
	</tr>

<c:iterator value="allCartItem.list">
    <input type="hidden" name="list" value="<c:property value="cartId" escape="false"/>"/>
	<tr align="center" height="110px">
		<td align="right">
		    <c:url var="idURL" action="selectById">
			<c:param name="cartId">
			   <c:property value="good.cartId" escape="false" />
			</c:param>
		</c:url>
			<a class="linkImage" href="<c:url value='%{idURL}'/>"><img border="0" width="74" align="top" src="/transaction/shopping_img/<c:property value="good.pictureTop" escape="false"/>"/></a>
		</td>
		<td align="center">
			
			<a href="<c:url value='%{idURL}'/>" ><span><c:property value="good.goodsName"/></span></a>
		</td>
		<td>&yen;<c:property value="good.goodsPrice"/></td>
		<td><c:property value="quantity"/></td>
		<td>
			<span class="price_n">&yen;<span class="subtotal"><c:property value="totalMoney()"/></span></span>
		</td>
	</tr>
</c:iterator>
</table>
<div class="row">
<div class="col-xs-1"></div>
<div class="col-xs-10">
<div class="panel " style="background:#F2F2F2">
	<div class="panel-body"  style="text-align:center;">
	<div class="row">
		
		<div class="col-xs-2" style="text-align:right;height:25px;margin-left:-80px;">
		<span style="font-weight: 600;font-size:16px; margin-top:20px;">
		收货地址:
		</div>
		<div class="col-xs-10" height="25px" style="text-align:left;">
		<input id="addr" type="text" name="address" value="湖南省长沙市中南大学11栋宿舍楼"/></span>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12"  style="text-align:right;font-size:24px;height:45px;">
			<span>总计：</span><span class="price_t">&yen;<span id="total"><c:property value="allCartItem.allCartItemMoney();"/></span></span>
		</div>
	</div>
	

	<div class="row">
		<div class="col-xs-12" style="border-top-width: 45px;"  align="right" style="text-align:right;" >
		<br>
			<button class="btn btn-danger"><a id="linkSubmit"  href="javascript:$('#form1').submit();" style="color:#fff;font-size:18px;font-weight:600;">提交订单</a></button>
		</div>
	</div>
	
	</div>
</div>
</div>
<div class="col-xs-1"></div>
</div>

	<!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>
</form>
  </body>
</html>
