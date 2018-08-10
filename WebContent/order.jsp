<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>

<!--主体内容第一部分开始-->
<div class="dingdan">
<div class="dingdan-m">
<ul>
<li><img src="images/n1.jpg" width="205" height="62" /></li>
<li><img src="images/jt2.jpg" width="44" height="60" /></li>
<li><img src="images/n22.jpg" width="205" height="62" /></li>
<li><img src="images/jt21.jpg" width="44" height="60" /></li>
<li><img src="images/n33.jpg" width="205" height="62" /></li>
<li></li>
</ul>
</div>
<form action="updateorder" method="post">
<div class="dingdan-inf">
<div class="dingdan-infm">产品信息</div>
<div class="dingdan-mm">
<div class="dingdan-x">名称</div>
<div class="dingdan-lx">
<ul>

<li class="ds">名称</li>
<li class="ds">数量</li>
<li class="ds">单价</li>
<li class="ds">快递方式</li>

<li><s:property value="shop.goods.name" /></li>
<li><s:property value="shop.num" /><input name="order.amount" type="hidden" id="textfield"  value="<s:property value="shop.num" />" readonly="readonly"/></li>
<li>￥<s:property value="shop.goods.pricle" /></li>
<li>送货上门  <input name="order.goods.id" type="hidden" id="textfield"  value="<s:property value="shop.goods.id" />" />
<input name="order.userinfo.uid" type="hidden"  value="<s:property value="shop.userinfo.uid" />" />
  <input name="order.ostate" type="hidden" id="textfield"  value="待确认" />
  <input name="order.shop.sid" type="hidden" id="textfield"  value="<s:property value="shop.sid" />" /></li>

</ul>
</div>
</div>

<div class="vistor_info"> <!--会员的信息,以下是增加，删除的内容-->
<div class="dingdan-mm">
  <div class="dingdan-x">会员信息</div>
  <div class="youke">
  <ul>
  
        <li><span>*</span> 手机 
      <input name="order.tel" type="text" id="textfield" size="20" value="<s:property value="shop.userinfo.tel" />" />
    <!--   <a href="#">修改</a> --></li>
        <li><span>*</span>联系人及地址
        
        <select name="order.peisong.pid" class="input w50">
              <option value="">请选择常用联系人及地址</option>
              <s:iterator value="pslist">
              <option value="<s:property value="pid" />">姓名：<s:property value="uname" />地址：<s:property value="uaddress" /></option>
              </s:iterator>
             </select>
        
       </li>
      <li class="opli"><!-- <a href="#" class="operateDel">-移除该信息栏</a> --></li>
    </ul>
  </div>
</div>
</div>  <!--会员结束-->

<div class="people">
 <!--  <a href="#"  class="operateAdd">+添加会员信息</a> -->
</div>
<div class="xyb">
  <input name="button" type="image" id="button" value="提交" src="images/xyb.jpg" />
</div>

</div>
</form>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
