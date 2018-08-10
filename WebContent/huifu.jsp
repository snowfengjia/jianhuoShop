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
<title>收件箱</title>
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
#reg-mleft1{
    float: left;
    margin-top: 30px;
    width: 515px;
    /* border-right: 1px #CCC solid; */
    padding-left: 50px;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
</style>
<!-- <link href="css/layout.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- <script type="text/javascript" src="js/regist.js"></script> -->
</head>

<jsp:include page="top.jsp"></jsp:include>
<!--评价版块-->
<div id="reg">
<s:if test="#session.user!=null">
<form method="post" action="addBbsFore">
  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;收件箱</div>
 <div id="reg-mleft">
  
    <ul>
      <li class="m">标题：</li>
      <li class="r" ><s:property value="bbs.name" /> </li>
      <li class="m">回复内容：</li>
      <li class="r">
        <s:property value="bbs.note" />
       </li>
      
       <li class="m" >
        <input name="bbs.name" type="hidden" value="<s:property value="bbs.name" />" />
        <input name="bbs.gid" type="hidden" value="<s:property value="bbs.gid" />" />
        <input name="bbs.sta" type="hidden" value="1" />
        <input name="bbs.isdel" type="hidden" value="1" />
        <input name="bbs.uid" type="hidden" value="<s:property value="#session.user.uid" />" />
        </li>
         <li class="r">
       
       </li>
        <li class="m" >内容：</li>
        <li class="r">
        <textarea name="bbs.note" cols="60" rows="10" ></textarea>
       </li>
       
      <%--   <li class="r">所属类型：
     
       <select name="tsjy.type">
       <option value="投诉">投诉</option>
       <option value="建议">建议</option>
       </select>
      </li> --%>
      <li class="r"><input name="button" type="submit" id="button" value="回复"  
      style=" margin-top: 140px; margin-left: 70px;width: 60px; height: 40px;font-size: 17px;" /> </li>
     
      
    </ul>
    <div align="center"></div>
     
  </div>
   </form>
   </s:if><s:else>
   对不起！你还没有登录，请登录再操作！
   </s:else>
  </div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
