<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>
    
    <div class="error" align="center" style="width:480px;margin:0 auto;">
    
    <h2>对不起！请重新登录后操作！</h2>
  
    <div class="reindex"><a href="fore_login.jsp" target="_parent">返回登录页面</a></div>
    <div class="reindex"><a href="regist.jsp" target="_parent">返回注册页面</a></div>
    </div>
    <!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
