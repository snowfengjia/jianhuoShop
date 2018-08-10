<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
    <div class="" align="center" style="width:480px;margin:0 auto;" >
    <h1>对不起！请充值后再操作！您的余额为：${sessionScope.user.ed }
    </h1>
    
    <h2 style="font-size:20px;"><a href="updateMoney.jsp" target="_parent">充值</a></h2>
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
