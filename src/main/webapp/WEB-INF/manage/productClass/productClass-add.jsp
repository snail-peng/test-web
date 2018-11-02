<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function-manage.js"></script>
<script type="text/javascript" src="scripts/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>添加分类</h2>
		<div class="manage">
			<s:form action="productCategoryAction_save" method="post" theme="simple" namespace="/productCategory">
				<s:hidden name="parentId"></s:hidden>
				<s:hidden name="type"></s:hidden>
				<table class="form">
					<tr>
						<td class="field">分类名称：</td>
						<td><s:textfield class="text"  name="name"></s:textfield></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><s:submit value="添加"></s:submit></label></td>
					</tr>
				</table>
			</s:form>
			<script>
				function insertCategory(){
					var parentId = ${param.parentId==null? 0:param.parentId };
					var type = ${param.parentType==null? 1:(param.parentType+1)};
					var data = $("#categoryForm").serialize();
					$.ajax({
						type:"post",
						url:"ProductCategoryServlet",
						data:"action=insertCategory&parentId="+parentId+"&type="+type+"&"+data,
						dataType:"text",
						success:function(msg){
							alert(msg);
							location.href="manage/productClass/productClass.jsp?csstype=4";
						}
					})
				}
			</script>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

