<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新用户注册</title>
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
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!--  <script type="text/javascript" src="js/regist.js"></script>-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">


var msga=null;

function checka(){
var name=$("#txtNo").val();
if(name==""||(name.length<6||name.length>12)){
 $("#checka").html("用户账号不能为空且长度在6～12位之间！");
 name="";
 $("input[name=account]").focus();
}else {
  $("#checka").html("");
  $.ajax({
  url:"checkUname.do",
  type:"post",
  data:"uname="+name,
  dataType:"json",
  success:function(result){
  var  msg=result.msg;
    if(msg=="用户名已存在，请更换用户名！"){
  //  name="";
 // $("#txtNo").html("");
 $("input[name=account]").focus(function (){
        $(this).val("");

});
   $("input[name=account]").focus();
  $("#checka").html(msg);
  return false;
  }else{
  $("#checka").html(msg);
  return true;
  }
  
  },
  error:function(){
  alert("请求失败！");
  }
  })
}
}


    function checkpwd(){
  var pwd=$("#pwd").val();
  if(pwd==""||pwd.length<6||pwd.length>12){
 $("#checkpwd").html("密码不能为空且长度在6～12位之间！");
  $("input[name=password]").focus();
// $("p").focus();
 return false;
}else {
 $("#checkpwd").html("密码格式正确！");
return true;}

}

function checkpwdc(){
var pwd=$("#pwd").val();
var pwdc=$("#pwdc").val();
if(pwdc==""||pwdc!=pwd){
  $("#checkpwdc").html("两次密码要一致 ！");
   //$("input[name=passwordc]").focus();
  return false;
  }else{
  $("#checkpwdc").html("密码一致 ！");
  return true;}

}

  function checkname(){ 
  var uname=$("#name").val();
  if(uname==""||uname.length>6||uname.length<2){
  $("#checkname").html("姓名不能为空且长度在2～6位之间！");
   $("input[name=name]").focus();
  return false;
  }else{
  
  $("#checkname").html("格式正确！");
  return true;
  }}
  

  function checkid(){
  var id=$("#id").val();
var regid=/^[1-9]{1}\d{16}[A-Z,0-9]{1}$/;
if(id==""||!regid.test(id)){
   $("#checkid").html("身份证号不能为空，且是首位不能为0，17位数字加上最后一位是0-9和A-Z其中一位，组成的18位");
    $("input[name=idpojoid]").focus();
    return false;
   }else {
    $("#checkid").html("身份证号正确！");
   return true;
   }
}

 function checktel(){
 var tel=$("#tel").val();
var regtel=/^(13|15|18|)\d{9}$/;
 if(tel==""||!regtel.test(tel)){
  $("#checktel").html("电话号码不能为空，且以13，15，17，18开头的11位");
   $("input[name=tel]").focus();
  return false;
  }else{
   $("#checktel").html("电话号码格式正确！");
  return true;}

 }
 
  
 
  
  




function loadimage(){ 
document.getElementById("randImage").src = "CheckCodeServlet?"+Math.random(); 
} 

function checkcode(){
var incode=$("#incode").val();
if(incode==""){
  $("#checkcode").html("验证码不能为空！");
   $("input[name=password]").focus();
}else{
$.ajax({
url:"DoCodeServlet",
type:"post",
data:"incode="+incode,
dataType:"json",
success:function(result){
msga=result.res;
  if(msga=="验证码正确"){
  $("#checkcode").html(msga);
  return true;
  }else{
  $("#checkcode").html(msga);
  return false;
  
  }
},
error:function(){
  alert("请求失败！");
}
})
}
}
function check(){

alert(msga);
if(msga!="验证码正确"){
//$("#incode").val().html("");
//if(checkcode()!=true){
return false;
}else{
//local.href='DoAdminLoginServlet';
return true;
}
}
</script> 
</head>

<body>
<!--头部-->
<jsp:include page="top.jsp"></jsp:include>


<!--注册版块-->
<div id="reg">

  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;会员注册</div>
  <div id="reg-mleft">
  <form  action="RegServlet" method="post" onsubmit="return check()">
    <ul>
      <li class="m">用户帐号 </li>
      <li class="r" >
        <input name="account" type="text" class="box txtInit" id="txtNo" onblur="return checka()"/><div id="checka" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_no' class="spanInit" ></span></li>
      <li class="m">设置密码 </li>
      <li class="r">
        <input name="password" type="password" class="box txtInit" id="pwd"  onblur="return checkpwd()"/><div id="checkpwd" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_pwd'  class="spanInit" ></span></li>
      <li class="m">确认密码 </li>
      <li class="r">
        <input name="passwordc" type="password" class="box txtInit" id="pwdc"  onblur="return checkpwdc()"/><div id="checkpwdc" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_confirmpwd' class="spanInit"  ></span></li>
      <li class="m">用户姓名 </li>
      <li class="r">
        <input name="name" type="text" class="box txtInit" id="name" onblur="return checkname()" /><div id="checkname" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_name' class="spanInit"  ></span></li>
      <li class="m">身份证号 </li>
      <li class="r">
        <input name="idpojoid" type="text" class="box txtInit" id="id" onblur="return checkid()" /><div id="checkid" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_id' class="spanInit"   ></span></li>
      <li class="m">性 别 </li>
      <li class="r">
        <input name="sex" type="radio" id="radio" value="男" checked="checked" />
        男
        <input type="radio" name="sex" id="radio2" value="女" />
        女 </li>
      <li class="m">手机号码 </li>
      <li class="r">
        <input name="tel" type="text" class="box txtInit" id="tel" onblur="return checktel()" /><div id="checktel" style="display:inline;color:red;font-family:楷体;font-size:15px"></div>
        <span id='prompt_phone' class="spanInit" ></span></li>
      <li class="m">校验码 </li>
      <li class="r">
        <input name="textfield" type="text" class="box txtInit" id="incode" size="15"  onblur="return checkcode()" /><div id="checkcode" style="display:inline;color:red;font-family:楷体;font-size:15px" ></div>
        看不清？<a href="javascript:loadimage();">换一张</a><label> <img id="randImage" src="CheckCodeServlet" name="randImage"  /></label> 
                                     
                                <label><span style="color:red;font-family:黑体"></span></label></li>
      <li class="m"> </li>
      <li class="r">
        <input name="button" type="image" id="button" value="提交" src="images/but2.jpg"   />
      </li>
      <li class="m"> </li>
      <li class="r">
        <input name="checkbox" type="checkbox" id="checkbox" checked="checked" />
        《会员服务条款》 <img src="images/jt.jpg" width="13" height="12" /></li>
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
