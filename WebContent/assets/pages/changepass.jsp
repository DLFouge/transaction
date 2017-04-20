<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- 头部导航 -->
<%@ include file="topnav.jsp"%>
			<div class="col-xs-12 line-bottom-1">
				
			</div>
<div class="container  text-center">
	<h2>-修改个人密码-</h2>
	<div class="row">
   			<div class="col-xs-12 line-bottom-2"></div>	
   	</div>
	<div class="row">
	<form action="updatePassword" method="post">
		<div class="col-xs-8" style="margin-top:50px;margin-bottom:50px;margin-left:200px;padding:30px;">
         	<div class="col-xs-3 text-center">
				<label class = "pull-left" style="margin-right:1px;">请输入旧密码：</label>
			</div>
			<div class="input-group col-xs-6">
	         		<input type="text" class="form-control" id="oldPassword" name="oldPassword">
	      	</div>	
					
			<div class="col-xs-3 text-center" style="height:10px;">
				<label class = "pull-right text-color-red" style="margin-right:1px" id="oldPasswordError"><s:property value="errors.oldPassword[0]"/></label>
			</div>
			<br>
				
			<div class="col-xs-3 text-center">
				<label class = "pull-left" style="margin-right:1px">请输入新密码：</label>
			</div>
			<div class="input-group col-xs-6">
	         		<input type="text" class="form-control" id="newPassword" name="newPassword">
	      	</div>
	      	<div class="col-xs-3 text-center" style="height:10px;">
				<label class = "pull-right text-color-red" style="margin-right:1px" id="newPasswordError"><s:property value="errors.newPassword[0]"/></label>
			</div>	
			<br>
			
			<div class="col-xs-3 text-center">
				<label class = "pull-left" style="margin-right:1px">请确认新密码：</label>
			</div>
			<div class="input-group col-xs-6">
	         		<input type="text" class="form-control" id="repeatNewPassword" name="repeatNewPassword">
	      	</div>
			
			<div class="col-xs-3 text-center">
				<label class = "pull-right text-color-red" style="margin-right:1px" id="repeatNewPasswordError"><s:property value="errors.repeatNewPassword[0]"/></label>
			</div>
			<br>
			<br>
			<br>
			<div class="btn-group col-xs-6 pull-right" style="margin-right:125px;" data-toggle="buttons">
      			<input class="btn btn-primary col-xs-6 " type="submit" name="options" id="option1" id="registForm" value="保存"> 
   			</div>
			<br>
        </div>
        </form>
	</div>      					      			
</div>
	<!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>

</body>
</html>