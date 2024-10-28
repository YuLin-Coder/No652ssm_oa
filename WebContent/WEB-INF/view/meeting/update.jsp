<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, MeetingDate-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加会议</title>
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
	src="<%=path%>/resource/static/bootstrap/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="<%=path%>/resource/static/bootstrap/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<script  type="text/javascript" src="<%=path%>/resource/My97DatePicker/WdatePicker.js"></script>
	
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
<style>
iframe {
 width: 218px !important;
    height: 350px !important;
    position: absolute;
    z-index: 117;
    top: -97px !important;
    right: -500px !important;
    width: 100%;
    height: 100%;
    border: 0;
    padding-top: 60px;
}
</style>
</head>
<body>

	<div id="app" class="d-flex">
		<jsp:include page="/WEB-INF/common/line.jsp" />

		<main>
			<jsp:include page="/WEB-INF/common/head.jsp" />

			<div id="body">


				<main>
					<div class="main">

						<div class="title-box">
							<h5>修改会议</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									<input type="hidden" name="id" value="${MeetingDate.id }"> 
										<div class="form-group">
											<label>主题</label> <input type="text" name="title" value="${MeetingDate.title }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										<div class="form-group">
											<label>内容</label> <input type="text" name="content" value="${MeetingDate.content }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										<div class="form-group">
										   <label>是否需要投影</label> 
										   <select name="isty" class="form-control">
													<option value="是" <c:if test="${MeetingDate.isty == '是'}">selected</c:if>>是</option>
													<option value="否" <c:if test="${MeetingDate.isty == '否'}">selected</c:if>>否</option>
											</select> 
											<small class="form-text text-muted"></small>
										</div>
										<div class="form-group">
										   <label>是否需要麦克风</label> 
										   <select name="ismkf" class="form-control">
													<option value="是" <c:if test="${MeetingDate.ismkf == '是'}">selected</c:if>>是</option>
													<option value="否" <c:if test="${MeetingDate.ismkf == '否'}">selected</c:if>>否</option>
											</select> 
											<small class="form-text text-muted"></small>
										</div>
										<div class="form-group">
										   <label>是否需要记录</label> 
										   <select name="isjl" class="form-control">
													<option value="是" <c:if test="${MeetingDate.isjl == '是'}">selected</c:if>>是</option>
													<option value="否" <c:if test="${MeetingDate.isjl == '否'}">selected</c:if>>否</option>
											</select> 
											<small class="form-text text-muted"></small>
										</div>
									<div class="form-group">
											<label>会议开始时间</label> 
											
											<input type="text" name="starttime" id="starttime" value="${MeetingDate.starttime }"  class="form-control" autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endtime\')}'})"> 
												<small class="form-text text-muted"></small>
										</div>
									
										<div class="form-group">
											<label>会议结束时间</label> 
											
											<input type="text" name="endtime" id="endtime" value="${MeetingDate.endtime }"  class="form-control" autocomplete="off"   
											onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'starttime\')}'})"> 
												<small class="form-text text-muted"></small>
										</div>
									
									

										<div class="form-group">
											<label>备注</label> <input type="text" name="remark" value="${MeetingDate.remark }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
										
									</form>
								</div>
							</div>
						</div>

						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确定提交</button>
							<a type="button" href="MeetingList" class="btn btn-outline-secondary">返回</a>

						</div>
					</div>
				</main>
			</div>
		</main>
	</div>
	<script>
		$("#save").click(function() {
			$.ajax({
				cache : true,
				type : "post",
				url : "updateMeeting",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("修改成功！");
						window.parent.location.href = "MeetingList";
					} else {
						alert("修改失败！");
					}
				}
			})
		});
	</script>
</body>
</html>
