<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="tuangouy">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<table class="table table-hover text-center">
<tr>
<td>序号</td><td>新闻标题</td><td>图片</td>
</tr>
<c:forEach items="${list }" var="n" varStatus="number">
<tr>
<td style="width:10%;">${number.count }</td>
<td style="width:60%;"><a href="showNews.do?id=${n.ggid }">${n.name }</a></td>
<td><img src="upload/${n.ggpic }" width="50" height="50"> </td>
</tr>
</c:forEach>
 <tr>
		<td colspan="3"> <c:if test="${page.page>1}">
              <a href="fnewsList.do?page=1" >首页</a>
             <a href="fnewsList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fnewsList.do?page=${page.page+1 }">下一页</a>
			<a href="fnewsList.do?page=${page.totalPage }">末页</a>
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
