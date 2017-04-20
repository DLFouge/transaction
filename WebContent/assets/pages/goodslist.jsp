<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<link rel="stylesheet" type="text/css" href="../dist/css/appinfo.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/js/bootstrap.min.js">
<script type="text/javascript" src="../plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="../jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../plugins/swiper/swiper.min.css">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/scripts/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="topnav.jsp"%>
	<div class="fullscreen">
	<!-- 头部导航 -->		

		<div class="line-2 col-xs-12"></div>

		<div class="box-type-1 text-color-write test float-catalog col-xs-2"
			style="margin-left: -200px;float:left;position: absolute;">
			<s:iterator value="category">
			<div class="col-xs-12 margin-bottom-1 margin-top-1 ">
				<a class="text-st-1"><s:property value="categoryName"/></a>
				<s:iterator value="childs">
				<a class="text-st-1" href="selectByCid?categoryId=<s:property value="categoryId"/>" target="_top"><s:property value="categoryName"/></a>
				</s:iterator>
			</div>
			<br>
			</s:iterator>
		</div>
		<iframe id="frame"  src="<%=basePath%>/assets/pages/good-list-topshow.jsp" scrolling="no" name="middle" frameborder="0" width="1340px" height="225px">
		</iframe>
		
		<div  style="height: 25px; margin-top: 25px;">
			<div class="col-xs-12  ">
				<a class="title-type-2 text-color-grad">书籍</a> <span
					class="glyphicon glyphicon-chevron-right"></span> <a
					class=" text-color-grad">阅读</a> <span
					class="glyphicon glyphicon-chevron-right"></span> <a
					class=" text-color-grad">励志</a>
			</div>
		</div>
		<div class=" background-color-2 boder-type-2"
			style="height: 35px; margin-top: 15px;">
			<div class="col-xs-12  " >
				<a class="title-type-2 text-color-red " style=" margin-left: 15px;">励志读本</a> &nbsp;<span
					class="text-color-grad"> 共400件商品</span>
			</div>
		</div>

		<div style="margin-top: 15px;">
			<div class="row  col-xs-12">
				<div style="height: 35px;" class="boder-bottem-1 margin-top-1">
					<div class="col-xs-2">
						<span>新旧情况：</span>
					</div>
					<div class="col-xs-1">
						<a href="TheDegree?thedegree=9成新">9成新</a>
					</div>
					<div class="col-xs-1">
						<a href="TheDegree?thedegree=8成新">8成新</a>
					</div>
					<div class="col-xs-1">
						<a href="TheDegree?thedegree=7成新">7成新</a>
					</div>
					<div class="col-xs-1">
						<a href="TheDegree?thedegree=6成新">6成新</a>
					</div>
					<div class="col-xs-1">
						<a href="TheDegree?thedegree=5成新">5成新</a>
					</div>
					<div class="col-xs-5">
					</div>
				</div>
				<div style="height: 35px;" class="boder-bottem-1 margin-top-1">
					<div class="col-xs-1">
						<span>价格：</span>
					</div>
					<div class="col-xs-1">
						<a href="selectByPrice?price1=1&price2=30">1~30</a>
					</div>
					<div class="col-xs-1">
						<a href="selectByPrice?price1=30&price2=60">30~60</a>
					</div>
					<div class="col-xs-1">
						<a href="selectByPrice?price1=60&price2=100">60~100</a>
					</div>
					<div class="col-xs-1">
						<a href="selectByPrice?price1=100&price2=300">100~300</a>
					</div>
					<div class="col-xs-1">
						<a href="selectByPrice?price1=300&price2=800">300~800</a>
					</div>
					<div class="col-xs-6">
					</div>
				</div>
				<div style="height: 35px;" class="boder-bottem-1 margin-top-1">
					<div class="col-xs-2">
						<span>包装完整度：</span>
					</div>
					<div class="col-xs-2">
						<a>9成</a>
					</div>
					<div class="col-xs-2">
						<a>8成</a>
					</div>
					<div class="col-xs-2">
						<a>7成</a>
					</div>
					<div class="col-xs-2">
						<a>6成</a>
					</div>
					<div class="col-xs-2">
						<a>5成</a>
					</div>
				</div>

			</div>
		</div>

		<div   style="margin-top: 245px;">
			<div class="row">

				<div style="background: #f3f3f3; height: 37px;">
					<div class="col-xs-6 margin-bottom-1" >
						<div class="btn-group" style="margin-left: 5px;">
							<button type="button" class="btn btn-default">
								价格<span class="glyphicon glyphicon-sort"></span>
							</button>
							<button type="button" class="btn btn-default">
								综合<span class="glyphicon glyphicon-sort"></span>
							</button>
							<button type="button" class="btn btn-default">
								人气 <span class="glyphicon glyphicon-sort"></span>
							</button>
							<div class="input-group pull-left" style="width: 245px;">
								<span class="input-group-addon">￥</span> <input type="text"
									class="form-control" value="下限价格"> <span
									class="input-group-addon">￥</span> <input type="text"
									class="form-control" value="上限价格">
							</div>
						</div>
					</div>
					<div class="col-xs-6"></div>
				</div>
				<div class="col-xs-12" id="box-goods-list">
					<ul>
					<s:iterator value="pagingDate.list">
						 <s:url var="idURL" action="goodsDetail" >
							<s:param name="goodsId">
								<s:property value="goodsId" escape="false"/>
							</s:param>
					</s:url>
						<li><a href="<s:url value='%{idURL}'/>"><img src="/transaction/shopping_img/<s:property value="pictureTop"/>" class="img-responsive"></a>
							名称： <a href="<s:url value='%{idURL}'/>"><s:property value="goodsName"/></a>
							<br>
							价格：<span class="text-color-red">￥<s:property value="goodsPrice"/></span>
							<p>描述：<s:property value="goodsDescribe"/></p>
							<p>新旧程度：<s:property value="degree"/></p>
							</li>
					</s:iterator>
					</ul>
				</div>
			</div>
			<div class="pull-right">
				<ul class="pagination" style="margin-left:300px">
	<!-- 上一页 -->
		<s:if test="pageCode == 1">
	  		<li><a href="#">&laquo;</a></li>
		 </s:if>
	 	<s:else>
	 		<li><a href="<s:property value="pagingDate.url"/>&pageCode=<s:property value="pageCode-1"/>">&laquo;</a></li>
	 	</s:else>
	 	
	 <!-- 中间页码判断 -->
	 <!-- 总页面少于三页 -->
	 <s:if test="pagingDate.totalPage <3">
	 	<s:set var="begin" value="1"></s:set>
	 	<s:set var="end" value="pagingDate.totalPage"></s:set>
	 </s:if>
	 <!-- 总页面大于三页的情况 -->
	 <s:else>
	 	<s:set var="begin" value="pageCode - 1"></s:set>
	 	<s:set var="end" value="pageCode + 1"></s:set>
	 	<s:if test="#begin < 1">
	 		<s:set var="begin" value="1"></s:set>
	 		<s:set var="end" value="3"></s:set>
	 	</s:if>
	 	<s:if test="#end >pagingDate.totalPage">
	 		<s:set var="begin" value="pageCode -2"></s:set>
	 		<s:set var="end" value="pagingDate.totalPage"></s:set>
	 	</s:if>
	 </s:else>
	 
	 <%-- 显示页码列表 --%>
		<s:iterator begin="#begin" end="#end" id="index">
			<s:if test="index==pageCode">
				<li class="disabled"><s:property value="#index"/></li>
			</s:if>
			<s:else>
				<li>
				<a href="<s:property value='pagingDate.url'/>&pageCode=<s:property value='#index'/>"><s:property value="#index"/></a></li>
			</s:else>
		</s:iterator>
		<%-- 显示点点点 --%>
		<s:if test="pageCode+1 < pagingDate.totalPage">
			<li><span class="spanApostrophe">...</span></li>
		</s:if>
	 	
	  
	  <!-- 下一页 -->
	  <s:if test="pageCode == pagingDate.totalPage">
	  		<li><a href="#">&raquo;</a></li>
	  </s:if>
	 <s:else>
	 		<li><a href="<s:property value="pagingDate.url"/>&pageCode=<s:property value="pageCode+1"/>">&raquo;</a></li>
	 </s:else>
	</ul>
			</div>
	</div>
		
			<div class="col-xs-12">

				<div class="margin-bottom-1 col-xs-12">
					<a><img src="<%=basePath%>/assets/dist/img/nav.jpg" class="img-responsive"></a>
				</div>

			</div>
			<div class="col-xs-12 margin-top-1">
				<div class="boder-bottem-1 margin-bottom-1" style="height: 44px;">
					<span class="title-type-2 font-weight-1 text-color-grad"><span
						class="glyphicon glyphicon-exclamation-sign text-color-red"></span>今日推荐
					</span> <a class="pull-right"><span
						class="glyphicon glyphicon-chevron-right"></span>更多</a>

				</div>
				<div class="boder-type-2">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb1.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb2.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb3.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb4.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb5.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb6.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb7.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb8.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb9.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>
							<div class="swiper-slide ">
								<div class="col-xs-12">
									<img src="<%=basePath%>/assets/dist/img/jdb10.jpg" class="img-responsive">
									<p>
										价格：<a class="text-color-red">￥345.5</a>
									</p>
								</div>
							</div>

							<!-- Add Pagination -->
						</div>
						<!-- Add Pagination -->
					</div>
					<div class="swiper-pagination"></div>
				</div>


			</div>
		</div>
		
		<!-- 底部导航 -->
			<div >
				<img id="icon" src="<%=basePath%>/assets/dist/img/bottom.jpg" class="img-responsive img-rounded">
			</div>
</div>
	
	<script type="text/javascript">	
	/* 滑动图 */
 var swiper = new Swiper('.swiper-container', {
		slidesPerView:5,
        paginationClickable: true,
        spaceBetween: 30
    });
	
 $(document).ready(function(){
	  $(".test").hover(function(){
	    $(".test").animate({left:'180px'});
	  });  
	  $(".row").hover(function(){
		    $(".test").animate({left:'0px'});
		  });
	});
</script>
</body>
</html>