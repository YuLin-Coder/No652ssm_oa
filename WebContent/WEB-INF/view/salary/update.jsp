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
	content="width=device-width, SalaryDate-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加工资</title>
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
							<h5>修改工资</h5>
						</div>
						<div class="form-box">
							<div class="row">
								<div class="col-5">
									<form id="saveForm">
									<input type="hidden" name="id" value="${SalaryDate.id }"> 
										<div class="form-group">
											<label>员工</label> <select name="uid" class="form-control">
												<c:forEach items="${userList}" var="data">
													<option value="${data.id}" <c:if test="${SalaryDate.uid == data.id}">selected</c:if> >${data.realName}</option>
												</c:forEach>
											</select> <small class="form-text text-muted"></small>
										</div>
									   <div class="form-group">
											<label>工作月份</label> 
											
											<input type="text" name="worktime" id="worktime" value="${SalaryDate.worktime }"  class="form-control" autocomplete="off"   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM'})"> 
												<small class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>税前工资</label> <input type="number" id="sqmoeny" name="sqmoeny" value="${SalaryDate.sqmoeny }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>税款</label> <input type="number" id="jsmoney" name="jsmoney" value="${SalaryDate.jsmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>五险</label> <input type="number" id="wxmoney" name="wxmoney" value="${SalaryDate.wxmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>社保</label> <input type="number" id="sbmoney" name="sbmoney" value="${SalaryDate.sbmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>公积金</label> <input type="number" id="gjjmoney" name="gjjmoney" value="${SalaryDate.gjjmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>补贴</label> <input type="number" id="btmoney" name="btmoney" value="${SalaryDate.btmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>过节费</label> <input type="number" id="gjmoeny" name="gjmoeny" value="${SalaryDate.gjmoeny }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>

										<div class="form-group">
											<label>加班工资</label> <input type="number" id="jbmoney" name="jbmoney" value="${SalaryDate.jbmoney }"
												class="form-control"> <small
												class="form-text text-muted"></small>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div class="submit-box">
							<button type="button" id="save" class="btn btn-primary">确定提交</button>
							<a type="button" href="SalaryList" class="btn btn-outline-secondary">返回</a>

						</div>
					</div>
				</main>
			</div>
		</main>
	</div>
	<script>
		$("#save").click(function() {
			

			var sqmoeny = $("#sqmoeny").val();
			var jsmoney = $("#jsmoney").val();
			var wxmoney = $("#wxmoney").val();
			var sbmoney = $("#sbmoney").val();
			var gjjmoney = $("#gjjmoney").val();
			var btmoney = $("#btmoney").val();
			var gjmoeny = $("#gjmoeny").val();
			var jbmoney = $("#jbmoney").val();
			if(sqmoeny == null || sqmoeny == ""){
				alert("税前工资不能为空");
				return false;
			}

			if(jsmoney == null || jsmoney == ""){
				alert("交税不能为空");
				return false;
			}

			if(wxmoney == null || wxmoney == ""){
				alert("五险不能为空");
				return false;
			}

			if(sbmoney == null || sbmoney == ""){
				alert("社保不能为空");
				return false;
			}

			if(gjjmoney == null || gjjmoney == ""){
				alert("公积金不能为空");
				return false;
			}

			
			if(btmoney == null || btmoney == ""){
				alert("补贴不能为空");
				return false;
			}

			if(gjmoeny == null || gjmoeny == ""){
				alert("过节费不能为空");
				return false;
			}
			if(jbmoney == null || jbmoney == ""){
				alert("加班工资不能为空");
				return false;
			}
			
			$.ajax({
				cache : true,
				type : "post",
				url : "updateSalary",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("修改成功！");
						window.parent.location.href = "SalaryList";
					} else {
						alert("修改失败！");
					}
				}
			})
		});
	</script>
</body>
</html>
