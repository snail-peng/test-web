<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://wwww.syaccp.com"%>
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
<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>

</head>
<body>

<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<s:form action="orderAction_toList" namespace="/order" method="post" name="form1" theme="simple">
				
					开始时间：<input type="text" class="text" name="startTime" onclick="WdatePicker()" readonly="readonly" value="${param.startTime }"/>
					结束时间：<input type="text" class="text" name="endTime" onclick="WdatePicker()" readonly="readonly" value="${param.endTime }"/>
					<label class="ui-blue"><s:submit value="查询"></s:submit></label>
				</s:form>
			</div>
			<table class="list" id="listTable">
				<tr><th>序号</th><th>姓名</th><th>发货地址</th><th>状态</th><th>操作</th></tr>
				<s:iterator value="page.list" status="i">
					<tr>
						<td class="first w4 c"><s:property value="#i.index+1+6*(page.currPageNo-1)"/> </td>
						<td class="w1 c"><s:property value="user.userName"/></td>
						<td><s:property value="user.address"/></td>
						<td class='w1 c'>
							<s:if test="status==0">已下单</s:if>
							<s:elseif test="status==1">已审核</s:elseif>
							<s:elseif test="status==2">已配货</s:elseif>
							<s:elseif test="status==3">已发货</s:elseif>
							<s:else>已收货</s:else>
						</td>
						<td class="w1 c">
							<shiro:hasPermission name="order/OrderAction!get.action">
								<s:a href="/order/orderAction_modify.action?id=%{id}">详细</s:a> 
							</shiro:hasPermission>
							<shiro:hasPermission name="order/OrderAction!update0.action">
								<s:a href="/order/orderAction_update.action?id=%{id}&status=1">审核</s:a>
							</shiro:hasPermission>
							<shiro:hasPermission name="order/OrderAction!update1.action">
								<s:a href="/order/orderAction_update.action?id=%{id}&status=2">配货</s:a>
							</shiro:hasPermission>
							<shiro:hasPermission name="order/OrderAction!update2.action">
								<s:a href="/order/orderAction_update.action?id=%{id}&status=3">送货</s:a>
							</shiro:hasPermission>
						</td>
					</tr>
				</s:iterator>
			</table>
			<div class="pager">
				<ul class="clearfix" id="pager">
					<s:if test="page.currPageNo>1">
						<li><s:a href="/order/orderAction_toList.action?pageNo=%{page.currPageNo-1}">上一页</s:a></li>
					</s:if>
					<s:iterator begin="1" end="page.totalPageCount" status="i">
						<li><s:a href="/order/orderAction_toList.action?pageNo=%{#i.index+1}"><s:property value="#i.index+1"/></s:a></li>
					</s:iterator>
					<s:if test="page.currPageNo<page.totalPageCount">
						<li><s:a href="/order/orderAction_toList.action?pageNo=%{page.currPageNo+1}">下一页</s:a></li>
					</s:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

