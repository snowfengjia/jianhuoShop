<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<div align="center" style="    width: 300px;margin: 0 auto;">
    <h1 >恭喜您充值成功！您的余额为：￥${user.ed }元 </h1>
    <h4>请重新登录后再查询余额！</h4>
    <!--  <div class="reindex"><a href="http://localhost/jianhuoshopnew/admin/login.jsp" target="_parent">返回首页</a></div> -->
  </div>
  <!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
