<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
    <div class="" align="center">
    
    <h1>对不起！你因余额不足，操作失败！</h1>
    
    <div class="reindex"><a href="updateMoney.jsp" target="_parent">返回充值页面！</a></div>
    <div class="reindex"><a href="index" target="_parent">返回</a></div>
    
    </div>
</body>
</html>
