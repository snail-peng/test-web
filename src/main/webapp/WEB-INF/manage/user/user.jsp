<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<script>
	function queryAllUser(pageNo){
		$.ajax({
			type:"post",
			url:"UserServlet",
			data:"action=queryAllUser&pageNo="+pageNo,
			dataType:"json",
			success:function(msg){
				var $table = $("#listTable");
				$table.html("");
				$table.append("<tr><th>ID</th><th>姓名</th><th>性别</th><th>Email</th><th>手机</th><th>操作</th></tr>");
				for(var i=0;i<msg.length-1;i++){
					$table.append("<tr><td class='first w4 c'>"+(i+1+(pageNo-1)*6)
					+"</td><td class='w1 c'>"+msg[i].name+"</td><td class='w2 c'>"+msg[i].sex+"</td><td>"+msg[i].email+"</td><td class='w4 c'>"+msg[i].mobile+"</td><td class='w1 c'><a href='UserServlet?action=getUserInfo&csstype=5&userId="+ msg[i].id +"'>修改</a> <a style='cursor:pointer;' onclick='deleteUser("+msg[i].id+","+pageNo+")'>删除</a></td></tr>");
				}
				var $pager = $("#pager");
				$pager.html("");
				
				if(pageNo>1){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllUser("+(pageNo-1)+")'>上一页</a></li>");
				}
				for(var i=0;i<msg[msg.length-1].totalPageCount;i++){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllUser("+(i+1)+")'>"+(i+1)+"</a></li>");
				}
				if(pageNo<parseInt(msg[msg.length-1].totalPageCount)){
					$pager.append("<li><a style='cursor:pointer;' onclick='queryAllUser("+(pageNo+1)+")'>下一页</a></li>");
				}
				$pager.find("li").each(function(){
					if($(this).find("a").html() == pageNo){
						$(this).find("a").css("color","blue");
					}
				})
			}
		})
	}
	
	function deleteUser(id,pageNo){
		if(confirm("确认要删除吗？")){
			$.ajax({
				type:"post",
				url:"UserServlet",
				data:"action=deleteUser&userId="+id,
				datatype:"text",
				success:function(msg){
					alert(msg);
					if(msg=="删除成功！"){
						queryAllUser(pageNo);
					}
				}
			})
		}
	}
	/*$(function(){
		queryAllUser(1);
	})*/
</script>
</head>
<body>

<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list" id="listTable">
				<tr><th>序号</th><th>姓名</th><th>性别</th><th>Email</th><th>手机</th><th>操作</th></tr>
				<s:iterator value="page.list" status="i">
					<tr>
						<td class='first w4 c'><s:property value="#i.index+1+6*(page.currPageNo-1)"/> </td>
						<td class='w1 c'><s:property value="loginName"/></td>
						<s:if test="sex==0">
							<td class='w2 c'>男</td>
						</s:if>
						<s:else><td class='w2 c'>女</td></s:else>
						<td><s:property value="email"/></td>
						<td class='w4 c'><s:property value="mobile"/></td>
						<td class='w1 c'>
							<shiro:hasPermission name="easybuy:user:edit">
								<s:a href="/user/userAction_modify.action?id=%{id }">修改</s:a> 
							</shiro:hasPermission>
							<shiro:hasPermission name="UserAction!delete.action">
								<s:a href="/user/userAction_delete.action?id=%{id }">删除</s:a>
							</shiro:hasPermission>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div class="pager">
			<ul class="clearfix" id="pager">
			<s:if test="page.currPageNo>1">
					<li><s:a href="/user/userAction_toList.action?pageNo=%{page.currPageNo-1}">上一页</s:a></li>
				</s:if>
				<s:iterator begin="1" end="page.totalPageCount" status="i">
					<li><s:a href="/user/userAction_toList.action?pageNo=%{#i.index+1}"><s:property value="#i.index+1"/></s:a></li>
				</s:iterator>
				<s:if test="page.currPageNo<page.totalPageCount">
					<li><s:a href="/user/userAction_toList.action?pageNo=%{page.currPageNo+1}">下一页</s:a></li>
				</s:if>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

