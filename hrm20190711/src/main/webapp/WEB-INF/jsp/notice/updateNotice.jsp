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
		<!-- TinyMCE -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/tiny_mce/tiny_mce.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript">
			tinyMCE.init({
				//mode : "textareas", // 附加模式: textareas(会把当前html页面上所有的textarea html元素全部附加上这个文件编辑器)
				mode : "exact", // exact: 要指elements : "textarea的元素id属性值",
				elements : "content", // textarea的元素id属性值
				theme : "advanced", // 主题: advanced、simple
				language : "zh-cn", // 语言: 国际化
				// 指定工具文件夹
				plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
		
				// 指定要显示的工具按钮
				theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
				theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
				theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
				theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
				// 指定工具按钮显示在上面(默认显示在下面)
				theme_advanced_toolbar_location : "top",
				// 指定工具按钮显示在左边(默认显示在中间)
				theme_advanced_toolbar_align : "left",
				// 指定是否显示状态栏(默认不显示)
				theme_advanced_statusbar_location : "bottom",
				// 是否可以拖动
				theme_advanced_resizing : true
			});
			
			$(function(){
				// 图片异步上传
				$("#picForm").ajaxForm({
					url : "${pageContext.request.contextPath}/notice/uploadPic", // 请求URL
					type : "post",
					dataType : "text",
					async :true,
					success:function(imgUrl){
						tinyMCE.execCommand('mceInsertContent',false,'<img src="${pageContext.request.contextPath}'+imgUrl+'" width="200px" height="200px"/>');
					},
					error : function(){
						alert("数据加载的失败！");
					}
				});
				
				// 公告提交
				$("#btn").click(function(){
					var title = $("#title");
					var content = tinyMCE.get('content').getContent();
					var msg = "";
					if ($.trim(title.val()) == ""){
						msg = "公告标题不能为空！";
						title.focus();
					}else if ($.trim(content) == ""){
						msg = "公告内容不能为空！";
					}
				
					if (msg != ""){
						alert(msg);
					}else{
						$("#noticeForm").submit();
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
				<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：公告管理  &gt; 修改公告</td>
				<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
			 </tr>
		</table>
		
		<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
				  	<!-- 表单 -->
				  	<form action="/notice/updateNotice" method="post" theme="simple" id="noticeForm">
				  		<!-- 修改时需要带的公告ID -->
				  		<input type="hidden" name="id" value="${notice.id}"/>
					    <tr><td class="font3 fftd">公告标题：<input name="title" id="title" size="30" value="${notice.title}" />
					    	</td>
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						
						<tr><td class="font3 fftd">公告内容：<br/>
							<textarea rows="11" cols="88" name="content" id="content">${notice.content}</textarea>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						<tr><td class="font3 fftd">
								<input type="button" id="btn" value="确定">
								<input type="reset" value="重置">
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
					</form>
						
					<!-- 图片上传 -->
					<form method="post" theme="simple" id="picForm" enctype="multipart/form-data">
						<tr><td>
							<input type="file" name="file"  size="30"/><input type="submit" value="上传"/>
						</td></tr>
					</form>
				  </table>
				</td>
		  	</tr>
		</table>
		<div style="height:10px;"></div>
	</body>
</html>