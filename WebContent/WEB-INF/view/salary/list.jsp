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
	content="width=device-width, Salary-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>工资列表</title>
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
							<form class="form-inline float-left" action="SalaryList"
								method="post">
								<div class="form-group">
									<input type="text" name="key" value="${key}"
										class="form-control" placeholder="工资员工姓名">
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="iconfont"></i>搜索
								</button>
							</form>


							<!-- <a class="btn btn-primary float-right" href="Salary_create.html"><i
								class="iconfont"></i>新增</a> -->
						</div>

						<div class="table-box">


							<table class="table">
								<thead>
									<tr>
										<th scope="col">姓名</th>
										<th scope="col">工作月份</th>
										<th scope="col">税前工资</th>
										<th scope="col">交税</th>
										<th scope="col">五险</th>
										<th scope="col">社保</th>
										<th scope="col">公积金</th>
										<th scope="col">补贴</th>
										<th scope="col">过节费</th>
										<th scope="col">加班工资</th>
										<th scope="col">实际工资</th>
										<th scope="col">录入时间</th>
										<th scope="col">状态</th>
										
										 <c:if test="${admin !=null || user.state == '3' ||  user.state == '4'}">
											        <th scope="col">操作</th>
										  </c:if>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="data">
										<tr>
											<td>${data.uname }</td>
											<td>${data.worktime }</td>
											<td>+${data.sqmoeny }</td>
											<td>-${data.jsmoney }</td>
											<td>-${data.wxmoney }</td>
											<td>-${data.sbmoney }</td>
											<td>-${data.gjjmoney }</td>
											<td>+${data.btmoney }</td>
											<td>+${data.gjmoeny }</td>
											<td>+${data.jbmoney }</td>
											<td>$${data.totalmoney }</td>
											<td>${data.createtime }</td>
											<td>
											  <c:if test="${data.type == '1' }">
											     待老板审核
											  </c:if>
											   <c:if test="${data.type == '2' }">
											     审核通过
											  </c:if>
											   <c:if test="${data.type == '3' }">
											     审核拒绝
											  </c:if>
											</td>
											<td><input id="${data.id}" value="${data.id}"
												type="hidden" class="weui-input" /> 
												
												<c:if test="${data.type == '1'  && user.state == '4'}">
											     <a class="btn btn-primary btn-sm agree"
													href="avascript:;">通过</a>
													<a class="btn btn-warning btn-sm refused"
													href="avascript:;">拒绝</a>  
											  </c:if>
											  
											  	<c:if test="${data.type != '1'  && user.state == '4'}">
											     <a class="btn btn-info btn-sm "
													>已审核</a>
											  </c:if>
											  
											  <c:if test="${admin !=null || user.state == '3' }">
											        	<a class="btn btn-primary btn-sm"
													href="toUpdateSalary?id=${data.id }">修改</a> <a class="btn btn-danger btn-sm del" 
													href="javascript:;">删除</a>
											     待老板审核
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
									href="SalaryList?currentPage=1">首页</a></li>
								<c:if test="${pageInfo.hasPreviousPage }">
									<li class="page-item"><a class="page-link"
										href="SalaryList?currentPage=${pageInfo.pageNum-1}">&lt;&lt;</a></li>
								</c:if>

								<!--  <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li> -->
								<c:if test="${pageInfo.hasNextPage }">
									<li class="page-item"><a class="page-link"
										href="SalaryList?currentPage=${pageInfo.pageNum+1}">&gt;&gt;</a></li>
								</c:if>
								<li class="page-item"><a class="page-link"
									href="SalaryList?currentPage=${pageInfo.pages}">尾页</a></li>
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
	<script>
	
	   $('a.del').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定删除吗?")){
			 		 　 $.ajax({
							url:"deleteSalary",
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
	
	   $('a.agree').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定通过吗?")){
			 		 　 $.ajax({
							url:"updateSalaryType",
						  	data:{"id": id,"type":"2"},
							type:"post",
							dataType:"json",
						  	success:function (data) {
							 	if (data) {
									alert("操作成功！");
									document.location.reload();//当前页面
							  	}else{
							  		alert("操作失败！");
							  	}
						 	}  
					 	}); 
			 		}

   		        })
	
	   $('a.refused').click(function(e) 
   		        {
   		            var id = $(e.currentTarget).parent().find('.weui-input').attr('id');
			   		if(confirm("确定拒绝吗?")){
			 		 　 $.ajax({
							url:"updateSalaryType",
						  	data:{"id": id,"type":"3"},
							type:"post",
							dataType:"json",
						  	success:function (data) {
						  		if (data) {
									alert("操作成功！");
									document.location.reload();//当前页面
							  	}else{
							  		alert("操作失败！");
							  	}
						 	}  
					 	}); 
			 		}

   		        })
	
	</script>
</body>
</html>
