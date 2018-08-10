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
<%-- <script src="js/pintuer.js"></script> --%>
<script charset="utf-8" src="/jianhuoshop/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/jianhuoshop/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/jianhuoshop/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/jianhuoshop/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updateGoods.do" enctype="multipart/form-data">  
     <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" size="18" name="name" data-validate="required:请输入名称" value="${jz.name }" />
          <input type="hidden" name="id"  value="${jz.id}" />
          <div class="tips"></div>
        </div>
      </div>
       
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <img alt="" src="../upload/${jz.img }" width="50" height="50">
          <input type="file" id="url1" name="file" class="input tips" style="width:25%; float:left;"  value="图片上传"  data-toggle="hover" data-place="right" data-image="" />
          
          <div class="tipss">图片尺寸：500*500</div>
        </div>
      </div>  
       <div class="form-group">
        <div class="label">
          <label>库存数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" size="18" name="kcnum" data-validate="required:请输入数量" value="${ jz.kcnum}"/>
          <div class="tips"></div>
        </div>
      </div>
        
       <div class="form-group">
        <div class="label">
          <label>所属类型：</label>
        </div>
        <div class="field" >
        <select name="fid" class="input w50" >
        <c:forEach items="${adlist }" var="ad">
        <c:if test="${ad.fid==jz.fid }">
        <option value="${ad.fid}">${ad.ftype }</option>
        </c:if>
          </c:forEach>
          <c:forEach items="${adlist }" var="ad">
        <c:if test="${ad.fid!=jz.fid }">
        <option value="${ad.fid}">${ad.ftype }</option>
        </c:if>
          </c:forEach>
        </select>
      
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" size="18" name="price" data-validate="required:请输入价格"  value="${jz.price }"/>
          <div class="tips"></div>
        </div>
      </div>
         <div class="form-group">
        <div class="label">
          <label>标签：</label>
        </div>
        <div class="field">
        <textarea rows="10" cols="60" name="mark" class="input w50" >${jz.mark }
        </textarea>
          <div class="tips"></div>
        </div>
      </div>
       
       <div class="form-group">
        <div class="label">
          <label>是否为特价：</label>
        </div>
        <div class="field" >
          <select name="tpstatus" class="input w50" >
        <option value="${jz.tpstatus }">${jz.tpstatus }</option>
        <option value="特价">特价</option>
        <option value="非特价">非特价</option>
        </select>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>是否推荐：</label>
        </div>
        <div class="field" >
          <select name="isshow" class="input w50" >
        <option value="${jz.isshow }">${jz.isshow }</option>
         <option value="推荐">推荐</option>
        <option value="非推荐">非推荐</option>
        </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
        <textarea id="editor_id"  name="miaoshu" style="width:800px;height:200px;" >${jz.miaoshu }</textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>