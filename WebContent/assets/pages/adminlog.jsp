<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/js/bootstrap.min.js">
</head>
<body>
<div class="background-color-1" style="height: 45px;">
		<div class="row">
			<div class="col-xs-2"></div>
			<div class="col-xs-2"></div>
		</div>
	</div>
	<div class="background-color-2" style="height: 35px;">
		<div class="container">
			<div class="row" style="margin-top: 8px;">
				<div class="col-xs-4">
					<div class="col-xs-6">
						<p>欢迎来二手网
						<p>
					</div>
					<div class="col-xs-3">
						<p>请登录
						<p>
					</div>
					<div class="col-xs-3">
						<p>免费注册
						<p>
					</div>
				</div>
				<div class="col-xs-8 text-center">
					<div class="col-xs-2">
						<p>我的宝物
						<p>
					</div>
					<div class="col-xs-3">
						<p>
							<span class="glyphicon glyphicon-heart text-color-red"></span>我关注的商家
						<p>
					</div>
					<div class="col-xs-3">
						<p>
							<span class="glyphicon glyphicon-shopping-cart text-color-red"></span>购物车0件
						<p>
					</div>
					<div class="col-xs-2">
						<p>收藏商品
						<p>
					</div>
					<div class="col-xs-2">
						<p>商家支持
						<p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-2">
				<img id="icon" src="../dist/img/icon.jpg"
					class="img-responsive img-rounded">
			</div>
			<div class="col-xs-2"></div>
			<div class="col-xs-6">
				<div class="input-group " style="margin-top: 45px;">
					<input type="text" class="form-control"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">搜索</button>
					</span>
				</div>
				<!-- /input-group -->
				<div>
					<a>书籍 </a>/<a> 影像 </a>/<a> 游戏手柄 </a>/<a> 耳机 </a>/<a> 裤子 </a>/<a>
						衣服 </a>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 line-bottom-1">
				<h4>管理员登录</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin-top: 45px;">
				<div class="col-xs-3"></div>
			<div class="col-xs-9">	
<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">用户名：</label>
    <div class="col-sm-4">
      <input type="请输入用户名" class="form-control" id="inputEmail3" placeholder="请输入用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
    <div class="col-sm-4">
      <input type="请输入密码" class="form-control" id="inputPassword3" placeholder="请输入密码">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> 记住用户名
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">登   陆</button>
    </div>
  </div>
</form>
	</div>
	
	</div>

	</div>
	</div>
	<!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>
</body>
</html>