<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>

<!--主体内容第一部分开始-->
<div class="tuangouy">
<ul>
 <c:forEach items="${list }" var="jz">
<li>

<div><a href="showGoodsx.do?id=${jz.id }"><img src="./upload/${jz.img }" width="305" height="200" /></a></div>
<div class="tuangouy-m"><a href="showGoodsx.do?id=${jz.id }">商品名称：${jz.name }</a><br />
<span>价格：${jz.price }</span>
</div>
<div class="fengsu"></div>
</li>
</c:forEach>

</ul>
</div>
						
			 <div class="tgfy"> 
         <c:if test="${sessionScope.p==1 }">
		<c:if test="${page.page>1}">
              <a href="showGoods.do?page=1" >首页</a>
             <a href="showGoods.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="showGoods.do?page=${page.page+1 }">下一页</a>
			<a href="showGoods.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	 <c:if test="${page.page>1}">
    <a href="selectGoodsList.do?page=1" >首页</a>
    <a href="selectGoodsList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="selectGoodsList.do?page=${page.page+1 }">下一页</a>
			<a href="selectGoodsList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		
		</c:if>
      </div>
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
