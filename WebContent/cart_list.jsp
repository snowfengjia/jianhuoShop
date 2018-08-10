<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<%-- <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> --%>
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
<script> 
$(function(){ 
$(".add").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())+1) 
setTotal(); 
}) 
$(".min").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())-1) 
if(parseInt(t.val())<0){ 
t.val(0); 
} 
setTotal(); 
}) 
function setTotal(){ 
var s=0; 
$("#shop-xx #num22").each(function(){ 
s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()); 
});
document.getElementById("total").value=s.toFixed(2);
//("input[id=total]").html(s.toFixed(2)); 
} 
setTotal(); 


}) 
</script> 
<style type="text/css">
.mask { /*遮罩层*/
    background-color:gray;
    left:0;
    position:absolute;
    top:0;
    z-index:100;
    filter:alpha(opacity=30);
   opacity:0.3;
}

div.dialog {
	width: 296px;
	height:173px;
	position: absolute;
	z-index: 101;
	display: none;
    background-image:url(images/dialog.png)
}

div.title {
	padding-top: 5px;
	padding-left:270px;
}
div.dialog div.content {

	height: 90px;
	text-align:center;

	font:bold 15px/90px Verdana, Geneva, sans-serif;
}

div.dialog div.bottom {
	text-align: right;
	padding: 10px 10px 10px 0px;
	border-top:1px dashed #999999;

}
div.bottom .btn1 {
	border:none;
	width: 63px;
	height: 29px;
	cursor:pointer;
	
}
div.bottom #btnSure{
	background-image:url(images/delSure.jpg);
}
div.bottom #btnCancel{
	background-image:url(images/delCancel.jpg);
}
</style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>

<div id="shop">
  <div id="shop-t">
    <div id="shop-l"><img src="images/sh.jpg" width="74" height="67" /></div>
    <div id="shop-r">我的购物车</div>
  </div>
  <div id="shop-inf">
    <ul>
      <li class="dj" style="    width: 250px;">名称</li>
     <!--  <li class="rs">数量</li> -->
      <li class="xh">单价/数量/库存</li>
     <li class="dj">修改</li>
      <li class="cz" >操作</li>
    </ul>
  </div>
   <c:forEach items="${list }" var="s"> 
  <form action="updateShopNum.do" method="post">
  <div id="shop-xx"><!--  -->
    <ul id="shop1">
      <li class="dj" style=" width: 250px;">
        <div id=" luxian">
        
          <ul >
          <c:forEach items="${glist }" var="g">
          <c:if test="${g.id==s.fid }">
            <li><a href="./upload/${g.img }" title="${g.name }"><img src="./upload/${g.img }" width="87" height="58"  /></a></li>
            <li><a href="#">${g.name }</a></li>
          </c:if>
           </c:forEach>
          </ul>
        </div>
      </li>
       <li id="num22" class="xh" >总价:￥<span class="price">
       <c:forEach items="${glist }" var="g">
          <c:if test="${g.id==s.fid }">
            ${g.price }
          </c:if>
           </c:forEach></span>元/
                    <input class="min" type="button" value="-" /> 
                    <input class="text_box" size="2" name="num" type="text" value="${s.num }" /> /<c:forEach items="${glist }" var="g">
          <c:if test="${g.id==s.fid }">
           <input type="text" value="${g.kcnum }" id="kcnum" size="2" readonly="readonly"> 
          </c:if>
           </c:forEach>
                    <input class="add"  type="button" value="+" /> 
                     <input   type="hidden" name="id"  value="${s.id }" /> 
        </li>
    <%--   <li class="rs"><input type="text" name="shop.num"  value="<s:property value="num"/>" size="2"/></li> --%>
   <%--    <li class="rs">￥<s:property value="goods.pricle" />
      </li> --%>
      <li class="rs" style="width:110px;"><input type="submit" value="确认修改"/></li>
      <li class="cz"><a href="deleteShop.do?id=${s.id }" class="btnDel" ><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
    </ul>
    
   
</div>
</form>
</c:forEach>
                          <%--  < div id="fanye" >  <div id="fanye" >当前显示第
			<s:property value="page.pageIndex" />
			页 
			共
			<s:property value="page.totalpages" />
			页
			</div> 
			<div id="fanye" align="center">
				<a href="shoplist.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="shoplist.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="shoplist.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="shoplist.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>


			</div></div> --%>

<%-- <div id="jine">应付金额：<s:property value="total" /><span style="color:#F00;"></span>元</div> --%>
  <form action="addOrder.do" method="post">
<div id="js">
<ul>
<li>您的余额为：${sessionScope.user.ed }</li>
<li style="    margin-top: 10px;">应付金额：<label ><input type="text" name="zprice" id="total" readonly="readonly"/> </label>
<input name="uid" type="hidden"  value="${sessionScope.user.uid }"  />
</li>
<li style="margin-top: 10px;"> <input name="button" type="image" id="button" value="提交" src="images/js.jpg" /></li>
</ul>
</div>
</form>
</div>


<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
<div class="mask"></div>


<div class="dialog">
  <div class="title">
    <img src="images/del.png" id="closePic" title="关闭"/> </div>
  <div class="content"> <p>您真的要删除这条记录吗？</p></div>
  <div class="bottom">
    <input type="button" value="" class="btn1"  id="btnSure"/>
    <input type="button" value="" class="btn1" id="btnCancel" />
  </div>
</div>
</body>
</html>
