<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!--导航-->
<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div id="content1">
  <!--左侧-->
  <div id="con1-left">
    <div class="con1-1">商品查询</div>
     <form action="selectGoodsList.do" method="post" >
    <div class="cs">
      <ul>
      <li>
      商品名称：<input type="text" name="name"  class="select"> 
      </li>
        <li>
      商品标签：<input type="text" name="mark"  class="select"> 
      </li>
      <li>商品类型：<select name="fid" class="select">
              <option value="">请选择分类</option>
              <c:forEach items="${alist }" var="a">
              <option value="${a.fid }">${a.ftype }</option>
              </c:forEach>
             </select> </li>
      <li ><input type="submit" value="搜索" class="search"/></li>
      </ul>
    </div>
    </form>
   
    
   
    
    
  </div>
  <!--右侧-->
  <div id="con1-right">
    <div id="right-top">
      <div class="banner">
        <ul id="imgs">
        <c:forEach items="${nlist }" var="n">
          <li><a href="showNews.do?id=${n.ggid }"><img src="upload/${n.ggpic}"  width="500" height="240"/></a></li>
         </c:forEach>
        </ul>
        <ul id="numbers">
         <c:forEach items="${nlist }" var="n" varStatus="number">
          <li>${number.count }</li>
          </c:forEach>
        </ul>
      </div>
        <div class="zcdl">
        <div class="my">
        <ul>
        <c:if test="${sessionScope.user==null }">
         <li style="margin-right:3px;"><a href="fore_login.jsp"><img src="images/dl.jpg" width="170" height="72" /></a></li>
          <li style="margin-top:20px;"><a href="regist.jsp"><img src="images/zc.jpg" width="170" height="72" /></a></li>
          </c:if><c:if test="${sessionScope.user!=null }">
          <li style="line-height: 24px;font-size: 17px;margin-left:-18px;">  &nbsp;&nbsp;${sessionScope.user.tname }&nbsp;&nbsp;
          <a href="loginout.do"><img src="images/zhux.jpg" width="85" height="28" style="margin-left: 94px;
    margin-top: -26px;display: block;"/></a>
          </li>
          <li class="cls1" style="margin-top:0px;"><a href="showInfo.do">个人基本信息</a></li>
         <%--  <c:if test="${sessionScope.user.smtype!='已实名认证' }">
          <li class="cls1" style="margin-top:0px;"><a href="showInfo2.do">实名认证</a></li>
          </c:if> --%>
          <li class="cls1" style="margin-top:0px;"><a href="updateMoney.jsp">充值</a></li>
          <li class="cls1" style="margin-top:0px;"><a href="shopList.do">订单管理</a></li>
          <li class="cls1" style="margin-top:0px;"><a href="fBbsList.do">我的留言</a></li>
    </c:if>
       </ul>
      </div>
      
    </div>
     </div>
    <div id="right-btm">
      <div class="tgj"><a class="zp">最新商品</a><span><a href="showGoods.do">更多商品信息>></a></span></div>
      <div class="tgjlx">
        <ul style="width:1446px">
         <c:forEach items="${jlist }" var="jz">
        <li><a href="showGoodsx.do?id=${jz.id }"><img src="upload/${jz.img }" width="160" height="88" />${jz.name }</a><br />
            <span>价格：${jz.price } 元</span></li>
       </c:forEach>
       
        </ul>
      </div>
    </div>
  </div>
</div>
<!--主体内容第一部分结束--> 
<!--主体内容第二部分开始-->
<div id="con-2"> 
  <!--左侧开始-->
  <div id="con-2left">
    <div id="con-2left1">
   <!--    <div class="con-21"></div>
      <div class="jingdian">
      <ul>
          <li><a href="showpirce?f4.pricle=1">100元以内</a></li>
          <li><a href="showpirce?f4.pricle=2">100-200元</a></li>
          <li><a href="showpirce?f4.pricle=3">200-300元</a></li>
          <li><a href="showpirce?f4.pricle=4">300-500元</a></li>
          <li><a href="showpirce?f4.pricle=5">500-800元</a></li>
          <li><a href="showpirce?f4.pricle=6">800以上</a></li>
        </ul>
      </div>--> 
      <div class="con-23"><h3 >类别</h3></div>
      <div class="jingdian">
         <ul>
        <c:forEach items="${alist }" var="a">
        <li><a href="showGoods.do?fid=${a.fid }">${a.ftype }</a></li>
        </c:forEach>
       </ul>
      </div>
    </div>
  </div>
  <!--左侧结束--> 
  <!--右侧开始-->
  <div id="con-2right">
    <div id="con-2meun">
    </div>
       <div class="con-2inf"> <h3 class="hotzp">热销商品</h3>
      <ul>
     <c:forEach items="${jzlist }" var="j">
        <li class="w130"><a href="showGoodsx.do?id=${j.id }"><img src="./upload/${j.img }" width="220" height="140" />
        <br />商品名称：${j.name }<br />销售量：${j.xnum }  </a></li>
       </c:forEach>
      </ul>
  </div>
</div>
<!--主体内容第二部分结束--> 
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
