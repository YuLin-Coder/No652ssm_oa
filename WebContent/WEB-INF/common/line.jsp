<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>企业OA办公系统</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台管理系统HTML模板">
<meta name="description" content="基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="<%=path%>/resource/boot/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" href="<%=path%>/resource/static/favicon.ico">
<link rel="stylesheet"
	href="<%=path%>/resource/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/index.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/main.css">
<link rel="stylesheet"
	href="<%=path%>/resource/static/admin/css/html.css">
<script src="<%=path%>/resource/static/js/vue.min.js"></script>
<script src="<%=path%>/resource/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/resource/static/bootstrap/js/bootstrap.bundle.js"></script>
<script src="<%=path%>/resource/static/admin/js/config.js"></script>
<script src="<%=path%>/resource/static/admin/js/script.js"></script>
<script type="text/javascript"
	src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
.main {
	overflow-y: auto;
}

.info .card {
	min-height: 330px;
}

.user .card {
	min-height: 500px;
}

.card h5 {
	margin-bottom: 20px;
}

.main ul li {
	margin-bottom: 3px;
}
</style>
<!-- <style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style> -->
</head>
<nav>
	<div class="logo">
		<h4>企业OA办公系统</h4>
	</div>
	<ul class="menu">
		<li><a href="toMain"><i class="iconfont mr-1">&#xe6a2;</i>首页</a></li>
		<c:if test="${admin !=null }">
		
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">用户列表</a></li>
				<li><a href="toAddUser">添加用户</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
				<li><a href="toAddAttendance">去新增考勤记录</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
				<li><a href="toAddSupervise">去新督办记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
				<li><a href="toAddSalary">去新增工资记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6d4;</i>系统设置<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toUpdateAdminPassword">修改密码</a></li>
			</ul></li>

			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>数据统计<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="toEcharts">数据统计</a></li>
				</ul></li>
					<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a> 
		</li> 
		
		</c:if>
		
		<c:if test="${user !=null && user.state == '1'}">
		
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>个人信息管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="findMyInfo">个人信息</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
				<li><a href="toAddLeave">我要请假</a></li>
				<li><a href="LeaveMineList">我的请假</a></li>
			</ul></li>
			<li><a class="top-menu" href="javascript:;"><i
					class="iconfont mr-1">&#xe6ad;</i>数据统计<i
					class="iconfont arrow float-right">&#xe66c;</i></a>
				<ul class="sub-menu">
					<li><a href="toEcharts">数据统计</a></li>
				</ul></li>
		</c:if>
		
		
		<c:if test="${user !=null && user.state == '2'}">
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">用户列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
				<li><a href="toAddAttendance">去新增考勤记录</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
				<li><a href="toAddSupervise">去新督办记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
				<li><a href="toAddMeeting">去新增会议记录</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
				<li><a href="toAddLeave">我要请假</a></li>
				<li><a href="LeaveMineList">我的请假</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>数据统计<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toEcharts">数据统计</a></li>
			</ul></li>
		<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li>
		</c:if>
		
		
		
		
		<c:if test="${user !=null && user.state == '3'}">
		   <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>员工管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">员工列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
				<li><a href="toAddSalary">去新增工资记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
				<li><a href="toAddLeave">我要请假</a></li>
				<li><a href="LeaveMineList">我的请假</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>数据统计<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toEcharts">数据统计</a></li>
			</ul></li>
		<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li>
		</c:if>
		
	    
	    <c:if test="${user !=null && user.state == '4'}">
	      <!--  <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">用户列表</a></li>
			</ul></li> -->
			  <li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>个人信息管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="findMyInfo">个人信息</a></li>
			</ul></li>`
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>数据统计<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toEcharts">数据统计</a></li>
			</ul></li>
		<li><a href="toLoginOutAct"><i class="iconfont mr-1">&#xe68c;</i>退出登录</a>
		</li>
	    </c:if>
	
	<!-- 	<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e0;</i>用户管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="userList">用户列表</a></li>
				<li><a href="toAddUser">添加用户</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>考勤管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="AttendanceList">考勤列表</a></li>
				<li><a href="toAddAttendance">去新增考勤记录</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe69d;</i>督办管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SuperviseList">督办列表</a></li>
				<li><a href="toAddSupervise">去新督办记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>工资管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="SalaryList">工资列表</a></li>
				<li><a href="toAddSalary">去新增工资记录</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6e3;</i>会议管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="MeetingList">会议列表</a></li>
				<li><a href="toAddMeeting">去新增会议记录</a></li>
			</ul></li>
			
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>请假管理<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="LeaveList">请假列表</a></li>
				<li><a href="toAddLeave">我要请假</a></li>
				<li><a href="LeaveMineList">我的请假</a></li>
			</ul></li>
		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6d4;</i>系统设置<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toUpdateAdminPassword">修改密码</a></li>
			</ul></li>

		<li><a class="top-menu" href="javascript:;"><i
				class="iconfont mr-1">&#xe6ad;</i>数据统计<i
				class="iconfont arrow float-right">&#xe66c;</i></a>
			<ul class="sub-menu">
				<li><a href="toEcharts">数据统计</a></li>
			</ul></li>-->

	</ul>
</nav>