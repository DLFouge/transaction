<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
</head>
<body>
	<!-- 头部导航 -->
	<div class="fullscreen">
	<%@ include file="topnav.jsp"%>
	
	<div class="container ">
		<div class="row">
		 <div class="col-xs-12">
			<div class="panel panel-default">
   				<div class="panel-heading">
    				  <a href="#" style="color:#9D9D9D">首页</a>><a href="#" style="color:#9D9D9D">图书分类</a>><a href="#" style="color:#9D9D9D">韩语学习</a>
   				</div>
			</div>
		</div>
	   </div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" >
				<div class="panel panel-default" style="height:480px;margin-top:10px;margin-right:10px;">
   					<div class="panel-body">
   					    <div class="col-xs-4" style="height:400px;border:1px;text-align:center;">
							<div class="col-xs-12"  id="photoContainer ">
   								<a href="#" class="thumbnail" style="height:300px;width:250px; overflow: hidden;">
         							<img id="photo" src="" class="img-responsive" alt="通用的占位符缩略图" >
      							</a>
   							</div>
   							<div class="box-goods-pic" id="thumbnails">
   								<ul>
   								<li >
   								<img src="/transaction/shopping_img/<s:property value="goods.pictureTop"/>"  width="50" height="50">
   								</li>
   								<li >
   								<img src="/transaction/shopping_img/<s:property value="goods.pictureLeft"/>"  width="50" height="50">
   								</li>
   								<li >
   								<img src="/transaction/shopping_img/<s:property value="goods.pictureRight"/>" width="50" height="50">
   								</li>
   								<li >
   								<img src="/transaction/shopping_img/<s:property value="goods.pictureBottom"/>" width="50" height="50">
   								</li>
   								</ul>
   							</div>
						</div>
   						
   						<div class="col-xs-5" style="height:40px;border:1px;text-align:center; margin-top:25px;">
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="font-size:25px;"><s:property value="goods.goodsName"/></label>
							</div>
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="margin-top:10px;font-size:18px;">二手价：<font color="#000000" style="font-size:16px;" class="text-color-red"><s:property value="goods.goodsPrice"/>&nbsp;&nbsp;元</font></label>
							</div>
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="margin-top:10px;font-size:18px;">商品描述：<font color="#000000" style="font-size:16px;"><s:property value="goods.goodsDescribe"/></font></label>
							</div>
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="margin-top:10px;font-size:18px;">上架时间：<font color="#000000" style="font-size:16px;"><s:property value="goods.onSaleTime"/></font></label>
							</div>
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="margin-top:10px;font-size:18px;">新旧程度：<font color="#000000" style="font-size:16px;"><s:property value="goods.degree"/></font></label>
							</div>
							<form action="addToCart" method="post">
							<div class="col-xs-12">
							<input type="hidden" name="goodsId" value="<s:property value="goods.goodsId"/>">
							<label class="text-color-black pull-left" style="margin-top:10px;font-size:18px;">购买数量：<input type="text" name="quantity"></label>
							</div>
							<br>
							
							<div class="col-xs-12 margin-top-1" >
							
								<div class="col-xs-6 " style="margin-left:-40px;">
									<button type="submit" class="btn btn-default" style="font-size:18px;  border: 2px red solid;">
      									<a style="color: red;">加入购物车</a>
   									</button>									
   								</div>
   								
							</div>
							</form>
						</div>
   						
   						<div class="col-xs-3" style="height:40px;border:1px;text-align:center;">
							<div class="col-xs-12">
								<div class="col-xs-3" style="width:110px;height:70px;text-align:center;">
   									<a href="#" class="thumbnail">
         								<img src="/transaction/user_img/<s:property value="userInfo.photoAddress"/>" alt="通用的占位符缩略图" class="img-circle">
      								</a>
   								</div>
								<label class="pull-left" style="margin-top:25px;"><font color="#6495ED"><s:property value="userInfo.nickName"/></font></label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-6">
									<button type="button" class="btn btn-primary active pull-left" style="margin-top:10px;font-size:12px;background:blue;">
      									客服留言
   									</button>
   								</div>
   								<div class="col-xs-6">
									<button type="button" class="btn btn-primary active pull-left" style="margin-top:10px;font-size:12px;background:blue;">
      									问JIMI
   									</button>
   								</div>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-6">
									<button type="button" class="btn btn-primary active pull-left" style="margin-top:10px;font-size:12px;background:gray;">
      									进入店铺
   									</button>
   								</div>
   								<div class="col-xs-6">
									<button type="button" class="btn btn-primary active pull-left" style="margin-top:10px;font-size:12px;background:gray;">
      									关注店铺
   									</button>
   								</div>
							</div>
							<div class="col-xs-12">
								<label class="text-color-black pull-left" style="margin-top:10px;font-size:12px;">服务支持：</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-6">
									<a class="text-color-green pull-left" style="margin-top:10px;">夜间配</a>
								</div>
								<div class="col-xs-6">
									<a class="text-color-green pull-left" style="margin-top:10px;">自提</a>
								</div>
							</div>
						</div>
   					</div>
				</div>
			</div>
	  	</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12" >
				<div class="panel panel-default" style="height:360px;">
   					<div class="panel-heading">
      					<ul class="nav nav-tabs">
   							<li class="active"><a href="#" style="color:#9D9D9D">推荐</a></li>
   							<li><a href="#" style="color:#9D9D9D">优惠</a></li>
   							<li><a href="#" style="color:#9D9D9D">最佳 </a></li>
						</ul>
   					</div>
   					<div class="panel-body">
   						
   						<div class="div-a"></div>
   						
						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB1.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">韩后<span class="text-color-red">￥1380.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB11.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">乐扣<span class="text-color-red">￥138.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB12.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">彩妆<span class="text-color-red">￥138.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB13.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">阿迪背包<span class="text-color-red">￥138.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB14.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">腕表<span class="text-color-red">￥138.00</span></a>
   						</div>
   						
   					
   					</div>
				</div>
			</div>
	  	</div>
	  
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-11.5" >
				<div class="panel panel-default" style="height:340px;">
   					<div class="panel panel-default" style="height:40px;">
      					<ul class="nav nav-pills">
   							<li><a href="#" style="color:#ADADAD">猜你喜欢</a></li>
						</ul>
   					</div>
   					<div class="panel-body">
   						
   						<div class="div-a"></div>
   						
						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB1.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">韩后<span class="text-color-red">￥1380.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB2.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">韩后<span class="text-color-red">￥599.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB3.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">玉兰油<span class="text-color-red">￥299.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB4.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">玉兰油<span class="text-color-red">￥189.00</span></a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:180px;height:200px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB5.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#">兰芝<span class="text-color-red">￥229.00</span></a>
   						</div>
   						
   					</div>
				</div>
			</div>
	  	</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-11.5" >
				<div class="panel panel-default" style="height:250px;">
   					<div class="panel panel-default" style="height:40px;">
      					<ul class="nav nav-pills">
   							<li><a href="#" style="color:#9D9D9D">我的足迹</a></li>
						</ul>
   					</div>
   					<div class="panel-body">
   						
						<div class="col-xs-3" style="width:100px;height:120px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB6.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#" class="text-color-red">￥567.00</a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:100px;height:120px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB7.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#" class="text-color-red">￥238.00</a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:100px;height:120px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB8.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#" class="text-color-red">￥229.00</a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:100px;height:120px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB9.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#" class="text-color-red">￥399.00</a>
   						</div>
   						
   						<div class="div-a"></div>
   						
   						<div class="col-xs-3" style="width:100px;height:120px;border:1px;text-align:center;">
   								<a href="#" class="thumbnail">
         							<img src="<%=basePath%>/assets/dist/img/TB10.jpg" alt="通用的占位符缩略图">
      							</a>
      							<a href="#" class="text-color-red">￥569.00</a>
   						</div>
   					
   					</div>
				</div>
			</div>
	  	</div>
	</div>
		<!-- 底部导航 -->
	<!-- 底部导航 -->
			<%@ include file="/assets/pages/bottom.jsp"%>
		</div>	
        <script type="text/javascript">
          $(function(){  
            $('#thumbnails ul li img').photomatic({  
              photoElement: '#photo',  
              previousControl: '#previousButton',  
              nextControl: '#nextButton',  
              firstControl: '#firstButton',  
              lastControl: '#lastButton'  
            });  
          });
          
    </script>  
</body>
</html>