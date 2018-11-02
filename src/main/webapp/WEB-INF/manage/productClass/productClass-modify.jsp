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
<script>
</script>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>修改分类</h2>
		<div class="manage">
			<s:form action="productCategoryAction_update" method="post" theme="simple" namespace="/productCategory">
				<s:hidden name="id"></s:hidden>
				<table class="form">
					<tr>
						<td class="field">分类名称：</td>
						<td><s:textfield class="text"  name="name"></s:textfield></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><s:submit value="修改"></s:submit></label></td>
					</tr>
				</table>
			</s:form>
			<script>
				function updateCategory(){
					var id = ${updateCategory.id };
					var data = $("#categoryForm").serialize();
					$.ajax({
						type:"post",
						url:"ProductCategoryServlet",
						data:"action=updateCategory&categoryId="+id+"&"+data,
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

