<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="basejscss.jsp"%>
<div style="width:1360px;">
<div class="background-color-1  " style="height:45px;">
   <div class="row">
   		<div class="col-xs-8 pull-left">
			<ul class="nav nav-pills li-type-1 " style="margin-left:45px; ">
				<li><a href="#">首页</a></li>
				<li><a href="#">电器</a></li>
				<li><a href="#">服饰</a></li>
				<li><a href="#">书籍</a></li>
				<li><a href="#">运动</a></li>
				<li><a href="#">数码</a></li>
			</ul>
		</div>
			    <s:if test="#session.user == null">
    	<div class="col-xs-2 pull-right">	
     		 <div class="col-xs-6 margin-top-1"><p><a href="/transaction/assets/pages/login.jsp" target="_top" style="color: #fff">请登录</a><p></div> 
     		 <div class="col-xs-6 margin-top-1 "><p><a href="/transaction/assets/pages/register.jsp" target="_top" style="color: #fff">免费注册</a><p></div>       
   		</div>
   	</s:if>
		
   </div>
</div>
<div class="background-color-2" style="height:35px;">
   <div>
    <div class="row" >

   	<s:else>
   		<div class="col-xs-8 text-center">
   			 <div class="col-xs-3"><p><a><s:property value="#session.user.userName"/>欢迎来到二手网</a><p></div>
   			 <div class="col-xs-1"><p><a href="exit" target="_top">退出</a></div>
   			 <div class="col-xs-1"><p><a href="/transaction/assets/pages/index.jsp" target="_top">首页</a><p></div> 
   			 <div class="col-xs-2"><p><a href="viewUserInfo" target="_top">个人中心</a><p></div> 
     		 <div class="col-xs-2"><p><span class="glyphicon glyphicon-heart text-color-red"></span><a href="selectAllOrder" target="_top">查看订单</a><p></div> 
     		 <div class="col-xs-2"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="myCart" target="_top">我的购物车</a><p></div> 
     		
     		 <s:if test="#session.user.applyStatus == 0">
     		 <div class="col-xs-2"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="/transaction/assets/pages/improveUserInfo.jsp" target="_top">申请开店</a><p></div> 
   			 </s:if>
   			 <s:elseif test="#session.user.applyStatus == 1">
   			 	<div class="col-xs-2"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span>账户申请中<p></div> 
   			 </s:elseif>
   			 <s:elseif test="#session.user.applyStatus == 3">
   			 	<div class="col-xs-2"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="myCart" target="_top">重新申请</a><p></div> 
   			 </s:elseif>
   			 <s:elseif test="#session.user.applyStatus == 2">
   			 	<div class="col-xs-2"><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span>我是店主<p></div> 
   			 </s:elseif>
   		</div>
   	</s:else>
   	</div>
   </div>
</div>
<div>
    <div class="row"  style="margin-top:5px;">
   		 <div class="col-xs-2  " style="margin-left:40px;" >
			<img src=" <%=basePath%>/assets/dist/img/logo3.png" class="img-responsive img-rounded">
		</div>
   		<div class="col-xs-5 col-xs-offset-1" style="margin-top:15px;">
     		<div class="input-group ">
     		<form action="selectByLike">
               <input type="text" class="form-control" name="goodsName">
               <span class="input-group-btn">
                  <button type="submit" class="btn btn-default" type="button">
                    	 搜索
                  </button>
                  </span>
              </form>
               
            </div><!-- /input-group -->
           
            <div class="search-link margin-top-2" >
            	<a href="#" style="color: red">9.9三件	</a>/<a>	考研笔记	</a>/<a>	雷蛇游戏手柄	</a>/<a>	苹果耳机	</a>/<a>	裤子	</a>/<a>	衣服	</a>
            </div>  
   		</div>
   		<div  class="col-xs-2 col-xs-offset-1">
   		<button type="button" class="btn btn-default margin-top-2 btn-lg" >
    		<span class="glyphicon glyphicon-shopping-cart text-color-red"></span>我的购物车<span class="badge  pull-right">0</span>
   		</button>
   		</div>
   	</div>
</div>
</div>