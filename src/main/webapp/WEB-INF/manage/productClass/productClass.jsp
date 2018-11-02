<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://wwww.syaccp.com" prefix="shiro" %>
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
<link type="text/css" rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="scripts/function-manage.js"></script>
<style>
	#chooseDiv label{
		display:none;text-align:center;cursor:pointer;
	}
	#chooseDiv a{
		color:white;text-decoration:none;display:inline-block;width:100%;height:100%;
	}
	#toModify,#toDelete{
		width:70px;
	}
	#toAdd{
		width:100px;
	}
</style>
</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<script type="text/javascript" src="scripts/ztree/jquery.ztree.all-3.5.min.js"></script>
	<script>
	function zTreeOnClick(event, treeId, treeNode){
		event.stopPropagation();
		
		$("#toModify a").attr("href","/productCategory/productCategoryAction_modify.action?id="+treeNode.id);
		$("#toModify").show();
		
		$("#toDelete a").attr("href","/productCategory/productCategoryAction_delete.action?id="+treeNode.id);
		$("#toDelete").show();
		
		if(treeNode.type != 3){
			$("#toAdd a").attr("href","/productCategory/productCategoryAction_toAdd.action?parentId="+treeNode.id+"&type="+treeNode.type);
			$("#toAdd").show();
		}else{
			$("#toAdd").hide();
		}
	}
	var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "parentId",
				rootPId: 0,
			}
		},
		/* check: {
	        enable: true
	    }, */
	  	view: {
			showIcon: true,
			showLine: false,
			selectedMulti: false
		},
		
		callback: {
	         onClick: zTreeOnClick
       }
	}
	$(function(){
		$.ajax({
			type:"post",
			url:"/productCategory/productCategoryAction_showList.action",
			dataType:"json",
			success:function(msg){
				$.fn.zTree.init($("#treeDemo"), setting, msg);
			}
		})
	})
</script>
	<div class="main">
		<h2>分类管理</h2>
		<div class="manage">
			<ul id="treeDemo" class="ztree"></ul>
			<%-- <table class="list" id="listTable">
				<tr><th>序号</th><th>分类名称</th><th>操作</th></tr>
				<s:iterator value="list" status="i">
					<tr>
						<td class='first w4 c'><s:property value="#i.index+1"/></td>
						<s:if test="type==1"><td><s:property value="name"/></td></s:if>
						<s:elseif test="type==2"><td class="childClass"><s:property value="name"/></td></s:elseif>
						<s:else><td class="childClass">&emsp;&emsp;&emsp;&emsp;&emsp;<s:property value="name"/></td></s:else>
						<td class='w1 c'>
							<s:a href="/productCategory/productCategoryAction_modify.action?id=%{id}">修改</s:a> 
							<s:a href="/productCategory/productCategoryAction_delete.action?id=%{id}">删除</s:a> 
							<s:if test="type!=3">
								<s:a href="/productCategory/productCategoryAction_toAdd.action?parentId=%{id}&type=%{type}">添加</s:a>
							</s:if>
						</td>
					</tr>
				</s:iterator>
			</table> --%>
			
		</div>
		<div id="chooseDiv">
			<shiro:hasPermission name="productcategory/ProductCategoryAction!update.action">
				<label class="ui-blue" id="toModify"><a href="" >修&emsp;改</a></label>
			</shiro:hasPermission>
			<shiro:hasPermission name="productcategory/ProductCategoryAction!delete.action">
				<label class="ui-blue" id="toDelete"><a href="" >删&emsp;除</a></label>
			</shiro:hasPermission>
			<shiro:hasPermission name="productcategory/ProductCategoryAction!save.action">
				<label class="ui-blue" id="toAdd"><a href="" >添加子级节点</a></label>
			</shiro:hasPermission>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

