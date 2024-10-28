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
	content="width=device-width, Leave-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>请假列表</title>
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
							<form class="form-inline float-left" action="LeaveList"
								method="post">
								<div class="form-group">
									<input type="text" name="key" value="${key}"
										class="form-control" placeholder="请假人">
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="iconfont"></i>搜索
								</button>
							</form>


							<!-- <a class="btn btn-primary float-right" href="Leave_create.html"><i
								class="iconfont"></i>新增</a> -->
						</div>

						<div class="table-box">


							<table class="table">
								<thead>
									<tr>
										<th scope="col">请假发起人</th>
										<th scope="col">开始时间</th>
										<th scope="col">结束时间</th>
										<th scope="col">创建时间</th>
										<th scope="col">理由</th>
										<th scope="col">状态</th>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="data">
										<tr>
											<td>${data.uname }</td>
											<td>${data.starttime }</td>
											<td>${data.endtime }</td>
											<td>${data.createtime }</td>
											<td>${data.reason }</td>
											<td><c:if test="${data.state == '0' }">
											     待经理审批
											   </c:if> <c:if test="${data.state == '1' }">
											     经理拒绝
											   </c:if> <c:if test="${data.state == '2' }">
											     待财务审批
											   </c:if> <c:if test="${data.state == '3' }">
											    财务拒绝
											   </c:if> <c:if test="${data.state == '4' }">
											     待老板审批
											   </c:if>
											    <c:if test="${data.state == '5' }">
											     老板拒绝
											   </c:if>
											     <c:if test="${data.state == '6' }">
											     审批通过
											   </c:if>
											   </td>
											<td><input id="${data.id}" value="${data.id}"
												type="hidden" class="weui-input" /> 
												
												<a class="btn btn-info btn-sm detail" type="button"
														data-target="#detail" data-toggle="modal"
														>详情</a>
												<c:if
													test="${user!=null && user.state == '2' && data.state == '0'}">
													<a class="btn btn-info btn-sm sh" type="button"
														data-target="#myModal" data-toggle="modal"
														>审核</a>
												</c:if>
												<c:if
													test="${user!=null && user.state == '2' && data.state != '0'}">
													<a class="btn btn-success btn-sm " type="button">已审核</a>
												</c:if> 
												
												
												<c:if
													test="${user!=null && user.state == '3' && data.state == '2'}">
													<a class="btn btn-info btn-sm sh" type="button"
														data-target="#myModal" data-toggle="modal"
														>审核</a>
												</c:if>
												<c:if
													test="${user!=null && user.state == '3' && data.state != '2'}">
													<a class="btn btn-success btn-sm " type="button">已审核</a>
												</c:if> 
												
												
													
												<c:if
													test="${user!=null && user.state == '4' && data.state == '4'}">
													<a class="btn btn-info btn-sm sh" type="button"
														data-target="#myModal" data-toggle="modal"
														>审核</a>
												</c:if>
												<c:if
													test="${user!=null && user.state == '4' && data.state != '4'}">
													<a class="btn btn-success btn-sm " type="button">已审核</a>
												</c:if> 
												
												
												
												<c:if
													test="${user!=null && user.id == data.uid }">
													<a class="btn btn-primary btn-sm"
														href="toUpdateLeave?id=${data.id }">修改</a>
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
									href="LeaveList?currentPage=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li class="page-item"><a class="page-link"
										href="LeaveList?currentPage=${pageInfo.pageNum-1}">&lt;&lt;</a></li>
								</c:if>

								<c:if test="${pageInfo.hasNextPage }">
									<li class="page-item"><a class="page-link"
										href="LeaveList?currentPage=${pageInfo.pageNum+1}">&gt;&gt;</a></li>
								</c:if>
								<li class="page-item"><a class="page-link"
									href="LeaveList?currentPage=${pageInfo.pages}">尾页</a></li>
								<li style="margin-left: 10px; margin-top: 6px;" class="total float-left page-link">共<i
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
		aria-hidden="true" tabindex="-1" >
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h5 class="modal-title" id="myModallabel">请假审核</h5>
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
						<a class="btn btn-success aaa" type="button" >提交</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
		<div class="modal fade" id="detail" aria-labelledby="myModallabel"
		aria-hidden="true" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content" style="width:1000px">
				<div class="modal-header">
					
					<h5 class="modal-title" id="myModallabel">审核详情</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="table-box">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">审批人姓名</th>
										<th scope="col">审批人职位</th>
										<th scope="col">审批状态</th>
										<th scope="col">审批类型</th>
										<th scope="col">备注</th>
										<th scope="col">审批时间</th>
									</tr>
								</thead>
								<tbody id="recordList">
								</tbody>
							</table>
						</div>
				
			</div>
		</div>
	</div>
	
		


	<script>

    $('a.detail').click(function(e){
    	 var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
		 $('#recordList').html('');
     	  $.ajax({
			cache : true,
			type : "post",
			url : "selectLeaveRecordById",
			data : {"wid":id,"type":"1"},
			async : false,
			success : function(e) {
				if (e) {
					console.log(e);
					if(e.length== 0){
						 $('#recordList').append('<tr><td>暂无数据</td></tr>');
					}else{
						for(var i =0 ;i<e.length;i++){
							var state = "";
							var type = "";
							if(e[i].ustate == '2'){
								state = "经理"
							}else if(e[i].ustate == '3'){
								state = "财务"
							}else if(e[i].ustate == '4'){
								state = "老板"
							}
							if(type == '1'){
								type = "请假";
							}else{
								type = "会议";
							}
							var tr = "<tr>"+
									"<td>"+e[i].uname+"</td>"+
									"<td>"+state+"</td>"+
									"<td>"+e[i].state+"</td>"+
									"<td>"+type+"</td>"+
									"<td>"+e[i].remark+"</td>"+
									"<td>"+e[i].createtime+"</td>"+
									"</tr>";
							$('#recordList').append(tr);
						}
					}
					
				} else {
					alert("查询失败！");
				}
			}
		})
    }) 
   
   </script>
    
   <script>
	   $('a.del').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定删除吗?")){
			 		 　 $.ajax({
							url:"deleteLeave",
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
	
	</script>
	
	<script>
	    $('a.sh').click(function(e){
	    	 var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
	    	$("#wid").val(id);
	        $("#remark").val("");
	        $("#state").val("同意");
	    }) 
    
	
	   $('a.aaa').click(function(e){
		   var wid = $("#wid").val();
			  var remark = $("#remark").val();
			  var state = $("#state").val();
	           $.ajax({
				cache : true,
				type : "post",
				url : "applyLeave",
				data : {"wid":wid,"remark":remark,"state":state,"type":"1"},
				async : false,
				success : function(e) {
					if (e) {
						alert("审批成功！");
						window.parent.location.href = "LeaveList";
					} else {
						alert("审批失败！");
					}
				}
			})
	    }) 
	    
	</script>
</body>
</html>
