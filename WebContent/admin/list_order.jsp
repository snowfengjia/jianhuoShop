<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="/jianhuoshop/admin/js/Date.js"></script>
</head>
<body>
<form method="post" action="orderquery" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <%-- <ul class="search" style="padding-left:10px;">
        <li> <!-- <a class="button border-main icon-plus-square-o" href="add.html"> 添加内容</a> --> </li>
        <li>
          </li>
        
        <li>
        <input type="text" placeholder="请输入搜索的订单人的名字" name="order.uname" class="input" style="width:200px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入搜索产品名称" name="order.goods.name" class="input" style="width:200px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入搜索的订单状态" name="order.ostate" class="input" style="width:200px; line-height:17px;display:inline-block" />
          <input type="text" placeholder="请输入搜索的付款时间" name="order.date" onFocus="HS_setDate(this)" class="input" style="width:200px; line-height:17px;display:inline-block" />
          <input type="hidden" name="order.goods.userinfo" value="<s:property value="#session.cuser"/>"/>
          <input type="submit"  class="button border-main icon-search" value="搜索" ></li>
      </ul> --%>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>订单编号</th>
        <th>用户编号</th>
        <th>订单状态</th>
        <th>总价</th>
        <th>订单时间</th>
        <th width="310">操作</th>
      </tr>
      <c:forEach items="${list }" var="o">
        <tr>
          <td>${o.ono }</td>
          <td>${o.uid }</td>
          <td>${o.status }</td>
          <td>${o.zprice }</td>
          <td>${o.pubtime }</td>
          <td><div class="button-group">
          <c:if test="${o.status=='已支付' }">
          <a class="button border-main" href="orderQueRen.do?id=${o.kid }"><span class="icon-edit"></span> 确认订单</a>
          </c:if>
          <c:if test="${o.status=='待确认退货' }">
          <a class="button border-main" href="queRenTuiHuo.do?id=${o.kid }"><span class="icon-edit"></span> 确认退货</a>
           <a class="button border-main" href="juJue.do?id=${o.kid }"><span class="icon-edit"></span> 拒绝退货,已发货</a>
          </c:if>
         <a class="button border-main" href="showOrderDetail.do?id=${o.kid }"><span class="icon-edit"></span> 查看详情</a>
          </div></td>
        </tr>
       </c:forEach>
      <tr>
       <c:if test="${sessionScope.p==1 }">
		<td colspan="9"> <c:if test="${page.page>1}">
              <a href="ForderList.do?page=1" >首页</a>
             <a href="ForderList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="ForderList.do?page=${page.page+1 }">下一页</a>
			<a href="ForderList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="9"> <c:if test="${page.page>1}">
    <a href="vagueForderList.do?page=1" >首页</a>
    <a href="vagueForderList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueForderList.do?page=${page.page+1 }">下一页</a>
			<a href="vagueForderList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>