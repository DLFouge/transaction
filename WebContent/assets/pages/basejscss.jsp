<%@page contentType="text/html; charset=utf-8"%>
<%--  <%@ taglib prefix="s" uri="/struts-tags" %> --%> 
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/dist/css/appinfo.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=basePath%>/assets/jquery/jquery.min.js"></script>
<script type="text/javascript"  src="<%=basePath%>/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/plugins/swiper/swiper.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/assets/plugins/swiper/swiper.min.css">
<script type="text/javascript" src="<%=basePath%>/assets/jquery/jquery-1.5.1.js"></script>

<script type="text/javascript" src="<%=basePath%>/front/js/user/changepass.js"></script>
<script type="text/javascript" src="<%=basePath%>/front/js/user/regist.js"></script>
<script type="text/javascript" src="<%=basePath%>front/js/user/login.js"></script>
<script src="<%=basePath%>/jquery/round.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/jquery/jquery.jqia.photomatic.js"></script>