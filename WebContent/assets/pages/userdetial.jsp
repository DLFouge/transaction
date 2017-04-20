<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
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
   				<img id="3" src="/transaction/user_img/<s:property value="userInfo.photoAddress"/>" width="100" height="100" class="img-responsive img-circle">
				<ul class="nav nav-pills nav-stacked ul-click text-center" style="margin-top:20px;">
					<li class="active "><a href="#" style="font-weight: 800;font-size: 18px;">个人资料</a></li>
					<li><a href="/transaction/assets/pages/userChangeInfo.jsp">修改资料</a></li>
					<li><a href="/transaction/assets/pages/changepass.jsp">修改密码</a></li>
					<li><a href="/transaction/assets/pages/retrieve.jsp">找回密码</a></li>
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
					<label class = "pull-left" style="margin-right:1px;margin-top:30px;">当前头像：</label>
				</div>	
				<div  class="col-xs-6" >
					<img id="3" src="/transaction/user_img/<s:property value="userInfo.photoAddress"/>" width="100" height="100" class="img-responsive img-circle">
				</div >
				<div class="col-xs-3"></div>
			 	<br><br><br><br><br><br>
				
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">昵称：</label>
				</div>	
				<div class=" col-xs-9">
	         		<span><s:property value="userInfo.nickName"/></span>
	      		</div>
				<br>
				<br>
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">用户姓名：</label>
				</div>	
				<div class="col-xs-9">
	         		<span><s:property value="userInfo.realName"/></span>
	      		</div>
				<br>
				<br>
				<div class="col-xs-3 text-center">
					<label class = "pull-left" style="margin-right:1px">性别：</label>
				</div>
				<div class=" col-xs-9">
					<span><s:property value="userInfo.gender"/></span>
				</div>
				<br>
				<br>
				<div class="col-xs-3 text-center">
					<label class="pull-left" >出生日期：</label>					
				</div>
				<div class="col-xs-9 " >	
					<span><s:property value="userInfo.birthday"/></span>
				</div>
				<br>
				<br>
				<br>
				<div class="col-xs-3 text-center">
					<label class="pull-left">地址：</label>
				</div>
				<div class="col-xs-9 " >			
					<span><s:property value="userInfo.address"/></span>				
				</div>			 
				   <br>
				   <br>
				   <br>
				   <br>
				 
				</div>
				</form>
   			</div>	
   		</div> 		  		
  <!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>
</div>
</body>
</html>