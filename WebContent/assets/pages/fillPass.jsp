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
				<h4>填写新密码</h4>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
		 <form action="fillPass" method="post">
			<div class="col-xs-12" style="margin-top: 45px;">
				<div class="col-xs-4"></div>
				
				<div class="col-xs-4">
				<%
					String uid = request.getParameter("uid");
				%>
				         <input type="hidden" name="uid" value="<%=uid%>">
						 <label class = "pull-left" style="margin-top:7px;">新密码:</label>
						 <div class="input-group col-xs-10">
         					<input type="text" class="form-control" id="newPassword" name="newPassword">
      					 </div>
      					 <div class="col-xs-12" style="height:10px;">
      					 <label class = "pull-right text-color-red" id="newPasswordError"><s:property value="errors.newPassword[0]"/></label>
      					 </div>
      					 <br>
      					 <label class = "pull-left" style="margin-top:7px;">重复密码:&nbsp; &nbsp;</label>
      					  <div class="input-group col-xs-9">
         					<input type="text" class="form-control" id="repeatNewPassword" name="repeatNewPassword">
      					 </div>
    					<div class="col-xs-12 " style="height:10px;">
      					 <label class = "pull-right text-color-red" id="repeatNewPasswordError"><font color="#FF0000"><s:property value="errors.repeatNewPassword[0]" /></font></label>
      					 </div>
      					 <br>
						  <div class="pull-left" style="margin-left:125px;">
								
								<br>
								<p><input type="submit" id="registForm" class="btn btn-primary btn-lg col-xs-12" value="确认新密码">
                                                                                    
   						   		</p>
						   </div>
      			</div>		 
      					 
      					
   						  
				</div>
				</form>
				<div class="col-xs-4">
				
					<div class="col-xs-12">
      					 
      					 
      					 
      					 <br>
      					 
      					 
      					 <br>

				</div>
				
			</div>
			
		</div>
	</div>
	
	<div class="background-color-3" style="height: 135px; margin-top: 85px;">
	</div>
</body>
</html>