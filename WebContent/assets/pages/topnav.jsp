<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="basejscss.jsp"%>
<div class="fullscreen">
<div class="background-color-1 " style="height:45px;">
   <div class="row">
   		<div class="col-xs-8 pull-left">
			<ul class="nav nav-pills li-type-1 " >
				<li><a href="<%=basePath%>/assets/pages/index.jsp" target="_top">首页</a></li>
				<li><a href="#">电器</a></li>
				<li><a href="#">服饰</a></li>
				<li><a href="#">书籍</a></li>
				<li><a href="#">运动</a></li>
				<li><a href="#">数码</a></li>
			</ul>
		</div>
			    <s:if test="#session.user == null">
    	<div class="col-xs-2 pull-right">	
     		 <div class="col-xs-6 margin-top-1"><p><a href="<%=basePath%>/assets/pages/login.jsp" target="_top" style="color: #fff">请登录</a><p></div> 
     		 <div class="col-xs-6 margin-top-1 "><p><a href="register.jsp" target="_top" style="color: #fff">免费注册</a><p></div>       
   		</div>
   	</s:if>
		
   </div>
</div>
<div class="background-color-2" style="height:35px;">
   <div>
    <div class="row" >

   	<s:else>
   		<div class="col-xs-12 text-center nav-sub">
   		<ul>
   			 <li><p><a><s:property value="#session.user.userName"/>欢迎来到二手网</a><p></li>
   			 <li><p><a href="exit" target="_top">退出</a></li>
   			<li><p><a href="/transaction/assets/pages/index.jsp" target="_top">首页</a><p></li> 
   			<li><p><a href="viewUserInfo" target="_top">个人中心</a><p></li> 
     		 <li><p><span class="glyphicon glyphicon-heart text-color-red"></span><a href="selectAllOrder" target="_top">查看订单</a><p></li> 
     		 <li><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="myCart" target="_top">我的购物车</a><p></li> 
     		 <s:if test="#session.user.applyStatus == 0">
     		 <li><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="/transaction/assets/pages/improveUserInfo.jsp" target="_top">申请开店</a><p></li> 
   			 </s:if>
   			 <s:elseif test="#session.user.applyStatus == 1">
   			 	<li><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span>账户申请中<p></li> 
   			 </s:elseif>
   			 <s:elseif test="#session.user.applyStatus == 3">
   			 	<li><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span><a href="myCart" target="_top">重新申请</a><p></li> 
   			 </s:elseif>
   			 <s:elseif test="#session.user.applyStatus == 2">
   			 	<li><p><span class="glyphicon glyphicon-shopping-cart text-color-red"></span>我是店主<p></li> 
   			 </s:elseif>
   		</ul>
   		</div>
   	</s:else>
   	</div>
   </div>
</div>
<div>
    <div class="row"  style="margin-top:5px;">
   		 <div class="col-xs-2  " style="margin-left:90px;" >
			<img src=" <%=basePath%>/assets/dist/img/logo3.png" class="img-responsive img-rounded">
		</div>
		
   		<div class="col-xs-5 col-xs-offset-1" style="margin-top:15px;">
     		<form action="selectByLike" target="_top">
     		<div class="input-group ">
              
               <input type="text" class="form-control" name="goodsName">
               <span class="input-group-btn">
                  <button type="submit" class="btn btn-default" type="button">
                    	 搜索
                  </button>
                 </span>
             
            </div><!-- /input-group -->
          </form>  
            <div class="search-link margin-top-2" >
            	<a href="#" style="color: red">9.9三件	</a>/<a>	考研笔记	</a>/<a>	雷蛇游戏手柄	</a>/<a>	苹果耳机	</a>/<a>	裤子	</a>/<a>	衣服	</a>
            </div>  
   		</div>
   		<div  class="col-xs-2 col-xs-offset-1">
   		<a type="button" class="btn btn-default margin-top-2 btn-lg" href="myCart" target="_top">
    		<span class="glyphicon glyphicon-shopping-cart text-color-red"></span>我的购物车
   		</a>
   		</div>
   	</div>
</div>
</div>