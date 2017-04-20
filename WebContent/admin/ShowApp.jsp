<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath%>/Pages/backPages/css/style.css" media="all" />
</head>
<body>
<section class="content">
	<section class="widget">
		<header>
			<span class="icon">&#128196;</span>
			<hgroup>
				<h1>应用信息</h1>
				<h2>查看修改我的应用</h2>
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
						<th>应用图标</th>
						<th>应用名称</th>
						<th >应用描述</th>					
						<th>版本号</th>
						<th>更新时间</th>
						<th>更新信息</th>
						<th>删除信息</th>
					</tr>
				</thead>
			<s:iterator value="list1" status="st">	
					<tbody>						
						<tr>
							<td><input type="checkbox" /><img src="<%=basePath%>/upload/<s:property value="icon"/>" border=""/></td>
							<td><s:property value="appname"/></td>
							<td><s:property value="description"/></td>
							<td><s:property value="vid"/></td>
							<td><s:property value="updatetime"/></td>
							<td><button><a href="#">更新</a></button></td>
							<td><button><a href="delete.do?id=<s:property value="id"/>">删除</a></button></td>
						</tr>
					</tbody>
			</s:iterator>
				</table>
		</div>
		
	</section>
</section>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.wysiwyg.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/custom.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/cycle.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.checkbox.min.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot.resize.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot-graphs.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/flot-time.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/cycle.js"></script>
<script src="<%=basePath%>/Pages/backPages/js/jquery.tablesorter.min.js"></script>
</body>
</html>