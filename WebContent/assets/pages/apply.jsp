<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="topnav.jsp"%>
<div class="fullscreen">
<div class="container">
	<h2>申请开店用户信息</h2>
   	<div class="row">
   		<div class=".col-xs-12 line-bottom-2"></div>	
   	</div>
   	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:10px;">
   	<div>
      	<ul class="nav navbar-nav">
      		<li class="active"><a href="#">所有用户</a></li>
         	<li><a href="#">待同意</a></li>
         	<li><a href="#">已同意</a></li>
         	<li><a href="#">已拒绝</a></li>
      	</ul>
     </div>
	 </nav>
     <div style="padding: 5px 5px 5px; margin-left:845px;">
   		<form class="bs-example bs-example-form" role="form">
	      	<div class="row">    
	         	<div >
	            	<div class="input-group">
	               		<input type="text" class="form-control">	               			
	               		<span class="input-group-btn">
	                  		<button class="btn btn-default" type="button">
	                     		用户搜索
	                  		</button>
	               		</span>
	            	</div><!-- /input-group -->
	         	</div><!-- /.col-lg-6 -->
	      	</div><!-- /.row -->
   		</form>
	</div>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:10px;">
   	<div>
      	<ul class="nav navbar-nav">
      		<li style="margin-left:80px"><a href="#">照片</a></li>
         	<li style="margin-left:80px"><a href="#">姓名</a></li>
         	<li style="margin-left:50px"><a href="#">性别</a></li>
         	<li style="margin-left:50px"><a href="#">入学年份</a></li>
         	<li style="margin-left:110px"><a href="#">专业</a></li>
         	<li class="dropdown" style="margin-left:110px">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		申请状态
               	<b class="caret"></b>
            	</a>
            	<ul class="dropdown-menu">
               	<li><a href="#"></a></li>
               	<li><a href="#"></a></li>
               	<li><a href="#"></a></li>      
            </ul>
         </li>
      	</ul>
     </div>
	 </nav>
	<div class="panel panel-default" >
   		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0px;">
   		<div>
	      	<ul class="nav navbar-nav">
	      		<li style="margin-left:50px">
					<a href="#"><img id="hz" src="../dist/img/hz.jpg" class="img-responsive img-rounded">
	      			</a>
	      		</li>
	         	<li style="margin-left:80px"><a href="#">余华</a></li>
	         	<li style="margin-left:50px"><a href="#">男</a></li>
	         	<li style="margin-left:60px"><a href="#">2015</a></li>
	         	<li style="margin-left:120px"><a href="#">软件工程</a></li>
	         	<li style="margin-left:110px"><a href="#">已同意<br>申请详情</a></li>
	      	</ul>
	     </div>
	 	</nav>   		 
	</div>
	<div class="panel panel-default" >
   		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0px;">
   		<div>
	      	<ul class="nav navbar-nav">
	      		<li style="margin-left:50px">
					<a href="#"><img id="hz" src="../dist/img/hz.jpg" class="img-responsive img-rounded">
	      			</a>
	      		</li>
	         	<li style="margin-left:80px"><a href="#">余华</a></li>
	         	<li style="margin-left:50px"><a href="#">男</a></li>
	         	<li style="margin-left:60px"><a href="#">2015</a></li>
	         	<li style="margin-left:90px"><a href="#">计算机科学与技术</a></li>
	         	<li style="margin-left:80px"><a href="#">待同意<br>申请详情</a></li>
	      	</ul>
	     </div>
	 	</nav>   		 
	</div>
	<div class="panel panel-default" >
   		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0px;">
   		<div>
	      	<ul class="nav navbar-nav">
	      		<li style="margin-left:50px">
					<a href="#"><img id="hz" src="../dist/img/hz.jpg" class="img-responsive img-rounded">
	      			</a>
	      		</li>
	         	<li style="margin-left:80px"><a href="#">余华</a></li>
	         	<li style="margin-left:50px"><a href="#">男</a></li>
	         	<li style="margin-left:60px"><a href="#">2015</a></li>
	         	<li style="margin-left:120px"><a href="#">软件工程</a></li>
	         	<li style="margin-left:110px"><a href="#">已同意<br>申请详情</a></li>
	      	</ul>
	     </div>
	 	</nav>   		 
	</div>
	
	<ul class="pagination pull-right" >
	  <li><a href="#">&laquo;</a></li>
	  <li class="active"><a href="#">1</a></li>
	  <li class="disabled"><a href="#">2</a></li>
	  <li><a href="#">3</a></li>
	  <li><a href="#">4</a></li>
	  <li><a href="#">5</a></li>
	  <li><a href="#">&raquo;</a></li>
	</ul>
	
</div>
</div>
	<!-- 底部导航 -->
			<%@ include file="bottom.jsp"%>

</body>
</html>