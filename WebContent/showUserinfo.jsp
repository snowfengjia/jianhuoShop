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
<title>个人信息修改</title>
<style type="text/css">
.txtInit {
	border: 1px #cecece solid;
}
.txtFocus {
	border: 1px solid #009;
}
.spanInit {
	width: 275px;
	height: 22px;
	display: block;
	float: right;
	background-repeat: no-repeat;
	background-position: left;
	color: red;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
.jies{
    width: 384px;
    height: 100px;
}
.zhuc{
    margin-top: 82px;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<%-- <script type="text/javascript" src="js/regist.js"></script>  --%>
<%-- <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script> --%>
<script type="text/javascript">
	function checkuname() {
		var name = $("#username").val();
		if(name==""||(name.length<3||name.length>12)){
			 $("#checku").html("用户账号不能为空且长度在3～12位之间！");
			 $("input[id=username]").focus();
		} else {
			$("#checku").html("");
			$.ajax({
				url : "checkUname.do",
				type : "post",
				data : "uname=" + name,
				
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
				$("#checku").html("用户名存在，请更换！");
				$("input[id=username]").focus();
				return false;
				}else{
				$("#checku").html("可以用");
				return true;
				}
				},
				error:function(){
				alert("请求失败！");
				return false;
				}

			});
		}

	}
	 function checkpwd(){
		  var pwd=$("#txtPwd").val();
		  if(pwd==""||pwd.length<6||pwd.length>12){
		 $("#prompt_pwd").html("密码不能为空且长度在6～12位之间！");
		 $("input[id=txtPwd]").html("");
		  $("input[id=txtPwd]").focus();
		 return false;
		}else {
		 $("#prompt_pwd").html("密码格式正确！");
		return true;}

		}

		function checkpwdc(){
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		if(pwdc==""||pwdc!=pwd){
		  $("#prompt_confirmpwd").html("两次密码要一致 ！");
		  $("input[id=txtConfirmPwd]");
		   // $("input[name=passwordc]").focus();
		  return false;
		  }else{
		  $("#prompt_confirmpwd").html("密码一致 ！");
		  return true;}

		}

		 function checktel(){
		 var tel=$("#txtPhone").val();
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(tel==""||!regtel.test(tel)){
		  $("#prompt_phone").html("电话号码不能为空，且以13，15，17，18开头的11位");
		  $("input[id=txtPhone]").html("");
		   $("input[id=txtPhone]").focus();
		  return false;
		  }else{
		   $("#prompt_phone").html("电话号码格式正确！");
		  return true;
		  }

		 }
		 function checkname1(){ 
			  var uname=$("#txtName1").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName1]").html("");
			   $("input[id=txtName1]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name1").html("ok");
			  return true;
			  }} 
		  
		 function checkname2(){ 
			  var uname=$("#txtName2").val();
			  if(uname==""||uname.length<2){
			  $("#prompt_name1").html("不能为空且长度在2位以上！");
			  $("input[id=txtName2]").html("");
			   $("input[id=txtName2]").focus();
			  return false;
			  }else{
			  
			  $("#prompt_name2").html("ok");
			  return true;
			  }} 
		  
		  
	function check(){
		var flag= checkuname() 
		      &&checkpwd()
			  &&checkpwdc()
			  &&checktel()
			  && checkname1() && checkname2();
		//alert(flag);
		return flag;
	}
	function checkAll(){
		//alert("kkkkk");
		var flag=false;
		var aa = $("#username").val();
		var pwd=$("#txtPwd").val();
		var pwdc=$("#txtConfirmPwd").val();
		var tel=$("#txtPhone").val();
		var name1=$("#txtName1").val();
		var name2=$("#txtName2").val();
		 var regtel=/^(13|15|18|)\d{9}$/;
		 if(aa!=""&&(tel!=""||regtel.test(tel))&&(name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&&
				 (pwd!=""||pwd.length>6||pwd.length<12)&&(pwdc!=""||pwdc==pwd)){
			 flag=true;
		 }else{
			 alert("注册信息不完整或不合规范！");
		 }
		/*  if (aa== "") {
				$("#checku").html("用户名不能为空！");
			}else{
				flag=true;
			}
		 if(tel==""||!regtel.test(tel)){
		  $("#prompt_phone").html("电话号码不能为空，且以13，15，17，18开头的11位");
		  
		  }else{
			  flag=true;
		  } */
		
		return flag;
		
	}
</script>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>

<!--注册版块-->
<div id="reg">

  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;会员修改</div>
  <div id="reg-mleft">
  <form method="post" action="addShowInfo.do" >
    <ul>
      <li class="m">用户名： </li>
      <li class="r" >
        <input name="uname" type="text" class="box txtInit" id="username" onblur="return checkuname()" value="${user.uname }" readonly="readonly"/>
        <input name="uid" type="hidden" id="uid"  value="${user.uid }" />
        <span id='checku' class="spanInit" ></span></li>
      <li class="m">真实姓名： </li>
      <li class="r" >
        <input name="tname" type="text" class="box txtInit"  value="${user.tname }"/>
        <span id='checku2' class="spanInit" ></span></li>
      <li class="m">密码 </li>
      <li class="r">
        <input name="pwd" type="password" class="box txtInit" value="${user.pwd }"/>
        <span id='prompt_pwd'  class="spanInit" ></span></li>
      <li class="m">手机号码： </li>
      <li class="r">
        <input name="tel" type="text" class="box txtInit" id="txtPhone" onblur="return checktel()" value="${user.tel }"/>
        <span id='prompt_phone' class="spanInit" ></span></li>
        <li class="m">年龄： </li>
      <li class="r">
        <input name="age" type="text" class="box txtInit" id="txtPhone3" onblur="return checktel4()" value="${user.age }"/>
        <span id='prompt_phone3' class="spanInit" ></span></li>
      <li class="m">地址 :</li>
      <li class="r"><input name="address" type="text" class="box txtInit" id=""  value="${user.address }"/>
        <span id='' class="spanInit"  ></span> </li>
    <li class="m">预留问题 </li>
      <li class="r"><input name="mbanswer" type="text" class="box txtInit" id="txtName1" onblur="return checkname1()" value="${user.mbanswer }"/>
        <span id='prompt_name1' class="spanInit"  ></span> </li>
    <li class="m">问题答案 </li>
      <li class="r"><input name="question" type="text" class="box txtInit" id="txtName2" onblur="return checkname2()" value="${user.question }"/>
        <span id='prompt_name2' class="spanInit"></span> </li>
    <%-- <li class="m">班级：</li>
      <li class="r">
      <input type="text" name="clazz"  class="box txtInit" value="${user.clazz }" />
      </li> --%>
     <%-- <li class="m">实名状态： </li>
      <li class="r">
      <input  type="text" class="box txtInit"  value="${user.smtype }" readonly="readonly"/>
     </li> --%>
      <li class="m"> </li>
      <li class="r zhuc">
        <input type="submit" id="button" value="提交"   />
      </li>
    </ul>
      </form>
  </div>

  <div id="reg-right">
    <div><img src="images/kf.jpg" width="230" height="150" /></div>
    <div id="kf2"><a href="fore_login.jsp">已有账户，请点击登录</a></div>

  </div>
</div>
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
