<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>二手市场登录页面</title>
<%@ include file="basejscss.jsp"%>
</head>
<body>
<div style="width:1360px;">
	<div class="container">
		<div class="col-xs-4" >
			<img src=" <%=basePath%>/assets/dist/img/logo2.png" style="width:175px;margin-left: -25px;">
		</div>
	</div>
	<div style="width:100%">
		<div class="pull-left">
		<img id="icon" src="<%=basePath%>/assets/dist/img/login-bg.jpg" class="img-responsive">
		</div>
		<div class="col-xs-3 pull-right background-color-2" style="height:400px; margin-top:-450px; margin-right:150px;">
			<div><h4 class="font-weight-1">账号登录</h4></div>
			<div class="line-2"></div>
			<div>
				<form action="login" class="bs-example bs-example-form" role="form">
						<br>
						<br>
						<div style="height:10px;">
						<label id="nousername" class="text-color-red"><s:property value="errors.username[0]"/></label>
						</div>
						<div class="input-group">
							<span class="input-group-addon">用户名</span> 
							<input type="text" name="username" id="username" class="form-control" placeholder="邮箱/手机号/账号">

						</div>
						<div style="height:10px;">
						<label id="usernameError" class="text-color-red"><s:property value="errors.username[0]"/></label>
						</div>
						<br>					
						<div class="input-group" >
							<span class="input-group-addon">密&nbsp;&nbsp;&nbsp; 码</span> 
							<input type="password" name="password" id="password" class="form-control" placeholder="密码长度至少八位">
						</div>
						<div style="height:10px;">
							<label id="passwordError" class="text-color-red"><s:property value="errors.password[0]"/></label>
						</div>
						<br>
						<div class="input-group" >
							<span class="input-group-addon">验证码</span> 
							<input type="text" name="verifyCode" id="verifyCode" class="form-control" placeholder="请输入验证码">
							<span class="input-group-addon"><img id="imgVerifyCode" src="<s:url value='rand?a=<%=new Date().getTime() %>'/>" class="img-responsive" style="height:20px;width:55px;"></span> 
						</div>
						<div style="height:10px;">
						<label id="verifyCodeError" class="text-color-red" ><s:property value="errors.verifyCode[0]"/></label>
						<a href="javascript:_hyz()" class="pull-right">换一张</a>
						</div>
						<br>
						<input type="submit" id="submit" class="btn btn-danger col-xs-12" value="登录">
						<div><a href="<%=basePath%>/assets/pages/register.jsp">注册</a> <a class="pull-right" href="<%=basePath%>/assets/pages/retrieve.jsp">忘记密码</a></div>
				</form>
			</div>

		</div>
	</div>
</div>
</body>
</html>