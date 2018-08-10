<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录页面</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript">
	function checkuname() {
		var name = $("#question").val();
		//alert(name);
		var uid=$("#uid").val();
		if (name == "") {
			$("#qq").html("答案不能为空！");
		} else {
			$("#qq").html("");
			$.ajax({
				url : "checkmibao.do",
				type : "post",
				data :{"question":name,"uid":uid},
				//data:"question="+name,
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
				$("#pwd").html("对不起！你的密保答案不正确！请重新输入");
				}else{
				$("#pwd").html("你的密码是："+result.info);
				}
				},
				error:function(){
				alert("error");
				}

			})
		}

	}
</script>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>

<!--登录版块-->
<div id="login-bg">
<div id="login-m">

<ul>
<li>登录名
    <input name="uname" type="text" class="box" id="txtLoginNo" size="33" value="${user.uname}" readonly="readonly" />
</li>
<li >你的密保问题是：
  ${user.mbanswer }
</li>
<li>答案是：
    <input name="" type="text" class="box" id="question" size="33" value="" onblur="checkuname()"/><div id="qq"></div>
    <input name="" type="hidden" class="box" id="uid" size="33" value="${user.uid }" />
</li>
<li id="pwd">
    
</li>
<li>
    <a href="fore_login.jsp">返回登录页面</a>
</li>

    
 
</ul>
</form>
</div>
</div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
