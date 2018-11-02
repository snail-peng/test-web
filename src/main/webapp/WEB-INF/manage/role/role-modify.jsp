<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>修改角色权限</h2>
		<div class="manage">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<s:form id="funcForm" theme="simple" action="/role/roleAction_add.action" method="post">
			<s:hidden id="roleId" name="roleId"></s:hidden>
			<s:hidden id="funcIds" name="funcIds"></s:hidden>
			<label class="ui-blue"><input type="button" onclick="getFuncIds();" value="确认修改"/></label>
			<label class="ui-blue"><input type="button" onclick="cancel();" value="取消修改"/></label>
		</s:form>
	</div>
	<script type="text/javascript" src="scripts/ztree/jquery.ztree.all-3.5.min.js"></script>
	<script>
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId",
					rootPId: 0,
				}
			},
			check : {
	            enable : true
	        },
		  	view: {
				showLine: false,
				selectedMulti: false
			}
		}
		$(function(){
			$.ajax({
				type:"post",
				url:"/role/roleAction_funcList.action",
				data:"roleId="+$("#roleId").val(),
				dataType:"json",
				success:function(msg){
					$.fn.zTree.init($("#treeDemo"), setting, msg);
				}
			})
		})
		
		function cancel(){
			location.href = "/role/roleAction_toList.action";
		}
		
		function getFuncIds(){
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var str = "";
			for(var i=0;i<nodes.length;i++){
				str += nodes[i].id +",";
			}
			$("#funcIds").val(str);
			$("#funcForm").submit();
		}
	</script>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

