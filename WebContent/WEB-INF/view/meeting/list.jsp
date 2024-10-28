<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, Meeting-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>会议列表</title>
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
<script>
	$(function() {
		const hrefArr = window.location.href.split('/');
		const name = hrefArr[hrefArr.length - 1];
		$('.menu a[href=\'' + name + '\']').addClass('active');
	});
</script>
</head>
<body>

	<div id="app" class="d-flex">
		<jsp:include page="/WEB-INF/common/line.jsp" />
		<main>
			<jsp:include page="/WEB-INF/common/head.jsp" />
			<div id="body">
				<main>
					<div class="main">
						<div class="search">
							<form class="form-inline float-left" action="MeetingList"
								method="post">
								<div class="form-group">
									<input type="text" name="key" value="${key}"
										class="form-control" placeholder="会议标题">
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="iconfont"></i>搜索
								</button>
							</form>


							<!-- <a class="btn btn-primary float-right" href="Meeting_create.html"><i
								class="iconfont"></i>新增</a> -->
						</div>

						<div class="table-box">


							<table class="table">
								<thead>
									<tr>
										<th scope="col">会议发起人</th>
										<th scope="col">会议标题</th>
										<th scope="col">会议内容</th>
										<th scope="col">是否需要投影</th>
										<th scope="col">是否需要麦克风</th>
										<th scope="col">是否需要记录</th>
										<th scope="col">开始时间</th>
										<th scope="col">结束时间</th>
										<th scope="col">创建时间</th>
										<th scope="col">备注</th>
										<th scope="col">状态</th>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="data">
										<tr>
											<td>${data.uname }</td>
											<td>${data.title }</td>
											<td>${data.content }</td>
											<td>${data.isty }</td>
											<td>${data.ismkf }</td>
											<td>${data.isjl }</td>
											<td>${data.starttime }</td>
											<td>${data.endtime }</td>
											<td>${data.createtime }</td>
											<td>${data.remark }</td>
											<td><c:if test="${data.state == '0' }">
											     待财务审批
											   </c:if> <c:if test="${data.state == '1' }">
											     财务审批退回
											   </c:if> <c:if test="${data.state == '2' }">
											     财务审批通过，待老板审核
											   </c:if> <c:if test="${data.state == '3' }">
											     老板审批退回
											   </c:if> <c:if test="${data.state == '4' }">
											     审批通过
											   </c:if></td>
											<td><input id="${data.id}" value="${data.id}"
												type="hidden" class="weui-input" /> 
												
												<a class="btn btn-info btn-sm detail" type="button"
														data-target="#detail" data-toggle="modal"
														>详情</a>
												
												
												<c:if
													test="${user!=null && user.state == '3' && data.state == '0'}">
													<a class="btn btn-info btn-sm sh" type="button"
														data-target="#myModal" data-toggle="modal"
														>审核</a>
												</c:if>
												<c:if
													test="${user!=null && user.state == '3' && data.state != '0'}">
													<a class="btn btn-success btn-sm " type="button">已审核</a>
												</c:if> 
												
												
												<c:if
													test="${user!=null && user.state == '4' && data.state == '2'}">
													<a class="btn btn-info btn-sm sh" type="button"
														data-target="#myModal" data-toggle="modal"
														>审核</a>
												</c:if>
												<c:if
													test="${user!=null && user.state == '4' && data.state != '2'}">
													<a class="btn btn-success btn-sm " type="button">已审核</a>
												</c:if> 
												
												
												
												
												
												<c:if
													test="${user!=null && user.state == '2' }">
													<a class="btn btn-primary btn-sm"
														href="toUpdateMeeting?id=${data.id }">修改</a>
													<a class="btn btn-danger btn-sm del" href="javascript:;">删除</a>

												</c:if>
												
												</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

						<div class="page">
							<!-- 							<span class="total float-left page-link">共23223条</span>
 -->
							<ul class="pagination">
								<li class="page-item"><a class="page-link"
									href="MeetingList?currentPage=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li class="page-item"><a class="page-link"
										href="MeetingList?currentPage=${pageInfo.pageNum-1}">&lt;&lt;</a></li>
								</c:if>

								<!--  <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li> -->
								<c:if test="${pageInfo.hasNextPage }">
									<li class="page-item"><a class="page-link"
										href="MeetingList?currentPage=${pageInfo.pageNum+1}">&gt;&gt;</a></li>
								</c:if>
								<li class="page-item"><a class="page-link"
									href="MeetingList?currentPage=${pageInfo.pages}">尾页</a></li>
								<li style="margin-left: 10px; margin-top: 6px;">共<i
									class="blue">${pageInfo.total }</i>条记录，当前显示第<i class="blue">${pageInfo.pageNum }</i>页,&nbsp;
									总<i class="blue">${pageInfo.pages }</i>页
								</li>
							</ul>

						</div>
					</div>
				</main>
			</div>

		</main>
	</div>

	<div class="modal fade" id="myModal" aria-labelledby="myModallabel"
		aria-hidden="true" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="myModallabel">会议审核</h5>
				</div>
				<form id="formData" class="form-horizontal">
					<input type="hidden" id="wid" name="wid">
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-lg-4">审核结果：</label>
							<div class="col-lg-9">
								<select name="state" id="state" class="form-control">
									<option value="同意">同意</option>
									<option value="拒绝">拒绝</option>
								</select> </br>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">备注：</label>
							<div class="col-lg-9">
								<input type="text" name="remark" id="remark" class="form-control">
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
						<button class="btn btn-success" type="button" id="sh">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
		<div class="modal fade" id="detail" aria-labelledby="myModallabel"
		aria-hidden="true" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="myModallabel">审核详情</h5>
				</div>
				<form id="detailForm" class="form-horizontal">
					<div class="modal-body">
					<div class="form-group">
							<label class="control-label col-lg-4">审批人：</label>
							<div class="col-lg-9">
								<input type="text" name="cwxm" id="cwxm" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">财务审核结果：</label>
							<div class="col-lg-9">
								<input type="text" name="cw" id="cw" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">财务审核时间：</label>
							<div class="col-lg-9">
								<input type="text" name="cwsj" id="cwsj" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">财务备注：</label>
							<div class="col-lg-9">
								<input type="text" name="cwremark" id="cwremark" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">审批人：</label>
							<div class="col-lg-9">
								<input type="text" name="lbxm" id="lbxm" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">老板审核结果：</label>
							<div class="col-lg-9">
								<input type="text" name="lb" id="lb" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">老板审核时间：</label>
							<div class="col-lg-9">
								<input type="text" name="lbsj" id="lbsj" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-4">老板备注：</label>
							<div class="col-lg-9">
								<input type="text" name="lbremark" id="lbremark" class="form-control" readonly>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
	
    $('a.sh').click(function(e){
    	 var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
    	$("#wid").val(id);
        $("#remark").val("");
        $("#state").val("同意");
    }) 
    
	
    $('a.detail').click(function(e){
    	 var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			document.getElementById("detailForm").reset();
    	  $.ajax({
			cache : true,
			type : "post",
			url : "selectRecordById",
			data : {"wid":id,"type":"2"},
			async : false,
			success : function(e) {
				if (e) {
					console.log(e);
					if(e.length>0){
						$("#cw").val(e[0].state);
						$("#cwxm").val(e[0].uname);
						$("#cwsj").val(e[0].createtime);
						$("#cwremark").val(e[0].remark);
					}
					if(e.length>1){
						$("#lb").val(e[1].state);
						$("#lbxm").val(e[1].uname);
						$("#lbsj").val(e[1].createtime);
						$("#lbremark").val(e[1].remark);
					}
					
				} else {
					alert("查询失败！");
				}
			}
		})
    }) 
    
	   $('a.del').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定删除吗?")){
			 		 　 $.ajax({
							url:"deleteMeeting",
						  	data:{"id": id},
							type:"post",
							dataType:"json",
						  	success:function (data) {
							 	if (data) {
									alert("删除成功！");
									document.location.reload();//当前页面
							  	}else{
							  		alert("删除失败！");
							  	}
						 	}  
					 	}); 
			 		}

   		        })
	   $('#sh').click(function(e) {
					  var wid = $("#wid").val();
					  var remark = $("#remark").val();
					  var state = $("#state").val();
	  		           $.ajax({
						cache : true,
						type : "post",
						url : "applyMeet",
						data : {"wid":wid,"remark":remark,"state":state,"type":2},
						async : false,
						success : function(e) {
							if (e) {
								alert("审批成功！");
								window.parent.location.href = "MeetingList";
							} else {
								alert("审批失败！");
							}
						}
					})
	
	  		        })
	
	</script>
</body>
</html>
