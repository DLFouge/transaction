<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/admin/css/style.css" media="all" />
</head>
<body>

<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#128196;</span>
			<hgroup>
				<h1>分类信息</h1>
				<h2>查看修改我的分类</h2>
			</hgroup>
			<aside>
				<span>
					<a href="#">&#9881;</a>
					<ul class="settings-dd">
						<li><label>Option a</label><input type="checkbox" /></li>
						<li><label>Option b</label><input type="checkbox" checked="checked" /></li>
						<li><label>Option c</label><input type="checkbox" /></li>
					</ul>
				</span>
			</aside>
		</header>
		
   				
		<div class="content">
			<table id="myTable" border="0" width="100">
				<thead>
					<tr>
						<th>分类名称</th>
						<th>分类描述</th>
						<th >操作</th>					
						
					</tr>
				</thead>
			<c:forEach items="${list}" var="item">
					<tbody>						
						<tr>
							<td>${item.categoryName}</td>
							<td>${item.describe }</td>
							<td><a
					href="<c:url value='findAllFirstCategory'/>">添加二级分类</a> <a
					href="<c:url value='/admin/category/edit.jsp?cname=${item.categoryName}&desc=${item.describe}&cid=${item.categoryId}'/>">修改</a>
					<a onclick="return confirm('您是否真要删除该一级分类？')"
					href="<c:url value='deleteFirstCategory?cid=${item.categoryId}'/>">删除</a></td>
						</tr>
					</tbody>
			<c:forEach items="${item.childs }" var="childItem">
			<tbody>
				<tr class="trTwoLevel">
					<td>${childItem.categoryName}</td>
					<td>${childItem.describe}</td>
					<td width="200px;" align="right"><a
						href="<c:url value='findAFCReturnToEdit?pid=${item.categoryId }&cname=${childItem.categoryName }&desc=${childItem.describe}&cid=${childItem.categoryId}'/>">修改</a>
						<a onclick="return confirm('您是否真要删除该二级分类？')"
						href="<c:url value='deleteSecondCategory?cid=${childItem.categoryId}'/>">删除</a></td>
				</tr>
				</tbody>
				</c:forEach>
			</c:forEach>
				</table>
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