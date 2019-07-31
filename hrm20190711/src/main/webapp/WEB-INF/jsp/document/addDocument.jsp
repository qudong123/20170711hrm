<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>人事管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
		<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			$(function(){
			
				// 文档提交
				$("#btn").click(function(){
					var title = $("#title");
					var remark = $("#remark");
					var msg = "";
					if ($.trim(title.val()) == ""){
						msg = "文档标题不能为空！";
						title.focus();
					}else if ($.trim(remark.val()) == ""){
						msg = "文档的备注不能为空！";
					}
				
					if (msg != ""){
						alert(msg);
					}else{
						$("#documentForm").submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			 <tr><td height="10"></td></tr>
			 <tr>
			    <td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locleft.gif" width="15" height="32"></td>
				<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：下载中心  &gt; 上传文件</td>
				<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
			 </tr>
		</table>
		
		<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">

				  	<!-- 表单 -->
				  	<form action="/document/addDocument" method="post" enctype="multipart/form-data" theme="simple" id="documentForm">
					    <tr><td class="font3 fftd">文档标题：<input  type="text" name="title" id="title" size="30" />
					    	</td>
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						<!-- 文档上传 -->
						<tr><td class="font3 fftd">
							上传文档：<input type="file" name="file"  size="30"/>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						
						<tr><td class="font3 fftd">文档备注：
							<input rows="8" cols="58" name="remark" id="remark"></input>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
						<tr><td class="font3 fftd">
								<input type="button" id="btn" value="确定">
								<input type="reset" value="重置">
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
					</form>

				  </table>
				</td>
		  	</tr>
		</table>
		<div style="height:10px;"></div>
	</body>
</html>