<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
    <div class="" align="center">
    
    <h1>对不起！操作失败,您输入的用户名不正确，<br><a href="fore_losspwd0.jsp" target="_parent">请重新输入</a></h1>
    
   
    
    </div>
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
