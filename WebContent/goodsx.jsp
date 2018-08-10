<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">商品名称：${jz.name }</div>
<div class="jin2">
<div class="jin2-left">
<ul>
<li>
<a href="" title="">
<img src="upload/${jz.img }" width="400" height="250" />
</a>
</li>
<li class="pics"><a href="upload/${jz.img }" class="zoom" title="${jz.img }" ><img src="upload/${jz.img }" width="100" height="63" /></a></li>
</ul>
</div>
<!-- <form action="addshop.do" method="post"> -->
<div class="jin2-right">
<ul>
<li>价格：<span class="colorc">${jz.price }</span>元</li>
<li>库存量：<span class="colorc">${jz.kcnum }</span></li>
<li>销量：<span class="colorc">${jz.xnum }</span></li>
<li>标签：${jz.mark }</li>
<c:forEach items="${adlist }" var="a">
<c:if test="${a.fid==jz.fid }">
<li>商品类别：${a.ftype }</li>
</c:if>
</c:forEach>
<li>发布时间：${jz.pubtime }</li>
<c:if test="${sessionScope.user!=null }">
<c:if test="${jz.kcnum!=0 }">
<%-- <li><a href="addKeep.do?fid=${jz.id }"><font color="#ff0000;">收藏</font></a></li> --%>
<li><a href="addshop.do?fid=${jz.id }"><img src="images/jgwc.jpg" width="122" height="42" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
<%-- <a href="addshop.do?fid=${jz.id }"> --%>
<!-- <input type="submit" value="结算" style="    width: 100px;
    height: 30px;
    border: none;
    background: #b10a0a;
    font-size: 18px;
    color: #ffffff;
    margin-top: 20px;" > -->
<!-- </a> --></li>
</c:if>
</c:if>
<c:if test="${sessionScope.user==null }">
<li><h3>请登录后操作！！</h3></li>
<li><h3><a href="fore_login.jsp">登录</a> </h3></li>
</c:if>
<c:if test="${jz.kcnum==0 }">
<li><h3>库存不足！</h3></li>
</c:if>
</ul>
</div>
<!-- </form> -->
</div>

<div class="tuijian">
<div class="tuijian-m">商品内容</div>
<div class="tuijian-inf">
<ul>
<li>${jz.miaoshu }</li>
</ul>
</div>
</div>
<%-- <div class="tuijian">
<div class="tuijian-m">商品评价</div>
<div class="tuijian-inf">
<ul>

<c:forEach items="${olist }" var="yp">

<li>评价人：<c:forEach items="${u2list }" var="u">
<c:if test="${yp.uid==u.uid }"> <font color="#ff0000;">${u.tname }</font></c:if>
</c:forEach>  评价：<font color="#ff0000;">${yp.pj }</font></li>
</c:forEach>

</ul>
</div>
</div> --%>

</div>
<!--主体内容第一部分结束-->
<!--底部-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
