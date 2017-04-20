<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/struts-tags"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>cartlist.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/dist/css/list.css'/>">

</head>
<body>
<!-- 头部导航 -->
	<%@ include file="topnav.jsp"%>
	<c:if test="allCartItem.list.size == 0">

		<table width="95%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right"><img align="top"
					src="<c:url value='/assets/dist/img/icon_empty.png'/>" /></td>
				<td><span class="spanEmpty">您的购物车中暂时没有商品</span></td>
			</tr>
		</table>
	</c:if>
	<c:else>

			<h4 style="color:red; margin-left:135px;border-bottom: 2px red solid;height:35px;width:75px">全部商品</h4>
			<table width="80%" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px;margin-bottom:100px;">
			<tr align="center" bgcolor="#efeae5">
				<td align="left" width="80px"><input type="checkbox"
					id="selectAll" checked="checked" style="margin-left:20px;" /><label for="selectAll">全选</label>
				</td>
				<td colspan="2"><b style="margin-left:-220px;">商品名称</b></td>
				<td>单价</td>
				<td>数量</td>
				<td>小计</td>
				<td>操作</td>
			</tr>
			<c:iterator value="allCartItem.list">

				<tr align="center">
					<td align="left">
						<input value="<c:property value="cartId" escape="false" />"
						type="checkbox" name="checkboxBtn" checked="checked" style="margin-left:20px;" />
					</td>
					<td align="left" width="70px">
						<c:url var="idURL" action="selectById">
							<c:param name="goodsId">
								<c:property value="good.goodsId" escape="false" />
							</c:param>
						</c:url> 
						<a class="linkImage" href="<c:url value='%{idURL}'/>">
						 <img border="0" width="54" align="top" src="/transaction/shopping_img/<c:property value='good.pictureTop'/>"style="margin-top:30px;margin-left:80px;margin-bottom:30px;" />
						</a>
					</td>

					<td align="left" width="400px">&nbsp;&nbsp;
						<a href="<c:url value='%{idURL}'/>" style="margin-left:30px;">
						  <span><c:property value="good.goodsName" /></span>
						 </a>
					</td>
					<td>
						<span>&yen;<span class="currPrice" id="<c:property value="cartId" escape="false" />CurrPrice">
						<c:property value="good.goodsPrice" escape="false" /></span></span>
					</td>
					<td>
						<a class="jian" id="<c:property value="cartId" escape="false" />Jian">
						</a>
							<input class="quantity" readonly="readonly" id="<c:property value="cartId" escape="false" />Quantity" type="text" value="<c:property value='quantity'/>" />
						<a class="jia" id="<c:property value="cartId" escape="false"/>Jia"></a>
					</td>
					<td width="100px">
						<span class="price_n">&yen;
						<span class="subTotal" id="<c:property value="cartId" escape="false"/>Subtotal">
						<c:property value="totalMoney()" /></span></span></td>
					<td>
					<c:url var="deleteURL" action="deleteCart">
							<c:param name="cartId">
								<c:property value="cartId" escape="false" />
							</c:param>
						</c:url> <a href="<c:url value='%{deleteURL}'/>">删除</a></td>
				</tr>

			</c:iterator>

			<tr>
				<td colspan="4" class="tdBatchDelete"><a
					href="javascript:batchDelete();" style="margin-left:30px;">批量删除</a></td>
				<td colspan="3" align="right" class="tdTotal"><span>总计：</span><span
					class="price_t">&yen;<span id="total"></span></span></td>
			</tr>
			<tr>
				<td colspan="7" align="right">
				<a href="javaScript:jiesuan();" id="jiesuan" class="jiesuan">
				
								 
	      		</a>	      			
	      		</td>
			</tr>
		</table>
	</c:else>
	<form id="jiesuanF" action="submitCart" method="post">
		<input type="hidden" name="cartId" id="cartItemIds" /> 
	</form>
	<!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>
	<script type="text/javascript">
	$(function() {
		showTotal();//显示合计
		// 给全选按钮添加点击事件
		$("#selectAll").click(function() {
			var flag = $(this).attr("checked");//获取全选的状态
			setAll(flag);//让所有条目复选框与全选同步
			setJieSuanStyle(flag);//让结算按钮与全选同步
		});

		// 给条目复选框添加事件
		$(":checkbox[name=checkboxBtn]")
				.click(
						function() {
							var selectedCount = $(":checkbox[name=checkboxBtn][checked=true]").length;//被勾选复选框个数
							var allCount = $(":checkbox[name=checkboxBtn]").length;//所有条目复选框个数
							if (selectedCount == allCount) {//全选了
								$("#selectAll").attr("checked", true);//勾选全选复选框
								setJieSuanStyle(true);//使结算按钮可用
							} else if (selectedCount == 0) {//全撤消了
								$("#selectAll").attr("checked", false);//撤消全选复选框
								setJieSuanStyle(false);//使结算按钮不可用			
							} else {//未全选
								$("#selectAll").attr("checked", false);//撤消全选复选框
								setJieSuanStyle(true);//使结算按钮可用
							}
							showTotal();//重新计算合计
						});

		// 给jia、jian添加事件
		$(".jian").click(function() {
			var cartItemId = $(this).attr("id").substring(0, 32);
			var quantity = Number($("#" + cartItemId + "Quantity").val());
			if (quantity == 1) {
				if (confirm("您是否真要删除该条目？")) {
					location = "/transaction/deleteCart?cartId=" + cartItemId;
				}
			} else {
				sendUpdate(cartItemId, quantity - 1);
			}
		});
		$(".jia").click(function() {
			var cartItemId = $(this).attr("id").substring(0, 32);
			var quantity = Number($("#" + cartItemId + "Quantity").val());
			sendUpdate(cartItemId, quantity + 1);
		});
	});

	// 异步请求，修改数量
	function sendUpdate(cartItemId, number) {
		/*
		 1. 通过cartItemId找到输入框元素
		 2. 通过cartItemId找到小计元素
		 */
		var input = $("#" + cartItemId + "Quantity");
		var subtotal = $("#" + cartItemId + "Subtotal");
		var currPrice = $("#" + cartItemId + "CurrPrice");

		$.ajax({
			async : false,
			cache : false,
			type : "post",
			dataType : "json",
			url : "ajaxJiaAndJian",
			data : {
				singalCartId : cartItemId,
				quantity : number
			},
			success : function(result) {
				input.val(result.quantity);
				subtotal.text(round(Number(currPrice.text())
						* (result.quantity), 2));
				showTotal();
			}
		});
	}

	// 设置所有条目复选框
	function setAll(flag) {
		$(":checkbox[name=checkboxBtn]").attr("checked", flag);//让所有条目的复选框与参数flag同步
		showTotal();//重新设置合计
	}

	// 设置结算按钮的样式
	function setJieSuanStyle(flag) {
		if (flag) {// 有效状态
			$("#jiesuan").removeClass("kill").addClass("jiesuan");//切换样式
			$("#jiesuan").unbind("click");//撤消“点击无效”
		} else {// 无效状态
			$("#jiesuan").removeClass("jiesuan").addClass("kill");//切换样式
			$("#jiesuan").click(function() {//使其“点击无效”
				return false;
			});
		}
	}

	// 显示合计
	function showTotal() {
		var total = 0;//创建total，准备累加
		/*
		1. 获取所有被勾选的复选框，遍历之
		 */
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
			/*
			2. 通过复选框找到小计
			 */
			var subtotal = Number($("#" + $(this).val() + "Subtotal").text());
			total += subtotal;
		});
		/*
		3. 设置合计
		 */
		$("#total").text(round(total, 2));
	}

	/*
	 * 批量删除
	 */
	function batchDelete() {
		// 1. 获取所有被选中条目的复选框
		// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
		// 3. 指定location为CartItemServlet，参数method=batchDelete，参数cartItemIds=数组的toString()
		var cartItemIdArray = new Array();
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
			cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
		});
		location = "/transaction/deleteCart?cartId=" + cartItemIdArray;
	}
	
	/*
	* 结算
	*/
	function jiesuan()
	{
		/*
		* 1.获取已选框购物项id
		*/
		var cartItemIdArray = new Array();
		$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
			cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
		});
		//将隐藏域设值
		$("#cartItemIds").val(cartItemIdArray.toString());
		//让表单提交
		$("#jiesuanF").submit();
	}
	
</script>
</body>

</html>
