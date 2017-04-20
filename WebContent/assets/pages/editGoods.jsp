<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 头部导航 -->
	<%@ include file="topnav.jsp"%>
	
	<div class="container ">
		<div class="row">
		 <div class="col-xs-12">
			<div class="panel panel-default">
   				<div class="panel-heading">
    				  <a href="#" style="color:#9D9D9D">首页</a>><a href="#" style="color:#9D9D9D">个人中心</a>><a href="#" style="color:#9D9D9D">编辑商品</a>
   				</div>
			</div>
		</div>
	   </div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" >
				<div class="panel panel-default" style="height:490px;margin-top:10px;margin-right:10px;">
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
   						<form action="editGoodsInform" method="post">
   						<div class="col-xs-6" style="height:40px;border:1px;text-align:center; margin-top:25px;">
							<div class="col-xs-12">
								<div class="col-xs-3">商品名称：</div>
								<div class="col-xs-9"><input class="form-control" type="text" name="goodsName" value="<s:property value="goods.goodsName"/>">								
								</div>
							</div>
							<br><br>
							<div class="col-xs-12">
								<div class="col-xs-3">二手价：</div>
								<div class="col-xs-9">
								<input class="form-control" type="text" name="goodsName" value="<s:property value="goods.goodsPrice"/>">&nbsp;&nbsp;
								</div>
							</div>
							<br><br>
							<div class="col-xs-12">
								<div class="col-xs-3">商品描述：</div>
								<div class="col-xs-9">
								<textarea class="form-control" rows="7" cols="35" name="goodsDescribe" ><s:property value="goods.goodsDescribe"/></textarea>
								</div>
							</div>
							<br><br>
							<div class="col-xs-12 margin-top-1" >
								<div class="col-xs-3">上架时间：</div>
								<div class="col-xs-9">
								<input class="form-control" type="text" name="onSaleTime" value="<s:property value="goods.onSaleTime"/>">
								</div>
							</div>
							
							<div class="col-xs-12 margin-top-1">
								<div class="col-xs-3">新旧程度：</div>
								<div class="col-xs-9">
								<input class="form-control" type="text" name="degree" value="<s:property value="goods.degree"/>">
								</div>
							<br>
							</div>
							<br>
							<div class="col-xs-12">
							<div class="col-xs-9">
							<input type="hidden" name="goodsId" value="<s:property value="goods.goodsId"/>">
							</div>
							</div>
							<br>
							
							<div class="col-xs-12 margin-top-1" >
							
								<div class="col-xs-6 " style="margin-left:-40px;">
									<button type="submit" class="btn btn-default" style="font-size:18px;  border: 2px red solid;">
      									<a style="color: red;">提交修改</a>
   									</button>									
   								</div>
   								
							</div>
							
						</div>
   						</form>
   						
   					</div>
				</div>
			</div>
	  	</div>
	</div>
	
	
	
		<!-- 底部导航 -->
	<div >
	<img id="icon" src="<%=basePath%>/assets/dist/img/bottom.jpg" class="img-responsive img-rounded">
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