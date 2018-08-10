<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>


<!--充值-->
<div id="login-bg">
<div id="login-m">
<form action="chongZhi.do" method="post">
<ul>
<li>用&nbsp;&nbsp;户&nbsp;&nbsp;名
    <input  type="text" class="box" id="txtLoginNo" size="33" value="${sessionScope.user.uname }" readonly="readonly"/>
</li>

<li>余&nbsp;额&nbsp;为&nbsp;
    <input name="" type="text" class="box" id="txtPwd" size="33" value="${sessionScope.user.ed }" readonly="readonly"/>
</li>
<li>充值金额
    <input name="ed" type="text" class="box" id="txtPwd" size="33" />
</li>

    
  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="button" type="image" id="button" value="提交" src="images/login-c.jpg" />
  </li>
</ul>
</form>
</div>
</div>

<!--底部-->
    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
