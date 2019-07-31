<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>人事管理系统 ——后台登录</title>
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
				if (window != parent){
					parent.location = window.location;
				}
				
				/** 为看不清楚绑定事件 */
				$("#see").click(function(){
					$("#vimg").attr("src", "${pageContext.request.contextPath}/verifycode?random1=" + Math.random());
				});
				/** 为验证码绑定事件 */
				$("#vimg").bind({
					mouseover : function(){
						$(this).css("cursor" ,"pointer");
					},
					click : function(){
						$("#see").trigger("click");
					}
				});
				/** 用户异步登录 */
				$("#loginBtn").click(function(){
					// 表单的输入较验
					var userId = $("#userId");
					var password = $("#password");
					var code = $("#code");
					var msg = "";
					if ($.trim(userId.val()) == ""){
						msg = "用户名不能为空！";
						// 获取到焦点
						userId.focus();
					}else if (!/^\w{5,20}$/.test($.trim(userId.val()))){
						msg = "用户名长度必须在5-20之间！";
						// 获取到焦点
						userId.focus();
					}else if ($.trim(password.val()) == ""){
						msg = "密码不能为空！";
						// 获取到焦点
						password.focus();
					}else if (!/^\w{6,20}$/.test($.trim(password.val()))){
						msg = "密码长度必须在6-20之间！";
						// 获取到焦点
						password.focus();
					}else if (!/^[a-zA-Z0-9]{4}$/.test($.trim(code.val()))){
						msg = "验证码格式不正确！";
						code.focus();
					}
					if (msg != ""){
						alert(msg);
					}else{
						// 发送异步登录请求
						$.ajax({
							url : "${pageContext.request.contextPath}/loginAjax", // 请求的URL
							type : "post", // 发送请求的类型
							dataType : "json", // 服务器响应的数据类型
							data : $("#loginForm").serialize(), // 请求参数 (serialize() : 可以把表单中的元素序列化成get请求格式的字符串)
							async : true, // 异步请求
							success : function(abc){  // 成功时回调的函数
								if(abc.flag == 0){
									window.location = "${pageContext.request.contextPath}/main";
								}else{
									alert(abc.tip);
									$("#see").trigger("click");
								}
							},
							error : function(){ // 失败时回调的函数
								alert("数据加载失败！");
							}
							
						});
					}
				});
			
				// 监听docuemnt的onkeydown事件看是不是按了回车键
				$(document).keydown(function(event){
					event = event ? event : window.event;
					if (event.keyCode === 13){
						$("#loginBtn").trigger("click");
					}
				});
			});
		</script>
	</head>
	<body background="images/9.png">
		<div class="log_black1"></div>
		<div id="showOrHide">
			<div id="login_main">
			  <div class="login_main_tab">
			    <div class="log_main_t_top"></div>
			    <div class="log_main_t_mid">
				  	<div class="log_black2"></div>
					<form  method="post" id="loginForm" >
					  <div class="log_input">用户名:<input type="text" id="userId" name="userId" value="admin" size="20" ></div>
					  <div class="log_input">密　码:<input type="password" id="password" value="123456" name="password" ></div>
					  <div class="log_input">
					  	<table><tr>
					  		<td style="font-size:12px; color:#296dcc;">
					  			验证码:<input type="text" style="margin-left:5px;width:35px;" id="code" name="code" maxlength="4"/>
					  		</td>
					  		<td>
					  			<img title="验证码" width="55" height="20" id="vimg" src="${pageContext.request.contextPath}/verifycode">
					  		</td>
					  		<td><a href="javascript:void(0);" onclick="return false;"  id="see">看不清楚</a></td>
					  	</tr></table>
					  </div>
					  
					  <div class="log_button"><input type="button" value="登 录" id="loginBtn" >&nbsp;&nbsp;
					  <input type="reset" value="重 置" ></div>
					</form>
				</div>
			    <div class="log_main_t_bottom"></div>
			  </div>
			</div>
		</div>
	</body>
</html>