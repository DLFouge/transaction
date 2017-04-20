<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../bootstrap/js/bootstrap.min.js">
</head>
<body>

<div class="background-color-1" style="height:45px;">
   <div class="row">
      <div class="col-xs-2">
      		
      </div>
      <div class="col-xs-2"></div>      
   </div>
</div>
<div class="background-color-2" style="height:35px;">
   <div class="container">
    <div class="row" style="margin-top:8px;">
    	<div class="col-xs-4">
     		 <div class="col-xs-6"><p>欢迎来二手网<p></div>
     		 <div class="col-xs-3"><p>免费注册<p></div>       
   		</div>
   		<div class="col-xs-8 text-center">
     		 <div class="col-xs-2"><p>我的宝物<p></div>
     		 <div class="col-xs-3"><p><span class="glyphicon glyphicon-heart text-color-red"></span>我关注的商家<p></div> 
     		 <div class="col-xs-3"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span>购物车0件<p></div> 
     		 <div class="col-xs-2"><p>收藏商品<p></div> 
     		 <div class="col-xs-2"><p>商家支持<p></div>      
   		</div>
   	</div>
   </div>
</div>

<div class="container">
    <div class="row">
    	<div class="col-xs-2">
     		 <img id="icon" src="../dist/img/icon.jpg" class="img-responsive img-rounded">
   		</div>
   		<div class="col-xs-2"></div>
   		<div class="col-xs-6">
     		<div class="input-group " style="margin-top:45px;">
               <input type="text" class="form-control">
               <span class="input-group-btn">
                  <button class="btn btn-default" type="button">
                    	 搜索
                  </button>
               </span>
            </div><!-- /input-group -->
            <div>
            	<a>书籍	</a>/<a>	影像	</a>/<a>	游戏手柄	</a>/<a>	耳机	</a>/<a>	裤子	</a>/<a>	衣服	</a>
            </div>  
   		</div>
   	</div>
</div>

<div class="container">
	<h3>填写并核对订单信息</h3>
   	<div class="row">
   		<div class=".col-xs-12 line-bottom-2"></div>	
   	</div>
  	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:80%;margin-top:10px;">
   	<div>
      	<ul class="nav navbar-nav">
      		<li><a href="#">收货人信息</a></li>
      		<li>	      			    
		      	<input type="button" class="btn btn-default" style="margin-left:680px;margin-top:10px;" value="新增收货地址" onclick="document.getElementById('myBtn').style.display='block'" />
		      	<div id="myBtn" style="display:none;" class="container">
					<div class="panel panel-default" style="width:70%;margin-top:-10px;">
				   		<nav class="navbar navbar-default navbar-static-top" role="navigation">
						   	<div>
						      	<ul class="nav navbar-nav">
						      		<li><a href="#">新增收货地址</a></li>		         		         
						      	</ul>
						     </div>
						 </nav>		 
						 <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:-20px;margin-bottom:-20px;">
						     <div class="col-md-7" style="width:80%;margin-top:20px;margin-bottom:50px;margin-left:30px;box-shadow: 
				         		inset 1px -1px 1px #fff, inset -1px 1px 1px #fff;">
				         		<div class="col-xs-3 text-center" style="margin-top:15px;">
									<label class = "pull-left">收货人：</label>
								</div>	
								<div class="input-group col-xs-6" style="margin-top:10px;">
					         		<input type="text" class="form-control">
					      		</div>
								<br>			
								
								<div class="col-xs-3 text-center">
									<label class = "pull-left">地址：</label>
								</div>	
								<div class="dropdown">
								   <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
								      data-toggle="dropdown">省/直辖市
								      <span class="caret"></span>
								   </button>
								   <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								      <li role="presentation">
								         <a role="menuitem" tabindex="-1" href="#"></a>
								      </li>				    
								   </ul>
								    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
								      data-toggle="dropdown">市
								      <span class="caret"></span>
								   </button>
								   <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								      <li role="presentation">
								         <a role="menuitem" tabindex="-1" href="#"></a>
								      </li>				    
								   </ul>
								   <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
								      data-toggle="dropdown">区/县
								      <span class="caret"></span>
								   </button>
								   <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								      <li role="presentation">
								         <a role="menuitem" tabindex="-1" href="#"></a>
								      </li>				    
								   </ul>
								</div>
								<br>
								
								<div class="col-xs-3 text-center">
									<label class = "pull-left">详细地址：</label>
								</div>
								<div class="input-group col-xs-6">
					         		<input type="text" class="form-control">
					      		</div>
								<br>
								
								<div class="col-xs-3 text-center">
									<label class = "pull-left">手机号：</label>
								</div>
								<div class="input-group col-xs-6">
					         		<input type="text" class="form-control">
					      		</div>
								<br>
								
								<div class="col-xs-3 text-center">
									<label class = "pull-left">备用电话：</label>
								</div>
								<div class="input-group col-xs-6">
					         		<input type="text" class="form-control">
					      		</div>
								<br>
								
								<div>
									<input type="button" class="btn btn-default" style="margin-left:200px;margin-bottom:10px;" value="保存收货地址" onclick="document.getElementById('myBtn').style.display='none'" />
								</div>																	
					 	</nav>	 																																												 					 		
				</div>		      	
		     </li>
		     <br>
        	        	
         	<div class="addr-detail" style="margin-left:100px;margin-bottom:20px;">
				<span class="addr-name" limit="6">余华</span>
				<span class="addr-info" limit="45" style="margin-left:20px;">中南大学铁道学院新二舍</span>
		 		<span class="addr-tel" style="margin-left:20px;">155****8461</span>
				<span class="addr-default" style="margin-left:20px;">默认地址</span>
			</div>         	      	
      	</ul>
     </div>
	 </nav>
	 
	 <nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:80%;margin-top:-10px;">
	   	<div>
	      	<ul class="nav navbar-nav">
	      		<li><a href="#">支付方式</a></li><br>
	      		<li style="margin-bottom:20px;">
	      			<div class="btn-group" style="margin-left:50px;">
	      				<button type="button" class="btn btn-default">货到付款</button>
	      			</div>
	      			<div class="btn-group">
	      				<button type="button" class="btn btn-default" style="margin-left:20px;">在线支付</button>
	      			</div>
	      		</li>
	      	</ul>
	     </div>
	 </nav>
	 
	 <nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:80%;margin-top:-10px;">
	   	<div class="col-xs-2 text-center" style="margin-top:20px;margin-bottom:20px;">
			<label class = "pull-left">收货时间：</label>
		</div>
		<div class="input-group" style="margin-top:20px;margin-bottom:20px;">
			<input type="radio"> 12:00-13:00
			<input type="radio" style="margin-left:80px;"> 21:30-22:30
		</div>
	 </nav>
	 
	 <div class="panel panel-default" style="width:80%;margin-top:-10px;">
   		<nav class="navbar navbar-default navbar-static-top" role="navigation">
		   	<div>
		      	<ul class="nav navbar-nav">
		      		<li><a href="#">订单商品信息</a></li>		         
		         	<li style="margin-left:600px"><a href="#">返回购物车修改商品</a></li>
		      	</ul>
		     </div>
	 	</nav>
	 	
   		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:-10px;">
   		<div>
	      	<ul class="nav navbar-nav" style="margin-left:80px;">
	      		<li>
					<a href="#"><img id="hz" src="../dist/img/hz.jpg" class="img-responsive img-rounded">
	      			</a>
	      		</li>
	         	<li style="margin-left:80px;"><a href="#">余华作品：活着（新版）</a></li>
	         	<li style="margin-left:100px"><a href="#">单价<br>12.60</a></li>
	         	<li style="margin-left:50px"><a href="#">数量<br>x1</a></li>
	         	<li style="margin-left:50px"><a href="#"><br>有货</a></li>	         	
	      	</ul>
	     </div>
	 </nav>   		 
	 </div>
	
	 <div style="margin-left:550px;">
		<ul>
			<a>运费：￥0.00</a>
			<a style="margin-left:50px;">本订单金额：￥12.60</a>
		</ul>
	 </div>
	 
	 <nav class="navbar navbar-default navbar-static-top" role="navigation" style="width:80%;margin-top:10px;">
	   	<div>
	      	<ul class="nav navbar-nav">
	      		<li style="margin-left:660px;"><a href="#">寄送至：中南大学铁道学院新二舍</a></li>
	         	<li style="margin-left:700px;"><a href="#">收货人：余华 155****8461</a></li>        	        		               	      	
	      	</ul>
	     </div>
	 </nav>
	 
	 <div style="margin-left:630px;">
		<ul>
			<a>应付总额：￥12.60</a>
			<div class="btn-group" style="margin-left:30px;">
	      		<button type="button" class="btn btn-default">提交订单</button>
	      	</div>
		</ul>
	 </div>	 
</div>



<div class="background-color-3" style="height: 135px; margin-top: 85px;">
</div>

</body>
</html>

