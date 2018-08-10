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
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updateBbs.do" >  
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea class="input"  style="width:600px;height:80px;" readonly="readonly">${bbs.note }</textarea>
        <input type="hidden" name="id" value="${bbs.id }">
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>回复内容：
          </label>
        </div>
        <div class="field">
          <textarea  class="input" name="note2" style="width:600px;height:80px;">${bbs.note2 }</textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">回复</button>
          
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>