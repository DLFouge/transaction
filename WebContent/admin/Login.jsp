<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>中南大学二手交易 后台登录</title>
<link href="css/Login.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
<script>$(document).ready(function(c) {
	$('.close').on('click', function(c){
		$('.login-form').fadeOut('slow', function(c){
	  		$('.login-form').remove();
		});
	});	  
});
</script> 
 <!--SIGN UP-->
 <h1>中南大学二手跳蚤市场后台登录</h1>
<div class="login-form">
	<div class="close"> </div>
		
		
		<div class="head-info">
			<label style="color: red ; font-size: 18px;"><s:property value="errorMsg"/></label>
			<label class="lbl-1"></label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
		<img src="images/avtar.png" />
	</div>
			<form action="adminLogin" method="post" >
					<input type="text" name="loginname">		
					<div class="key">
					<input type="password" name="password">
					</div>
					<div class="signin">
					<input type="submit" value="Login" >
					</div>
			</form>
	
</div>
 <div class="copy-rights">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="#" target="_blank" title="中南大学二手市场主页">ER SHOU</a> - Collect from <a href="#" title="中南科技" target="_blank">二手市场</a></p>
			</div>

</body>
</html>