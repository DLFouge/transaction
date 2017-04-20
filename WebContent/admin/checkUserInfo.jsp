<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
            <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/admin/css/style.css" media="all" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/bootstrap/css/bootstrap.min.css">
</head>
<body>

<section class="content">
	<section class="widget">
		<header>
			
		</header>
		
   			
		<div class="content">
			<table id="myTable" border="0"  width="100">
				<thead>
					<tr>
						<th>用户照片</th>
						<th>昵称</th>
						<th >真实姓名</th>
						<th >身份证号码</th>
						<th >学号</th>
						<th >操作</th>				
					</tr>
				</thead>
				
				<tbody>	
				<s:iterator value="userPage.list">					
					<tr class="trTwoLevel">
						<td><img id="hz" src="/transaction/user_img/<s:property value="userInfo.photoAddress"/>" width="100" height="100" class="img-responsive img-rounded" style="margin-top:10px;margin-bottom:10px;margin-left:15px;"></td>
						<td><s:property value="userInfo.nickName"/></td>
						<td><s:property value="userInfo.realName"/></td>
						<td><s:property value="userInfo.idetityCart"/></td>
						<td><s:property value="userInfo.studentCart"/></td>
						<s:if test="btn== 'check'">
						<td><a href="updateUserStatus?status=2&userId=<s:property value='userInfo.userId'/>"><button>审核通过</button></a>
						<a href="selectUserInfo?userId=<s:property value='userInfo.userId'/>"><button>查看详情</button></a></td>
						</s:if>
						<s:elseif test="btn =='pass'">
							<td><a href="selectUserInfo?userId=<s:property value='userInfo.userId'/>"><button>查看详情</button></a>
							<a href="updateUserStatus?status=3&userId=<s:property value='userInfo.userId'/>"><button>加入黑名单</button></a>
						</s:elseif>
						<s:else>
							<td><a href="selectUserInfo?userId=<s:property value='userInfo.userId'/>"><button>查看详情</button></a>
							<a href="updateUserStatus?status=2&userId=<s:property value='userInfo.userId'/>"><button>审核通过</button></a></td>
						</s:else>
					</tr>
				</s:iterator>	
				
				</tbody>
				</table>
							<div class="pagination" style="margin-left:680px">
	<!-- 上一页 -->
		<s:if test="pageCode == 1">
	  		<li><a href="#">&laquo;</a></li>
		 </s:if>
	 	<s:else>
	 		<li><a href="<s:property value="userPage.url"/>&pageCode=<s:property value="pageCode-1"/>">&laquo;</a></li>
	 	</s:else>
	 	
	 <!-- 中间页码判断 -->
	 <!-- 总页面少于三页 -->
	 <s:if test="userPage.totalPage <3">
	 	<s:set var="begin" value="1"></s:set>
	 	<s:set var="end" value="userPage.totalPage"></s:set>
	 </s:if>
	 <!-- 总页面大于三页的情况 -->
	 <s:else>
	 	<s:set var="begin" value="pageCode - 1"></s:set>
	 	<s:set var="end" value="pageCode + 1"></s:set>
	 	<s:if test="#begin < 1">
	 		<s:set var="begin" value="1"></s:set>
	 		<s:set var="end" value="3"></s:set>
	 	</s:if>
	 	<s:if test="#end >userPage.totalPage">
	 		<s:set var="begin" value="pageCode -2"></s:set>
	 		<s:set var="end" value="userPage.totalPage"></s:set>
	 	</s:if>
	 </s:else>
	 
	 <%-- 显示页码列表 --%>
		<s:iterator begin="#begin" end="#end" id="index">
			<s:if test="index==pageCode">
				<li class="disabled"><s:property value="#index"/></li>
			</s:if>
			<s:else>
				<li>
				<a href="<s:property value='userPage.url' escape="false"/>&pageCode=<s:property value='#index'/>"><s:property value="#index"/></a></li>
				
			</s:else>
		</s:iterator>
		<%-- 显示点点点 --%>
		<s:if test="pageCode+1 < userPage.totalPage">
			<li><span class="spanApostrophe">...</span></li>
		</s:if>
	 	
	  
	  <!-- 下一页 -->
	  <s:if test="pageCode == userPage.totalPage">
	  		<li><a href="#">&raquo;</a></li>
	  </s:if>
	 <s:else>
	 		<li><a href="<s:property value="userPage.url"/>&pageCode=<s:property value="pageCode+1"/>">&raquo;</a></li>
	 </s:else>
	</div>
				
		</div>
	
	</section>
</section>

<script src="<%=basePath%>/assets/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/admin/js/jquery.wysiwyg.js"></script>
<script src="<%=basePath%>/admin/js/custom.js"></script>
<script src="<%=basePath%>/admin/js/cycle.js"></script>
<script src="<%=basePath%>/admin/js/jquery.checkbox.min.js"></script>
<script src="<%=basePath%>/admin/js/flot.js"></script>
<script src="<%=basePath%>/admin/js/flot.resize.js"></script>
<script src="<%=basePath%>/admin/js/flot-graphs.js"></script>
<script src="<%=basePath%>/admin/js/flot-time.js"></script>
<script src="<%=basePath%>/admin/js/cycle.js"></script>
<script src="<%=basePath%>/admin/js/jquery.tablesorter.min.js"></script>
</body>
</html>