<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>

<!--登录版块-->
<div id="login-bg">
<div id="login-m">
<form action="login.do" method="post">
<ul>
<li>登录名
    <input name="uname" type="text" class="box" id="txtLoginNo" size="33" value="" />
</li>
<li>密&nbsp;&nbsp;&nbsp;码
    <input name="pwd" type="password" class="box" id="txtPwd" size="33" />
</li>
<li>
    <a href="fore_losspwd0.jsp">忘记密码？</a>
</li>

    
  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="button" type="image" id="button" value="提交" src="images/login-b.jpg" />
  </li>
</ul>
</form>
</div>
</div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
