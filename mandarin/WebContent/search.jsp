<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="referrer" content="no-referrer" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/fontawesome.min.css">
<link rel="stylesheet" href="css/solid.min.css">
<link rel="stylesheet" href="css/toast.css">

<!-- 为了中间的一些script能使用 -->
<script src="js/jquery-3.3.1.slim.min.js"></script>

<script>
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();//大多数浏览器
		} catch (e) {
			try {
				return ActvieXObject("Msxml2.XMLHTTP");//IE6.0
			} catch (e) {
				try {
					return ActvieXObject("Microsoft.XMLHTTP");//IE5.5及更早版本	
				} catch (e) {
					alert("您的浏览器不支持!!");
					throw e;
				}
			}
		}
	}
	/*
	 * option对象有如下属性
	 */
	/*请求方式*///method, 
	/*请求的url*/// url, 
	/*是否异步*///asyn, 
	/*请求体*///params, 
	/*回调方法*///callback,
	/*服务器响应数据转换成什么类型*///type
	function ajax(option) {
		/*
		 * 1. 得到xmlHttp
		 */
		var xmlHttp = createXMLHttpRequest();
		/*
		 * 2. 打开连接
		 */
		if (option.asyn == undefined) {//默认为异步处理
			option.asyn = true;
		}
		xmlHttp.open("POST", option.url, option.asyn);
		/*
		 * 3. 判断是否为POST
		 */
		if ("POST" == option.method) {
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
		}
		/*
		 * 4. 发送请求
		 */
		xmlHttp.send(option.params);

		/*
		 * 5. 注册监听
		 */
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {//双重判断
				var data;
				// 获取服务器的响应数据，进行转换！
				if (!option.type) {//如果type没有赋值，那么默认为文本
					data = xmlHttp.responseText;
				} else if (option.type == "xml") {
					data = xmlHttp.responseXML;
				} else if (option.type == "text") {
					data = xmlHttp.responseText;
				} else if (option.type == "json") {
					var text = xmlHttp.responseText;
					data = eval("(" + text + ")");
				}

				// 调用回调方法
				option.callback(data);
			}
		};
	};
</script>

<title>Mandarin</title>
</head>
<body class="d-flex flex-column h-100">

	<div id="toast">
		<div id="desc"></div>
	</div>

	<header>
		<div class="container">
			<s:include value="navbar.jsp" />
		</div>
	</header>

	<main role="main" class="flex-shrink-0">
	<div class="container">
		<form class="m-3" action="reader-search">
			<div class="input-group mt-3">
				<select name="option" class="rounded-left btn-outline-primary">
					<option value="title">Book Title</option>
					<option value="author">Author</option>
					<option value="publisher">Publisher</option>
					<option value="isbn">ISBN</option>
				</select> <input type="text" name="searchContent"
					class="form-control mr-3 rounded-right"
					placeholder="Put some information here." aria-label="Search"
					autocomplete="off">
				<button class="btn btn-outline-primary" type="submit">Search</button>
			</div>
		</form>
		<div class="row">
			<nav class="col-md-10 offset-md-1 col-lg-3 offset-lg-0 sidebar">
				<div class="mt-3 ml-3 mb-3">
					<ul class="list-group flex-column">
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<li class="list-group-item"><button
								class="btn btn-outline-secondary" disabled>DISABLE</button></li>
						<!-- 分类检索 -->
					</ul>
				</div>
			</nav>
			<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">
				<div class="py-3 mr-3">
					<ul class="list-group">
						<s:iterator value="singleBook" status="L">
							<li class="list-group-item d-flex align-items-center">
								<div class="just-content-left mr-3">
									<img src="<s:property value="imgpath"></s:property>"
										height="80px">
								</div>
								<div class="container">
									<div class="row mb-2">
										<h4 data-toggle="tooltip" data-placement="right"
											data-html="true" title="<s:property value='description' />">
											<s:property value="title" />
										</h4>
									</div>
									<div class="row">
										<span class="badge badge-secondary mr-2"><s:property
												value="isbn" /></span> <span class="badge badge-primary mr-2"><s:property
												value="author" /></span> <span class="badge badge-primary mr-2"><s:property
												value="publisher" /></span> <span
											class="badge badge-secondary mr-2"><s:property
												value="location" /></span> <span class="badge badge-secondary"><s:property
												value="price" /></span>
									</div>
								</div>

								<div>
									<a class="btn btn-primary badge badge-primary badge-pill"
										data-toggle="collapse"
										href="#collapseExample<s:property value="#L.index+1"></s:property>"
										role="button" aria-expanded="false"
										aria-controls="collapseExample"><span
										class="badge badge-primary badge-pill">View Holding</span></a>
								</div>
							</li>
							<div class="collapse"
								id="collapseExample<s:property value="#L.index+1"></s:property>">
								<div class="card card-body">
									<!-- TODO: 完善book馆藏信息 -->
									<table class="table table-striped table-sm">
										<thead>
											<tr>
												<td>Location</td>
												<td>Borrowable</td>
												<td>Reservable</td>
												<td>Action</td>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="bookTable[#L.index]">
												<tr>
													<td><s:property value="location" /></td>
													<td><s:set var="borrowState" value="borrowState" /> <s:if
															test="borrowState == true">
															<i class="fas fa-ban" style="color: #c83025"></i>
														</s:if> <s:if test="borrowState == false">
															<i class="fas fa-check-circle" style="color: #51a351"></i>
														</s:if></td>
													<td><s:set var="reservationState"
															value="reservationState" /> <s:if
															test="reservationState == true">
															<i class="fas fa-ban" style="color: #c83025"></i>
														</s:if> <s:if test="reservationState == false">
															<i class="fas fa-check-circle" style="color: #51a351"></i>
														</s:if></td>
													<td>
														<!-- 用ajax就不用表单了 --> <!-- <form action="reserve" method="post"> -->
														<input type="hidden" name="id" id="id" value="<s:property value="id" />"> 
														<s:if test="reservationState == true">
															<button class="badge badge-secondary badge-pill" type="submit" disabled>reserve</button>
														</s:if> 
														<s:if test="reservationState == false">
															<button class="badge badge-primary badge-pill" type="submit" id="btn<s:property value="id"></s:property>">reserve</button>
														</s:if> <!-- </form> -->
													</td>
												</tr>
												<script>
													$(function() {
														$(
																'#btn<s:property value="id"></s:property>')
																.click(
																		function() {
																			var postdata = "id="
																					+ '<s:property value="id"></s:property>'; //document.getElementById("id").value
																			console
																					.log(postdata);
																			ajax({
																				method : 'POST',
																				url : '${pageContext.request.contextPath}/reserve',
																				params : postdata,
																				callback : function(
																						data) {
																					if (data == 1) {
																						alert("Reserve sucessfully");
																						location
																								.reload();
																					} else if (data == 0) {
																						alert("The book has been reserved")
																					} else {
																						alert("Please log in before proceeding");
																						window.location.href = "test-login.jsp"
																					}
																				}
																			})
																		})
													})
												</script>
											</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</main>

	<footer class="footer mt-auto">
		<div class="container text-center py-3"
			style="background-color: #f5f5f5">
			© 2019 <a href="http://www.nwpu.edu.cn/" target="_blank">NWPU</a>
			Mandarin-Library Automation
		</div>
	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	<script>
		function launch_toast() {
			var x = document.getElementById("toast")
			x.className = "show";
			var desc = document.getElementById("desc");
			desc.innerHTML = "<s:property value="errorMessage"></s:property>";
			setTimeout(function() {
				x.className = x.className.replace("show", "");
			}, 5000);
		};
		console.log("launch_toast defined");
		(function() {
			if ("<s:property value="errorMessage"></s:property>" == "") {
				console.log("no error");
			} else {
				launch_toast();
			}
		})();
	</script>
</body>
</html>