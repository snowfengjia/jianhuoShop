<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>--订单</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.4.custom.min.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script  type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/dingdan.js"></script>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="dingdan">
<div class="dingdan-m">
<ul>
<li><img src="images/n11.jpg" width="205" height="62" /></li>
<li><img src="images/jt21.jpg" width="44" height="60" /></li>
<li><img src="images/n2.jpg" width="205" height="62" /></li>
<li><img src="images/jt2.jpg" width="44" height="60" /></li>
<li><img src="images/n33.jpg" width="205" height="62" /></li>
<li></li>
</ul>
</div>

<form action="updateorder2?id=<s:property value="order.oid" />" method="post">
<div class="dingdan-inf">
<div class="dingdan-infm">商品信息</div>
<div class="dingdan-mm">
<div class="dingdan-x">名称</div>
<div class="dingdan-lx">
<ul>

<li class="ds">名称</li>
<li class="ds">数量</li>
<li class="ds">单价</li>
<li class="ds">快递方式</li>
 
<li><s:property value="order.goods.name" /></li>
<li><s:property value="order.amount" /></li>
<li>￥<s:property value="order.goods.pricle" /></li>
<li>送货上门  <input name="order.oid" type="hidden" id="textfield"  value="<s:property value="order.oid" />" />
 </li>

</ul>
</div>
</div>
<div class="dingdan-infm">
   <span style="color:red">*</span>日期：<s:date name="order.date" format="yyyy-MM-dd" /><span></span>
</div>
<div class="vistor_info"> <!--会员的信息,以下是增加，删除的内容-->
<div class="dingdan-mm">
  <div class="dingdan-x">会员信息</div>
  <div class="youke">
  <ul>
  <li><span>*</span> 真实姓名 : <s:property value="order.peisong.uname" />
      <input name="order.uname" type="hidden" id="textfield" size="20" value="<s:property value="order.peisong.uname" />" readonly="readonly"/>
      </li>
        <li><span>*</span> 手机  : <s:property value="order.tel" />
      <input name="order.tel" type="hidden" id="textfield" size="20" value="<s:property value="order.tel" />"  readonly="readonly"/>
      </li>
        <li><span>*</span>地址 :  <s:property value="order.peisong.uaddress" />
          <input name="order.peisong.uaddress" type="hidden" id="textfield" size="20" value="<s:property value="order.peisong.uaddress" /><s:property value="order.address" />" readonly="readonly" />
        
      </li>
      
    </ul>
  </div>
</div>
</div>  <!--会员结束-->

<!-- <div class="people">
  <a href="#"  class="operateAdd">+添加会员信息</a>
</div> -->
<div class="xyb">
  <input name="button" type="image" id="button" value="提交" src="images/n2.jpg" />
</div>

</div>
</form>
</div>
<!--主体内容第一部分结束-->
<!--底部-->

<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
