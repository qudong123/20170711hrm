<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link href="css/css.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			 <tr><td height="10"></td></tr>
			 <tr>
			    <td width="15" height="32"><img src="images/main_locleft.gif" width="15" height="32"></td>
				<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：后台管理  &gt; 当前用户</td>
				<td width="15" height="32"><img src="images/main_locright.gif" width="15" height="32"></td>
			 </tr>
		</table>
		<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
				    <tr><td class="font3 fftd">用户姓名：<font color="red" size="2">${session_user.name}</font></td></tr>
					<tr><td class="main_tdbor"></td></tr>
					
					<tr><td class="font3 fftd">用户状态：
						<c:if test="${session_user.status=='0'}">
							<font color="blue" size="2">未审核</font>
						</c:if>
						<c:if test="${session_user.status!='0'}">
							<font color="red" size="2">已审核</font>
						</c:if>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>
					<tr><td class="font3 fftd">创建时间：<font color="red" size="2">
						<fmt:formatDate value="${session_user.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td></tr>
					<tr><td></td></tr>
				  </table>
				</td>
		  	</tr>
		</table>
		<div style="height:10px;"></div>
	</body>
</html>