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
<script src="scripts/plupload/plupload.full.min.js"></script>

</head>
<body>
<%@ include file="/manage/common/head.jsp" %>
<div id="main" class="wrap">
	<%@ include file="/manage/common/left.jsp" %>
	<div class="main">
		<h2>添加商品</h2>
		<div class="manage">
			<s:form action="productAction_save" namespace="/product" theme="simple" method="post">
				<table class="form">
					<s:hidden id="saveName" name="fileName"></s:hidden>
					<tbody>
						<tr>
	 						<td class="field">商品名称：</td>
							<td><s:textfield name="name" class="text"></s:textfield> </td>
						</tr>
						<tr>
							<td class="field">商品描述：</td>
							<td><s:textfield name="description" class="text"></s:textfield></td>
						</tr>
						<tr>
							<td class="field">商品价格：</td>
							<td><s:textfield class="text tiny" name="price"></s:textfield>元</td>
						</tr>
						<tr>
							<td class="field">库存：</td>
							<td><s:textfield class="text tiny" name="stock"></s:textfield></td>
						</tr>
						<tr>
							<td class="field">1级分类：</td>
							<td>
								<s:select list="#{'0':'请选择' }" name="categoryLevel1Id"></s:select>
							</td>
						</tr>
						<tr>
							<td class="field">2级分类：</td>
							<td>
								<s:select list="#{'0':'请选择' }" name="categoryLevel2Id"></s:select>
							</td>
						</tr>
						<tr>
							<td class="field">3级分类：</td>
							<td>
								<s:select list="#{'0':'请选择' }" name="categoryLevel3Id"></s:select>
							</td>
						</tr>
						<tr id="result">
							<td class="field">商品图片：</td>
							<td>
								<img src="" style="width:100px;height:100px;"></img>
								<label class="ui-blue"><button id="browse">选择图片</button></label>
								<p id="progress" style="height: 4px;  line-height: 0px; background: orange; width: 0px;"></p>
								<span></span>
        					</td>
						</tr>
						<tr>
							<td></td>
							<td><label class="ui-blue"><s:submit value="添加"></s:submit></label></td>
						</tr>
					</tbody>
				</table>
			</s:form>
			<script>
				$(function(){
					$.ajax({
						type:"post",
						url:"/product/productAction_getCategory.action",
						data:"categoryParentId=0",
						dataType:"json",
						success:function(msg){
							var $type1 = $("select:eq(0)");
							$type1.empty();
							$type1.append("<option value='0'>请选择</option>");
							for(var i=0;i<msg.length;i++){
								$type1.append("<option value='"+msg[i].id+"'>"+msg[i].name+"</option>");
							}
						},error:function(){
							alert(1);
						}
					})
					$("select:not(:eq(2))").change(function(){
							var $obj = $(this);
							var $type = $obj.parent().parent().next().find("select");
							if($obj.val()!=0){
								$.ajax({
									type:"post",
									url:"/product/productAction_getCategory.action",
									data:"categoryParentId="+$obj.val(),
									dataType:"json",
									success:function(msg){
										if(msg.length>0){
											$type.empty();
											$type.append("<option value='0'>请选择</option>");
											for(var i=0;i<msg.length;i++){
												$type.append("<option value='"+msg[i].id+"'>"+msg[i].name+"</option>");
											}
										}
									},
									error:function(){
										alert(1);
									}
								})
							}else{
								$type.empty();
							}
						}
					)
				})
				function checkProductForm(){
					if($("#categoryLevel1Id").val()==0){
						alert("请选择商品分类！");
						return false;
					}
					return true;
				}
				
				var uploader = new plupload.Uploader({
					runtimes : 'html5,flash,silverlight',
					browse_button:"browse",
					url : "/product/productAction_uploadImg.action",
					multi_selection:false,
					flash_swf_url : "plupload/script/Moxie.swf", //swf文件，当需要使用swf方式进行上传时需要配置该参数
					silverlight_xap_url : "plupload/script/Moxie.xap", //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
					max_file_size : '5mb',
			        unique_names : true,//生成唯一文件名
			        filters : [ {
		                title : 'Image files',
		                extensions : 'jpg,gif,png'
		            }],
					init:{
						FilesAdded: function(up, files) {
							/* $.each(up.files, function (i, file) {
						        if (up.files.length <= 1) {
						            return;
						        }
						 
						        up.removeFile(file);
						    }); */
							uploader.start();
							return false;
						},
		                FileUploaded : function(up, file, info) { //文件上传完毕触发
		                	console.log("单独文件上传完毕");
		                    var response = $.parseJSON(info.response);
		                    if (response.status) {
		                        $("#result img").attr("src","images/product/" + response.saveName);
		                        $('#saveName').val(response.saveName);
		                        $('#result span').html("上传完毕>>>");
		                    }
		                },
		                UploadComplete : function( uploader,files ) {
		                	console.log("所有文件上传完毕");
		                },
		                UploadProgress : function( uploader,file ) {
		                	$("#progress").css('width',file.percent + '%');
		                }
					}
				})
				
				uploader.init();
			</script>	
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/manage/common/foot.jsp" %>
</body>
</html>

