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
<title>评价</title>
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
<!-- <script type="text/javascript" src="js/regist.js"></script> -->
</head>

<jsp:include page="top.jsp"></jsp:include>
<!--评价版块-->
<div id="reg">
<form onsubmit="return check()" method="post" action="addpj.do">
  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;评价页面</div>
 <div id="reg-mleft">
  
    <ul>
      <li class="m">商品名称：</li>
      <li class="r" >
        <span id='prompt_no' class="spanInit" ></span></li>
      <li class="m">服务编号 ：</li>
      <li class="r"> ${order.fid }</li>
      <li class="m">评价：</li>
      <li class="r">
      <select name="pj">
      <option value="好评">好评</option>
      <option value="中评">中评</option>
      <option value="差评">差评</option>
      </select>
        <!-- <textarea name="order.pj" cols="60" rows="10" ></textarea> -->
       </li>
  

        
      
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="m"> </li>
      <li class="r"><input name="button" type="submit" id="button" value="提交"   /> </li>
     
      
    </ul>
    <div align="center"></div>
     
  </div>
   </form>
  </div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
