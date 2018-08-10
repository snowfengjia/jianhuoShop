<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详情页</title>
<style type="text/css">
.txtInit {
	border: 1px #cecece solid;
}
.txtFocus {
	border: 1px solid #009;
}
.spanInit {
	width: 300px;
	height: 22px;
	display: block;
	float: right;
	background-repeat: no-repeat;
	background-position: left;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
</style>

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- <script type="text/javascript" src="js/regist.js"></script> -->
</head>

<jsp:include page="top.jsp"></jsp:include>
<div id="reg1">
  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;详情页面</div>
 <div id="reg-mleft1">
  
    <ul>
     
      <li class="m"><h3>标题：</h3></li>
      <li class="r1"> <h3>${news.name}</h3></li>
      <li class="m"><h3>内容：</h3></li>
      <li class="r1" >
        ${news.note }
       </li>
    </ul>
    </div>
    <div align="center"></div>
     
  </div>
  </body>
</html>
<!--底部-->
<%-- <jsp:include page="foot.jsp"></jsp:include> --%>

