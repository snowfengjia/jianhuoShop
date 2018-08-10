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
<td>留言内容</td><td>留言时间</td><td>回复内容</td><td>回复时间</td>
</tr>
<c:forEach items="${list }" var="n" varStatus="number">
<tr>
<td >${n.note }</td>
<td >${n.pubtime }</td>
<td>${n.note2 } </td>
<td>${n.etime } </td>
</tr>
</c:forEach>
<c:if test="${sessionScope.user!=null }">
<tr><td colspan="4"><a href="add_bbs.jsp">我要留言</a></td></tr>
</c:if>

 <tr>
		<td colspan="3"> <c:if test="${page.page>1}">
              <a href="fBbsList.do?page=1" >首页</a>
             <a href="fBbsList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fBbsList.do?page=${page.page+1 }">下一页</a>
			<a href="fBbsList.do?page=${page.totalPage }">末页</a>
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
