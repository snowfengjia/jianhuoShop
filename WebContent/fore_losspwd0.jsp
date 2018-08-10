<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>

<!--登录版块-->
<div id="login-bg">
<div id="login-m">
<form action="forPwd.do" method="post">
<ul>
<li>请输入登录名
    <input name="uname" type="text" class="box" id="txtLoginNo" size="33"  />
</li>
   
  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="button" type="image" id="button" value="提交" src="images/delSure.jpg" />
  </li>
</ul>
</form>
</div>
</div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
