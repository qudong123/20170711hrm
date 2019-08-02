<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>人事管理系统 ——员工管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/job/loadJobAjax",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					$.each(data, function(){
						var option = $("<option/>").val(this.id).html(this.name);
						option.attr("selected", this.id == "${jobId}" ? true : false);
						option.appendTo("#jobId");
					});
				},
				error : function(){
					alert("数据加载失败！");
				}
			});
		});
		function move(row) {
			row.style.backgroundColor = "#ebf0f5";
			row.style.cursor = "pointer";
		}
		function out(row) {
			row.style.backgroundColor = "#ffffff";
		}
		/** 生成Excel文件 */
		function excelFn(){
			document.location = "${pageContext.request.contextPath}/employee/downExcel.html?jobId=${jobId}&name=${name}&phone=${phone}&cardId=${cardId}&sex=${sex}&deptId=${deptId}";
		};
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理 &gt; 员工查询</td>
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
			  	<form name="empform" method="post" id="empform" action="/employee/selectEmployee" theme="simple">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	职位：
					    	<select name="job.id" style="width:120px;" id="jobId">
					    		<option value="0">--请选择职位--</option>
					    	</select>
					    	姓名：<input name="name"/>
					    	身份证号码：<input name="cardId" maxLength="18"/>
					    </td>
					  </tr>
					  <tr>
					    <td class="font3">
							性别：
							<select name="sex" style="width:120px;">
								<option value="0">--请选择性别--</option>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>

					    	手机：<input name="phone"/>
					    	所属部门ID：
							<select name="dept.id" style="width:120px;">
								<option value="0">--部门选择--</option>
								<c:forEach items="${depts}" var="dept">
									<option value="${dept.id}">${dept.name}</option>
								</c:forEach>
							</select>

					    	<input type="submit" value="搜索"/>
					    	<input type="button" value="导出EXCEL" onclick="excelFn();"/>
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
			  <td>姓名</td>
			  <td>性别</td>
			  <td>手机号码</td>
			  <td>邮箱</td>
			  <td>职位</td>
			  <td>学历</td>
			  <td>身份证号码</td>
			  <td>部门</td>
			  <td>联系地址</td>
			  <td>创建日期</td>
			  <td colspan="2" align="center">操作</td>
			</tr>

			  <c:forEach items="${employees}" var="emp">
				  <tr class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
					  <td>${emp.id}</td>
					  <td>${emp.name}</td>
					  <td>
						  <c:choose>
							  <c:when test="${emp.sex == '1'}">
								  <font color="red">男</font>
							  </c:when>
							  <c:otherwise>
								  <font color="red">女</font>
							  </c:otherwise>
						  </c:choose>
					  </td>
					  <td>${emp.phone}</td>
					  <td>${emp.email}</td>
					  <td>
						  ${emp.job.name}
					  </td>
					  <td>${emp.education}</td>
					  <td>${emp.cardId}</td>
					  <td>${emp.dept.name}</td>
					  <td>${emp.address}</td>
					  <td>
						  <fmt:formatDate value="${emp.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					  </td>
					  <td align="center" width="40px;"><a href="${pageContext.request.contextPath}/emp/toUpdateEmp?id=${emp.id}">
						  <img title="修改" src="${pageContext.request.contextPath}/images/update.gif"/></a>
					  </td>
					  <td align="center"  width="40px;"><a href="${pageContext.request.contextPath}/emp/deleteEmp?id=${emp.id}" onclick="return confirm('您确定要删除吗？');">
						  <img title="删除" src="${pageContext.request.contextPath}/images/delete.gif"/></a>
					  </td>
				  </tr>

			  </c:forEach>

		  </table>
		</td>
	  </tr>
		<!-- 分页标签 -->
		<tr valign="top"><td align="center" class="font3">
		</td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>