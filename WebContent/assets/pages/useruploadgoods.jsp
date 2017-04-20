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
	<div style="width: 1340px;">
		<%@ include file="topnav.jsp"%>
		<div class="line-2" style="margin-top: 10px;"></div>
		<div>
			<h2 class="text-center">-商品上架-</h2>
			<div class="row">
				<div class="col-xs-12 line-bottom-2"></div>
			</div>

			<div class="row">

				<div class="col-xs-2 user-box">
					<img id="3" src="/transaction/assets/dist/img/2505.jpg"
						class="img-responsive img-circle">
					<ul class="nav nav-pills nav-stacked text-center" style="margin-top: 20px;">
						<li><a href="viewUserInfo" >个人资料</a></li>
						<li ><a href="/transaction/assets/pages/userChangeInfo.jsp">修改资料</a></li>
						<li><a href="/transaction/assets/pages/changepass.jsp">修改密码</a></li>
						<li><a href="/transaction/assets/pages/retrieve.jsp">找回密码</a></li>
						<s:if test="#session.user.applyStatus == 0">
							<li><a href="#">申请开店</a></li>
						</s:if>
						<s:else>
							<li class="active"><a style="font-weight: 800;font-size: 18px;" href="/transaction/assets/pages/useruploadgoods.jsp">上架商品</a></li>
							<li><a href="selectByUid">已上架商品</a></li>
						</s:else>

					</ul>
				</div>
				<form action="uploadGodds" method="post"
					enctype="multipart/form-data">
					<div class="col-xs-7 col-xs-offset-1"
						style="margin-top: 20px; margin-bottom: 50px; box-shadow: inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;">
						<div class="container">
							<form action="uploadGodds" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-7"
										style="margin-top: 20px; margin-bottom: 50px; margin-left: 30px; box-shadow: inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;">
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">商品名称：</label>
										</div>
										<div class="input-group col-xs-9">
											<input type="text" class="form-control" name="goodsName">
										</div>
										<br>

										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">商品价格：</label>
										</div>
										<div class="input-group col-xs-9">
											<input type="text" class="form-control" name="goodsPrice">
										</div>
										<br>								
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">商品描述：</label>
										</div>
										<div class="input-group col-xs-9">
											<input type="text" class="form-control" name="goodsDescribe">
										</div>
										<br>		
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">上架时间：</label>
										</div>
										<div class="input-group col-xs-9">
											<input type="text" name="onSaleTime" class="form-control">
										</div>
										<br>
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">新旧程度：</label>
										</div>
										<div class="input-group col-xs-9">
											<input type="text" name="degree" class="form-control">
										</div>
										<br>
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">分类：</label>
										</div>
										<div class="input-group">
											一级分类：<select name="pid" id="pid"
							onchange="loadChildren()">
								<option>===请选择1级分类===</option>
								<s:iterator value="category">
									<option value="<s:property value="categoryId"/>"><s:property value="categoryName"/></option>
								</s:iterator>
						</select>
						
						二级分类：<select name="categoryId" id="cid">
								<option value="">===请选择2级分类===</option>
						</select>
						


										</div>
										<br>
										<div class="col-xs-3 text-center">
											<label class="pull-left" style="margin-right: 1px">上传图片：</label>
										</div>
										<div class="input-group col-xs-9 ">
											<div class="col-xs-8 pull-left" id="fileaddbox">
											<input type="file" name="goodsPicture">
											</div>
											<a class="glyphicon glyphicon-plus-sign btn "  id="addbutton">添加上传</a>
											
										</div>
										<br>
										<br> <input type="submit" class="btn btn-info col-xs-3 col-xs-offset-6"   value="保存">
									</div>

								</div>
								</form>
						</div>
						</div>
				</form>
			</div>
		</div>
		<!-- 底部导航 -->
		<%@ include file="bottom.jsp"%>
	</div>
</body>
<script type="text/javascript">
	$("#addbutton").click(function(){	
			
			$("#fileaddbox").append('<input type="file" name="goodsPicture" >');	
			
		});
	function loadChildren() {
		//1.获取pid
		var pid = $("#pid").val();
		//2.发送异步请求
		$.ajax({
			async : true,
			cache : false,
			url : "ajaxFindSubCategory",
			data : {
				cid : pid
			},
			type : "POST",
			dataType : "json",
			success : function(arr) {
				//3.得到cid，删除它的内容
				$("#cid").empty();//删除元素的子元素
				$("#cid").append($("<option>===请选择2级分类===</option>"));//5.添加头
				//5.循环遍历数组，把每个对象转换成<option>添加到cid中
				for ( var i = 0; i < arr.length; i++) {
					var option = $("<option>").val(arr[i].cid).text(
							arr[i].cname);
					$("#cid").append(option);
				}
			}
		});

	}
</script>
</html>