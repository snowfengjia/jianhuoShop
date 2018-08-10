<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="admin/js/index.js"></script>
<style type="text/css">
.select{
width: 160px;
height: 30px;
}
.search{
width: 100px;
height: 35px;
margin-left: 65px;
font-size: 20px;
}
</style>
</head>

<body>
<!--头部-->
<div id="top-cont">
  <div id="top-min">
    <div id="min-left"><font color="green" size="30px"><b>尖货商城</b></font></div>
    <div id="min-right"></div>
  </div>
</div>
<!--导航-->
<div id="menu">
  <div id="menu-m">
    <ul>
      <li><a href="showIndex.do">首页</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="fnewsList.do">新闻公告</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="showGoods.do">商品信息</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="admin/alogin.do" target="_blank">管理员登录</a></li>
      <!--  <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li ><a href="updateMoney.jsp">充值</a></li> -->
       <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="showShop.do"><img src="images/che.jpg" width="176" height="42" /></a></li>
    </ul>
  </div>
</div>

