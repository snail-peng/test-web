<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理 - 易买网</title>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>角色管理</h2>
		<div class="manage">
			<table class="list" id="listTable">
				<tr><th>序号</th><th>角色名</th><th>操作</th></tr>
				<s:iterator value="list" status="i" var="role">
					<s:if test="#role.roleName!='管理员'">
						<tr>
							<td class='first w4 c'><s:property value="#i.index+1"/> </td>
								<td class='w1 c'><s:property value="roleName"/></td>
							<td class='w1 c'>
								<s:a href="/role/roleAction_toModify.action?roleId=%{id }">修改权限</s:a>
								<s:a href="/role/roleAction_delete.action?id=%{id }">删除</s:a>  
							</td>
						</tr>
					</s:if>
				</s:iterator>
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>