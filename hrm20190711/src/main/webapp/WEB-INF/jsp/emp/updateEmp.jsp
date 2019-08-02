<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>人事管理系统——添加员工</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />
    <link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
    <%--<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/engine.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/DwrService.js'></script>--%>
    <script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-1.8.3.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js'></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript">


        $(function(){

            // 图片异步上传
            $("#picForm").ajaxForm({
                url : "${pageContext.request.contextPath}/notice/uploadPic", // 请求URL
                type : "post",
                dataType : "text",
                async :true,
                success:function(imgUrl){
                    alert(imgUrl);
                    $("#logoImage").attr("src", "${pageContext.request.contextPath}" + imgUrl);
                    $("#newPicture").val(imgUrl);
                },
                error : function(){
                    alert("数据加载的失败！");
                }
            });

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

			/** 员工表单提交 */
			$("#empForm").submit(function(){
				var name = $("#name");
				var cardId = $("#cardId");
				var education = $("#education");
				var email = $("#email");
				var phone = $("#phone");
				var tel = $("#tel");
				var party = $("#party");
				var qqNum = $("#qqNum");
				var address = $("#address");
				var postCode = $("#postCode");
				var birthday = $("#birthday");
				var race = $("#race");
				var speciality = $("#speciality");
				var hobby = $("#hobby");
				var msg = "";
				if ($.trim(name.val()) == ""){
					msg = "姓名不能为空！";
					name.focus();
				}else if ($.trim(cardId.val()) == ""){
					msg = "身份证号码不能为空！";
					cardId.focus();
				}else if (!/^[1-9]\d{16}[0-9A-Za-z]$/.test($.trim(cardId.val()))){
					msg = "身份证号码格式不正确！";
					cardId.focus();
				}else if ($.trim(education.val()) == ""){
					msg = "学历不能为空！";
					education.focus();
				}else if ($.trim(email.val()) == ""){
					msg = "邮箱不能为空！";
					email.focus();
				}else if (!/^\w+@\w{2,3}\.\w{2,6}$/.test($.trim(email.val()))){
					msg = "邮箱格式不正确！";
					email.focus();
				}else if ($.trim(phone.val()) == ""){
					msg = "手机号码不能为空！";
					phone.focus();
				}else if (!/^1[3|5|8][0-9]\d{8}$/.test($.trim(phone.val()))){
					msg = "手机号码格式不正确！";
					phone.focus();
				}else if ($.trim(tel.val()) == ""){
					msg = "电话号码不能为空！";
					tel.focus();
				}else if (!/^0\d{2,3}-?\d{7,8}$/.test($.trim(tel.val()))){
					msg = "电话号码格式不正确！";
					tel.focus();
				}else if ($.trim(party.val()) == ""){
					msg = "政治面貌不能为空！";
					party.focus();
				}else if ($.trim(qqNum.val()) == ""){
					msg = "QQ号码不能为空！";
					qqNum.focus();
				}else if (!/^\d{6,}$/.test($.trim(qqNum.val()))){
					msg = "QQ号码格式不正确！";
					qqNum.focus();
				}else if ($.trim(address.val()) == ""){
					msg = "地址不能为空！";
					address.focus();
				}else if ($.trim(postCode.val()) == ""){
					msg = "邮政编码不能为空！";
					postCode.focus();
				}else if (!/^[1-9]\d{5}$/.test($.trim(postCode.val()))){
					msg = "邮政编码格式不正确！";
					postCode.focus();
				}else if ($.trim(birthday.val()) == ""){
					msg = "出生日期不能为空！";
					birthday.focus();
				}else if (!/^\d{4}-\d{2}-\d{2}$/.test($.trim(birthday.val()))){
					msg = "出生日期格式不正确！";
					birthday.focus();
				}else if ($.trim(race.val()) == ""){
					msg = "民族不能为空！";
					race.focus();
				}else if ($.trim(speciality.val()) == ""){
					msg = "专业不能为空！";
					speciality.focus();
				}else if ($.trim(hobby.val()) == ""){
					msg = "爱好不能为空！";
					hobby.focus();
				}
				if (msg != ""){
					alert(msg);
					return false;
				}else{
					return true;
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
	<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理  &gt; 修改员工</td>
	<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	<form theme="simple" action="/emp/updateEmp" id="empForm" method="post">
    	  <!-- 隐藏表单用来传员工的肖像URL -->
    	  <input type="hidden"  name="picture" value="${emp.picture}"/>
    	  <input type="hidden"  name="id" value="${emp.id}"/>
    	  <input type="hidden" name="newPicture" id="newPicture"/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
                <c:if test="tip != null">&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${tip }</font></c:if>
		    	<table>
		    		<tr><td rowspan="5">

		    				<img src="${pageContext.request.contextPath}${emp.picture}" width="139" height="147" id="logoImage"/>


		    		</td></tr>
		    		<tr>
		    			<td class="font3 fftd">姓名：<input type="text"  name="name" id="name" size="20" value="${emp.name}"/></td>
		    			<td class="font3 fftd">身份证号码：<input type="text" name="cardId" id="cardId" size="20" value="${emp.cardId}"/></td>
		    		</tr>
		    		<tr>

                        <td class="font3 fftd">性别:
                            <select name="sex" style="width:120px;">
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select></td>
						</td>
		    			<td class="font3 fftd">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：<select  name="job.id" id="jobId"></select></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">学历：<input type="text" value="${emp.education}" name="education" id="education" size="20"/></td>
		    			<td class="font3 fftd">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" value="${emp.email}" name="email" id="email" size="20"/></td>
		    		</tr>
		    		<tr>
		    			<td class="font3 fftd">手机：<input type="text" value="${emp.phone}" name="phone" id="phone" size="20"/></td>
		    			<td class="font3 fftd">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input type="text" name="tel" id="tel" size="20" value="${emp.tel}"/></td>
		    		</tr>
		    		<tr>
		    			<td width="135px" align="center">
		    				<%--<div style="width:70px;height:17px;background-image:url('${pageContext.request.contextPath}/images/bt_file.jpg');overflow:hidden;">
					    		<input type='file' id="image" onchange="changeFn();" style="filter:alpha(opacity=0);opacity:0.0;width:70px;height:17px;"/>
					    	</div>--%>
		    			</td>
		    		</tr>
		    	</table>
		    </td></tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					政治面貌：<input type="text" name="party" id="party" size="40" value="${emp.party}"/>&nbsp;&nbsp;
					QQ&nbsp;&nbsp;号码：<input type="text" name="qqNum" id="qqNum" size="20" value="${emp.qqNum}" />
				</td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					联系地址：<input type="text" name="address" id="address" size="40" value="${emp.address}"/>&nbsp;&nbsp;
					邮政编码：<input name="postCode" id="postCode" size="20" value="${emp.postCode}"/>
				</td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					出生日期：<input  type="text" cssClass="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
					name="birthday" id="birthday" size="40" value="${emp.birthday}"/>&nbsp;&nbsp;
					民&nbsp;&nbsp;&nbsp;&nbsp;族：<input type="text" value="${emp.race}" name="race" id="race" size="20"/>
				</td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					所学专业：<input type="text" value="${emp.speciality}"  name="speciality" id="speciality" size="40"/>&nbsp;&nbsp;
					爱&nbsp;&nbsp;&nbsp;&nbsp;好：<input type="text" value="${emp.hobby}" name="hobby" id="hobby" size="20"/>
				</td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					备&nbsp;&nbsp;&nbsp;&nbsp;注：<input type="text" value="${emp.remark}" name="remark" id="remark" size="40"/>
					&nbsp;&nbsp;所属部门：<select name="dept.id" style="width:120px;">
                    <option value="0">--部门选择--</option>
                    <c:forEach items="${depts}" var="dept">
                    <option value="${dept.id}">${dept.name}</option>
                    </c:forEach>
				</td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr><td align="left" class="fftd"><input type="submit" value="确定 ">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
		  </table>
	  	</form>

        <!-- 图片上传 -->
        <form method="post" theme="simple" id="picForm" enctype="multipart/form-data">
    <tr><td>
        <input type="file" name="file"  size="30"/><input type="submit" value="上传"/>
    </td></tr>
    </form>
	</td>
  </tr>
</table>

<div style="height:10px;"></div>
</body>
</html>