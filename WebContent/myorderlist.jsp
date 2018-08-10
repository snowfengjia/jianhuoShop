<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<!--主体内容第一部分开始-->
<div class="tuangouy">

 
<table class="table table-hover text-center">
<tr>
<td>订单编号</td><td>下单时间</td><td>订单总价</td><td>收货地址</td><td>电话</td><td>订单状态</td><td>操作</td>
</tr>
<c:forEach items="${list }" var="yp">

<tr>
<td>${yp.ono }</td>
<td>${yp.pubtime }</td>
<td>${yp.zprice }</td>
<c:forEach items="${ulist }" var="jz">
<c:if test="${jz.uid==yp.uid }">
<td>${jz.address}</td>
<td>${jz.tel}</td>
</c:if>
</c:forEach>
<td>${yp.status }</td>
<c:if test="${yp.status=='已支付' }">
<td><a href="doAddpj.do?id=${yp.kid }">查看详情</a>
<a href="tuiHuo.do?id=${yp.kid }">退货</a>
</td>
</c:if>
<c:if test="${yp.status=='卖家已确认' }">
<td><a href="wancheng.do?id=${yp.kid }">确认订单</a>
|<a href="doAddpj.do?id=${yp.kid }">查看详情</a>
</td>
</c:if>
<c:if test="${yp.status=='已确认' }">
<td><a href="doAddpj.do?id=${yp.kid }">查看详情</a>
</td>
</c:if>
</tr>
</c:forEach>
 <tr>
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="shopList.do?page=1" >首页</a>
             <a href="shopList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="shopList.do?page=${page.page+1 }">下一页</a>
			<a href="shopList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
</tr>




</table>


</div>
						
			
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
