<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top" style="color:#000;">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />尖货商城</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="http://localhost:8080/jianhuoshop/showIndex.do" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
 &nbsp;&nbsp;<a class="button button-little bg-red" href="loginout.do"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title" style="color:#000;" ><strong><span class="icon-list" ></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>信息管理</h2>
  <ul style="display:block">
  <c:if test="${sessionScope.auser.utype=='管理员' }">
    <li><a href="userList.do" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    </c:if><c:if test="${sessionScope.auser.utype!='管理员' }">
     <li><a href="showUserInfo.do" target="right"><span class="icon-caret-right"></span>个人信息管理</a></li>
    </c:if>
    
  </ul>  
   <c:if test="${sessionScope.auser.utype=='管理员' }">
  <h2><span class="icon-pencil-square-o"></span>基础信息</h2>
  <ul>
    <li><a href="newsList.do" target="right"><span class="icon-caret-right"></span>新闻管理</a></li>        
    <li><a href="bbsList.do" target="right"><span class="icon-caret-right"></span>留言管理</a></li>        
  </ul> 
  </c:if>
   <h2><span class="icon-pencil-square-o"></span>商品管理</h2>
  <ul>
  <li><a href="fFtypeList.do" target="right"><span class="icon-caret-right"></span>商品类型管理</a></li> 
  <li><a href="GoodsList.do" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
  <li><a href="tj1.jsp" target="right"><span class="icon-caret-right"></span>订单统计分析</a></li>
  <!-- <li><a href="GoodsList2.do" target="right"><span class="icon-caret-right"></span>共享平台商品管理</a></li> -->
  <li><a href="ForderList.do" target="right"><span class="icon-caret-right"></span>订单管理</a></li>
  </ul> 
 
  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a  class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
 
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<!-- <p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p> -->
</div>
</body>
</html>