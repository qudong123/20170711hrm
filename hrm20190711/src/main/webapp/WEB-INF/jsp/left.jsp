<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>人事管理系统 ——后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>
    <link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            // 获取功能主菜单
            $("td[id^='navbg']").click(function () {
                var menuId = this.id.replace("navbg", "submenu");
                var obj = $("#" + menuId);
                obj.css("display", obj.css("display") == "none" ? "" : "none");
                // 删除它所有class样式、并添加相应的样式
                $(this).removeClass().addClass(obj.css("display") == "none" ? "left_nav_closed" : "left_nav_expand");

                // 其它的子菜单
                $("tr[id^='submenu']").each(function () {
                    if (this.id != menuId) {
                        $(this.id.replace("submenu", "#navbg")).removeClass().addClass("left_nav_closed");
                        $(this).css("display", "none");
                    }
                });
            });
            $("a[href]").click(function (event) {
                // 取消默认的事件行为
                event.preventDefault();
                $("#mainFrame", parent.document).attr("src", this.href);
            });
        });
    </script>
</head>
<body>
<div style="margin:10px;background-color:#FFFFFF; text-align:left;">
    <table width="200" height="100%" border="0" cellpadding="0" cellspacing="0" class="left_nav_bg">
        <tr>
            <td class="left_nav_top">
                <div class="font1">用户管理</div>
            </td>
        </tr>
        <tr valign="top">
            <td class="left_nav_bgshw" height="50">
                <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/user/userList" target="mainFrame">用户查询</a></p>
                <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/user/toAddUser" target="mainFrame">添加用户</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg1" class="left_nav_closed">
                <div class="font1">部门管理</div>
            </td>
        </tr>
        <tr valign="top" id="submenu1" style="display: none">
            <td class="left_nav_bgshw" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/dept/deptList" target="mainFrame">部门查询</a></p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/dept/toAddDept" target="mainFrame">添加部门</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg2" class="left_nav_closed">
                <div class="font1">职位管理</div>
            </td>
        </tr>
        <tr valign="top" id="submenu2" style="display: none">
            <td class="left_nav_bgshw" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="job/jobList"
                                                                                             target="mainFrame">职位查询</a>
                </p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="job/toAddJob"
                                                                                             target="mainFrame">添加职位</a>
                </p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg3" class="left_nav_closed">
                <div class="font1">员工管理</div>
            </td>
        </tr>
        <tr valign="top" id="submenu3" style="display: none">
            <td class="left_nav_bgshw" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/emp/empList" target="mainFrame">员工查询</a></p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/emp/toAddEmp" target="mainFrame">添加员工</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg4" class="left_nav_closed">
                <div class="font1">公告管理</div>
            </td>
        </tr>
        <tr valign="top" id="submenu4" style="display: none">
            <td class="left_nav_bgshw tdbtmline" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/notice/noticeList" target="mainFrame">查询公告</a></p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/notice/toAddNotice" target="mainFrame">添加公告</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg5" class="left_nav_closed">
                <div class="font1">下载中心</div>
            </td>
        </tr>
        <tr valign="top" id="submenu5" style="display: none">
            <td class="left_nav_bgshw tdbtmline" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/document/documentList" target="mainFrame">下载文件</a></p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/document/toAddDocument" target="mainFrame">上传文件</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>

        <tr>
            <td id="navbg6" class="left_nav_closed">
                <div class="font1">黑名单管理</div>
            </td>
        </tr>
        <tr valign="top" id="submenu6" style="display: none">
            <td class="left_nav_bgshw tdbtmline" height="50">
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/document/documentList" target="mainFrame">下载文件</a></p>
                <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a
                        href="${pageContext.request.contextPath}/document/toAddDocument" target="mainFrame">上传文件</a></p>
            </td>
        </tr>
        <tr>
            <td height="2"></td>
        </tr>
        <tr valign="top">
            <td height="100%" align="center">
                <div class="copycct"><br/><strong>技术支持：</strong><br><strong>杭州上元</strong><br>Http://www.syedu</div>
            </td>
        </tr>
        <tr>
            <td height="10"><img src="images/left_nav_bottom.gif" height="10"></td>
        </tr>
        <tr>
            <td height="10" bgcolor="#e5f0ff">&nbsp;</td>
        </tr>
    </table>
</div>
</body>
</html>