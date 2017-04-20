<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 头部导航 -->
<%@ include file="topnav.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 line-bottom-1">
				<h4>找回密码</h4>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="margin-top: 45px;">
				<div class="col-xs-4"></div>
				<form action="sendEmailToFindPassword" method="post">
				<div class="col-xs-4">
				
						<div class="col-xs-4 text-center">
						<label class = "pull-right" style="margin-top:7px;">邮箱:</label>
						</div>						
						<div class="input-group col-xs-8">
         					<input type="text" class="form-control" name="email">
      					 </div>
      					 
      					 <br>
      					 
						  <div style="float:center; padding-left:150px;">
								
								<p><input type="submit" class="btn btn-primary btn-lg col-xs-10" value="邮箱找回">
   						   		</p>
						   </div>
   						   
				</div>
				</form>
				<div class="col-xs-4">
				
					<div class="col-xs-12">
						<label class = "pull-left" style="margin-top:7px;"><font color="#FF0000"><s:property value="errors.email[0]"/></font></label>
						</div>						
      					 
      					 <br>
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