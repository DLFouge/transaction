<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/js/bootstrap.min.js">
<body>
<div style="width:1360px;">
<%@ include file="topnav.jsp"%>
<div class="line-2" style="margin-top:10px;"></div>
   <div >
   		<h2 class="text-center">-我的个人信息-</h2>
   		<div class="row">
   			<div class=".col-xs-12 line-bottom-2"></div>	
   		</div>
   		
   		<div class="row">
   			
   			<div class="col-xs-2 user-box">
   				<img id="3" src="/transaction/assets/dist/img/2505.jpg" width="100" height="100" class="img-responsive img-circle">
			
				<ul class="nav nav-pills nav-stacked text-center" style="margin-top:20px;">
					<li ><a href="viewUserInfo" >个人资料</a></li>
					<li class="active "><a href="userChangeInfo.jsp" style="font-weight: 800;font-size: 18px;">修改资料</a></li>
					<li><a href="changepass.jsp">修改密码</a></li>
					<li><a href="retrieve.jsp">找回密码</a></li>
					<s:if test="#session.user.applyStatus == 0">
						<li><a href="/transaction/assets/pages/improveUserInfo.jsp" target="_top">申请开店</a></li>
					</s:if>
					<s:elseif test="#session.user.applyStatus == 1">
					</s:elseif>
					<s:else>
					<li><a href="findCategory">上架商品</a></li>
					<li><a href="selectByUid">已上架商品</a></li>
					</s:else>
					
				</ul>
			</div>
			<form action="updateUserInfo" method="post" enctype="multipart/form-data">
         	<div class="col-xs-6 .col-xs-offset-2" style="margin-top:20px;margin-bottom:50px;margin-left:100px;box-shadow: 
         		inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;">
   				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px;margin-top:30px;">更新头像：</label>
				</div>
				<br>	
				<div  class="col-xs-6" style="margin-left:-15px;" >
				<input type="file"  name="avatar" class="form-control">
				</div >
				<div class="col-xs-3"></div>
			 	<br><br><br><br><br><br>
				
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">昵称：</label>
				</div>	
				<div class="input-group col-xs-9">
	         		<input type="text" class="form-control" name="nickName" value="<s:property value="userInfo.nickName"/>">
	      		</div>
				<br>
				
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">用户姓名：</label>
				</div>	
				<div class="input-group col-xs-9">
	         		<input type="text" class="form-control" name="realName" value="<s:property value="userInfo.realName"/>">
	      		</div>
				<br>
				
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">性别：</label>
				</div>
				<div class="input-group col-xs-9">
				<s:if test="userInfo.gender == '男'">
					<input type="radio" name="gender" value="男" selected="selected"> 男
					<input type="radio" name="gender" value="女"> 女
				</s:if>
				<s:else>
					<input type="radio" name="gender" value="男" > 男
					<input type="radio" name="gender" value="女" selected="selected"> 女
				</s:else>
					
				</div>
				<br>

				<div class="col-xs-3 text-center">
					<label class="pull-left" >年龄：</label>					
				</div>
				<div class="col-xs-9 text-center" style="margin-left:-30px;">	
				<div class="col-xs-4" >
						<select class="form-control" name="year">
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
						</select>
				</div>
				<div class="col-xs-4" >
						<select class="form-control" name="month">
							<option value="12">12</option>
							<option value="10">10</option>
							<option value="9">9</option>
						</select>
				</div>
				<div class="col-xs-4" >
						<select class="form-control" name="day">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
				</div>
				</div>
				<div class="col-xs-5"></div>
				<br>
				<br>
				<br>
				<div class="col-xs-3 text-center">
					<label class="pull-left">地址：</label>
				</div>
				<div class="col-xs-9 text-center" style="margin-left:-15px;">			
					<input type="text" name="address" class="form-control">					
				</div>			 
				   <br>
				   <br>
				   <br>
				   <br>
				   <input type="submit" class="btn btn-info col-xs-3 col-xs-offset-6" style="" value="保存">
				</div>
				</form>
   			</div>	
   		</div> 		  		
  <!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>
</div>
</body>
</html>