<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript">
function check(){
	var note=$("#note").val();
	if(note==null&&note!=""){
		alert("评论不能为空！");
		return false;
	}else{
		return true;
	}
	
}
</script>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">用户账号：${u.uname }</div>
<div class="jin2">
<!-- <div class="jin2-left">
<ul>
</div> -->
<div class="jin2-right1 ">
<ul>
<li>性别：<span class="colorc">${u.sex }</span></li>

<li>电话：${u.tel }</li>
<li>年龄：${u.age }</li>
<c:if test="${u.utype=='管理员' }">
<li>公司名称：${u.tname }</li>
<li>公司类型：${u.ctype}</li>
</c:if>
<c:if test="${u.utype=='会员' }">
<li>真实姓名：${u.tname }</li>
<li>工作经验：${u.experience }</li>
<li>学历：${u.xueli}</li>
<li>专业：${u.profession }</li>
</c:if>
<li>所在地：${u.address }</li>
<li>注册时间：${u.pubtime }</li>


</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">详情</div>
<div class="tuijian-inf">
<ul>
<li>${u.introduction }</li>
</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">评价</div>
<div class="tuijian-inf">
<ul>
<c:forEach items="${blist }" var="b">
<li>评价内容：${b.note }</li>
<li>评价时间：${b.pubtime }</li>
</c:forEach>
</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">评价</div>
<div class="tuijian-inf">
<form onsubmit="return check()" method="post" action="addBbs.do">
<div>
<ul>
<c:if test="${sessionScope.user!=null }">
<li><textarea rows="10" cols="80" name="note" id="note"></textarea></li>
<li><input type="hidden" name="fbid" value="${u.uid }"><input type="submit" value="提交"></li>
</c:if>
<c:if test="${sessionScope.user==null}">
<li><h3>请登录后发布评论！！</h3></li>
</c:if>
</ul>
</div>
</form>

</div>
</div>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
