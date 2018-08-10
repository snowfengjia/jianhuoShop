<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>x="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>

<!--主体内容第一部分开始-->
<div class="dingdan">
<div class="dingdan-m">
<ul>
<li><img src="images/n11.jpg" width="205" height="62" /></li>
<li><img src="images/jt21.jpg" width="44" height="60" /></li>
<li><img src="images/n22.jpg" width="205" height="62" /></li>
<li><img src="images/jt2.jpg" width="44" height="60" /></li>
<li><img src="images/n3.jpg" width="205" height="62" /></li>
<li></li>
</ul>
</div>
<form action="updateorder3?id=<s:property value="order.oid" />" method="post">
<div class="dingdan-inf">
<div class="dingdan-infm">商品信息</div>
<div class="dingdan-mm">
<div class="dingdan-x">名称</div>
<div class="dingdan-lx">
<ul>


<li class="ds">名称</li>
<li class="ds">数量</li>
<li class="ds">单价</li>
<li class="ds">单号</li>

<li><s:property value="order.goods.name" /></li>
<li><s:property value="order.amount" /></li>
<li>￥<s:property value="order.goods.pricle" /></li>
<li><s:property value="order.oid" /> <input name="order.oid" type="hidden" id="textfield"  value="<s:property value="order.oid" />" readonly="readonly"/>
  </li>

</ul>
</div>
</div>
<div class="dingdan-infm">
   <span style="color:red"></span>日期：<s:date name="order.date" format="yyyy-MM-dd"/><span></span>
</div>
<div class="vistor_info"> <!--会员的信息,以下是增加，删除的内容-->
<div class="dingdan-mm">
  <div class="dingdan-x">会员信息</div>
  <div class="youke">
  <ul>
  <li><span>*</span> 真实姓名  : <s:property value="order.peisong.uname" />
<%--       <input name="" type="text" id="textfield" size="20" value="<s:property value="order.peisong.uname" />" readonly="readonly"/>
 --%>      </li>
        <li><span>*</span> 手机  : <s:property value="order.tel" />
<%--       <input name="" type="text" id="textfield" size="20" value="<s:property value="order.tel" />" readonly="readonly" />
 --%>      </li>
        <li><span>*</span>地址  :  <s:property value="order.peisong.uaddress" />
         <%--  <input name="" type="text" id="textfield" size="20" value=" <s:property value="order.peisong.uaddress" /><s:property value="order.address" />" readonly="readonly" /> --%>
          
        
      </li>
    </ul>
  </div>
</div>
</div>  <!--会员结束-->

<div class="xyb">
  <input name="button" type="image" id="button" value="提交" src="images/js.jpg" />
</div>

</div>
</form>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
