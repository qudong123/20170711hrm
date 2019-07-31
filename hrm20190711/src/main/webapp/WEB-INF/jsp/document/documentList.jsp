<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>人事管理系统 ——文档管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		function move(row) {
			row.style.backgroundColor = "#ebf0f5";
			row.style.cursor = "pointer";
		}
		function out(row) {
			row.style.backgroundColor = "#ffffff";
		}
		/** 删除文档 */
		var deleteFn = function(id){
			if (confirm('您确定要删除吗？')){
				window.location = "${pageContext.request.contextPath}/document/deleteDocument?id=" + id;
			}
		};
		/** 文档下载 */
		var downFn = function(id){
		    window.location = "${pageContext.request.contextPath}/document/downDocument?id=" + id;
		};
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：文档管理 &gt; 文档查询</td>
		<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	<form name="noticeform" method="post" id="noticeform" action="/document/selectDocument" theme="simple">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	文档标题：
					    	<input name="title"></input>
					    	<input type="submit" value="搜索"/>
					    </td>
					  </tr>
					</table>
				</form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit">
			  <td>编号</td>
			  <td>文档标题</td>
			  <td>备注</td>
			  <td>创建人</td>
			  <td>创建日期</td>
			  <td colspan="3" align="center">操作</td>
			</tr>

			  <c:forEach items="${documents}" var="document">
				  <tr class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
					  <td>${document.id}</td>
					  <td>${document.title}</td>
					  <td>${document.remark}</td>
					  <td>${document.user.name}</td>
					  <td>
						  <fmt:formatDate value="${document.createDate}"  pattern="yyyy-MM-dd HH:mm:ss" />
					  </td>
					  <td align="center"  width="40px;">
						  <a href="javascript:void(0);" onclick="downFn('${document.id}')">下载</a>
					  </td>
					  <td align="center" width="40px;"><a href="${pageContext.request.contextPath}/document/toUpdateDocument?id=${document.id}">
						  <img title="修改" src="${pageContext.request.contextPath}/images/update.gif"/></a>
					  </td>
					  <td align="center"  width="40px;">
						  <a href="javascript:void(0);" onclick="deleteFn('${document.id}');">
							  <img title="删除" src="${pageContext.request.contextPath}/images/delete.gif"/></a>
					  </td>
				  </tr>
			  </c:forEach>

		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
	  		<fkjava:pager pageIndex="${pageModel.pageIndex}" 
	  		              pageSize="${pageModel.pageSize}" 
	  		              recordCount="${pageModel.recordCount}" 
	  		              submitUrl="${pageContext.request.contextPath}/document/selectDocument/{0}.html?title=${title}"/>
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>