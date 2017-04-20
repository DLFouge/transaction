<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="basejscss.jsp"%>
<div>
<div class="pull-left box-type-1 text-color-write">
		<div class="col-xs-12 margin-bottom-1 margin-top-1 ">
			<s:iterator value="category" id="parent"> 
					<font class="text-st-1"><s:property value="#parent.categoryName"/></font>
						<s:iterator value="childs" id="child"> /
							<a class="text-st-1" href="selectByCid?categoryId=<s:property value="categoryId"/>" target="_top">
							<s:property value="#child.categoryName"/></a>
						</s:iterator>
						<br>
			</s:iterator>
		</div>
</div>
	<div id="myCarousel" class="carousel slide" >
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0"  class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"  ></li>
      <li data-target="#myCarousel" data-slide-to="2"  ></li>
   </ol>   
   <!-- 轮播（Carousel）项目 --> 			
			<div class="carousel-inner">				
				<div class="item active">
					<img src="<%=basePath%>/assets/dist/img/hander.jpg" alt="First slide">
					<div class="carousel-caption">标题 1</div>
				</div>
				<div class="item">
					<img src="<%=basePath%>/assets/dist/img/hander1.jpg"
						alt="Second slide">
					<div class="carousel-caption">标题 2</div>
				</div>
				<div class="item">
					<img src="<%=basePath%>/assets/dist/img/hander2.jpg" alt="Third slide">
					<div class="carousel-caption">标题 3</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>
	</div> 	
</div>

<div class="container" style="margin-top:25px;">
    <div class="row">
    	<div class="col-xs-3">
     		 <img id="icon" src="<%=basePath%>/assets/dist/img/ca1.jpg" class="img-responsive img-rounded">
   		</div>
   		<div class="col-xs-3"> 
   			<img id="icon" src="<%=basePath%>/assets/dist/img/ca2.jpg" class="img-responsive img-rounded">    		
   		</div>
   		<div class="col-xs-3">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/ca3.jpg" class="img-responsive img-rounded"> 	
   		</div>
   		<div class="col-xs-3">  
   			<img id="icon" src="<%=basePath%>/assets/dist/img/ca2.jpg" class="img-responsive img-rounded"> 	
   		</div>
   	</div>
 </div>