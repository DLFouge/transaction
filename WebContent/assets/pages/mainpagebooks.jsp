<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="basejscss.jsp"%>
<div class="fullscreen">
<div class="container">
    <div class="row">
    	<h4 class="font-weight-1">-<span class="glyphicon glyphicon-thumbs-up text-color-red"></span>书籍</h4>   	
    	<div class="col-xs-12   boder-type-3">
   		<div class=" pull-left boder-type-1" style="width:25%">
   			<div style="width:100%">
   			<img id="icon" src="<%=basePath%>/assets/dist/img/book-img.jpg" class="img-responsive "> 
   			</div>
   			<div style="width:100% ; height:156px;background-color: #70AFCE;">
   				<br>
   				<br>
   				<br>
   				<p class="text-center">
					<a href="selectByCid?categoryId=E77B357DCB294F709EF106C51EF6081C" class="font-weight-1 text-color-write " target="_top">进入书籍商城 <span class="ion-ios-book" style="font-size: 30px;"></span>  </a>				
   				</p>
   			</div>
   			
   		</div>
   		<div class=" box-books-pic  pull-right"style="width:75%">  
   			<ul>
   			<s:iterator value="pagingDate.list">
   					<s:url var="idURL" action="goodsDetail" >
						<s:param name="goodsId">
							<s:property value="goodsId" escape="false"/>
						</s:param>
					</s:url>
   					<li><a href="<s:url value='%{idURL}'/>" target="_top">
   						<img src="/transaction/shopping_img/<s:property value="pictureTop"/>" class="img-responsive">
   						</a>
   						<p class="text-center"><s:property value="goodsName"/></p>
   						<h5 class="text-center text-color-red">￥<s:property value="goodsPrice"/></h5>
   					</li>
   					
   			</s:iterator>					
   			</ul>  				
   		</div>
   		</div>
   	</div>
 </div>
 </div>