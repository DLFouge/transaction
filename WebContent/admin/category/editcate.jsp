<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/admin/css/style.css" media="all" />
</head>
<body>
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#pid").val()) {
				alert("一级分类不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>
<section class="content">
	<section class="widget" style="min-height:300px">
		<header>
			<span class="icon">&#59160;</span>
			<hgroup>
				<h1>修改分类</h1>
				<h2>修改二级分类</h2>
			</hgroup>
			<aside>
				
				<button  onclick="history.go(-1)" class="green" >返回列表</button>
				
			</aside>
		</header>
	<form action="<c:url value='editSubCategory'/>" method="post" onsubmit="return checkForm()">
	<p style="font-weight: 900; color: red">${msg }</p>
		<input type="hidden" name="cid" value="${param.cid}" /> 
		&nbsp;&nbsp;&nbsp;&nbsp;分类名称：<br /> <br /> <input type="text" name="cname" id="cname" value="${param.cname}"/>
		&nbsp;&nbsp;&nbsp;&nbsp;一级分类：<select name="pid" id="pid">
    		<option value="">===选择1级分类===</option>
    		<c:forEach items="${list}" var="item">
    		<option value="${item.categoryId }" <c:if test="${item.categoryId eq pid }">selected='selected'</c:if>>${item.categoryName}</option>
    		</c:forEach>
    	</select>><br /><br />  
		&nbsp;&nbsp;&nbsp;&nbsp;分类描述：<br /> <br /> 
		<textarea rows="5" cols="50" name="desc" id="desc">${param.desc}</textarea>
		<br />
		<div >
		<button type="submit" class="green">提交分类</button>   
		</div>
	</form>
	
	
	</section>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="<%=basePath%>/admin/js/jquery.wysiwyg.js"></script>
	<script src="<%=basePath%>/admin/js/custom.js"></script>
	<script src="<%=basePath%>/admin/js/cycle.js"></script>
	<script src="<%=basePath%>/admin/js/jquery.checkbox.min.js"></script>
	<script src="<%=basePath%>/admin/js/jquery.tablesorter.min.js"></script>
</section>
</body>
</html>