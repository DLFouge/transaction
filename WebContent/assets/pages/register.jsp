<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="topnav.jsp"%>
	<div class="container ">
		<div class="row">
			<div class="col-xs-12 line-bottom-1">
				<h4>欢迎注册二手网</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin-top: 45px;">
				<div class="col-xs-4"></div>
				<form action="regist" method="post">
				<div class="col-xs-4">

					<div class="col-xs-4 text-center">
						<label class="pull-right" style="margin-top: 7px;">用户名:</label>
					</div>
					<div class="input-group col-xs-8">
						<input type="text" class="form-control" name="username"
							id="username"> <span class="input-group-addon"></span>
					</div>
					
					<div class="col-xs-12"  style="height:10px;">
						<label id="usernameError" class="text-color-red pull-right"><s:property
								value="errors.username[0]" />*</label>	
					</div>
					<br>

					<div class="col-xs-4">
						<label class="pull-right" style="margin-top: 7px;">请设置密码:</label>
					</div>
					<div class="input-group col-xs-8">
						<input type="password" class="form-control" name="password"
							id="password"> <span class="input-group-addon"></span>
					</div>
					<div class="col-xs-12" style="height:10px;">
						<label id="passwordError" class="text-color-red pull-right"><s:property
								value="errors.password[0]" />*</label>
					</div>
					<br>

					<div class="col-xs-4">
						<label class="pull-right" style="margin-top: 7px;"
							>确认密码：</label>
					</div>
					<div class="input-group col-xs-8">
						<input type="password" class="form-control" name="repeatpassword" id="repeatpassword"> <span
							class="input-group-addon" ></span>
					</div>
					<div class="col-xs-12" style="height:10px;">
						<label id="repeatpasswordError" class="text-color-red pull-right"><s:property
								value="errors.repeatpassword[0]" />*</label>
					</div>
					<br>
					<div class="col-xs-4">
						<label class="pull-right" style="margin-top: 7px;"> 邮箱：</label>
					</div>
					<div class="input-group col-xs-8">
						<input type="text" class="form-control" id="email" name="email"> <span
							class="input-group-addon"></span>
					</div>
					<div class="col-xs-12" style="height:10px;">
						<label id="emailError" class="text-color-red pull-right"><s:property
								value="errors.email[0]" />*</label>
					</div>

					<br>
					
					<div class="col-xs-4">
						<label class="pull-right" style="margin-top: 7px;">验证码：</label>
					</div>
					<div class="col-xs-4">
						<input type="text" class="form-control pull-right" id="verifyCode" name="verifyCode">
					</div>
					<div class="input-group col-xs-2">
						<span class="input-group-addon"><img id="imgVerifyCode"
							src="<s:url value='rand?a=<%=new Date().getTime()%>'/>"
							class="img-responsive" style="height: 25px; width: 55px;"></span>
						
					</div>
					<div class="col-xs-12" style="height:10px;">					
						<label id="verifyCodeError" class="text-color-red pull-right" ><s:property
								value="errors.verifyCode[0]" />*</label>
					</div>
					<br>
					<label class="pull-right"><font
							color="#FF0000"><a href="javascript:_hyz()" class="pull-right">换一张</a> 
							</font></label>
					
					

					<br>

					<div style="text-align: center;">
						<p>
							<label><input name="Fruit" type="checkbox" value="" /><a
								href="" title="用户注册协议" target="_blank">我已阅读并同意《用户注册协议》</a></label>
						</p>
						<br>
						<p>
							<input type="submit" id="registForm" class="btn btn-primary btn-lg col-xs-12" value="注册">
						</p>
					</div>

				</div>
				</form>
				<div class="col-xs-4">
				</div>

			</div>

		</div>
	</div>
<br><br><br>
<div >
	<img id="icon" src="../dist/img/bottom.jpg" class="img-responsive img-rounded">
</div>
</body>
</html>