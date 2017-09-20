<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- CSS -->
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/css/lato.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/css/roboto-condensed.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/ionicons.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/animate.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/bootstrap-switch.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/lib/css/checkbox3.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/backend/css/themes/flat-blue.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/datetimepicker-4.17.37/css/datetimepicker.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">



<title><s:message code="view-user.lbl.view-user" /></title>
</head>
<body>
	<div class="container">
		<div class="side-body page add-company-page">
			<div class="page-title">
				<div class="description">
					<ul class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/home"><s:message code="page-title.home" /></a></li>

						<li><a href="<%=request.getContextPath()%>/admin/home"><s:message code="dashboard-title.home" /></a></li>

						<li><a href="<%=request.getContextPath()%>/admin/users.html"><s:message code="admin-home.lbl.users" /></a></li>	
						
						<li class="active"><s:message code="view-user.lbl.view-user" /></li>
					</ul>
				</div>
			</div>
			<div><s:message code="common.lbl.login-as" />: <%=session.getAttribute("userlogin") %></div>				
		</div>
	</div>
	
	

	<div class="container">
		<h3 align="center"><s:message	code="view-user.lbl.view-user" /></h3>
		<hr style="border: 1px solid blue;">
	 	<table class="table table-striped table-condensed">	 	
	 		<tr>
	 			<th><s:message code="list-all.lbl.id" /></th>
	 			<td><c:out value="${user.userId }" /></td>
	 		</tr>
			<tr>
				<th><s:message code="list-all.lbl.user-name" /></th>
				<td><c:out value="${user.userName }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.password" /></th>		
				<td><c:out value="${user.password }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.firstName" /></th>
				<td><c:out value="${user.firstName }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.lastName" /></th>
				<td><c:out value="${user.lastName }" /></td>
			</tr>					
			<tr>
				<th><s:message code="list-all.lbl.gender" /></th>
				<c:choose>
					<c:when test="${user.gender eq 0 }">
						<td><s:message code="common.lbl.female" /></td>
					</c:when>
					<c:otherwise>
						<td><s:message code="common.lbl.male" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>	
				<th><s:message code="list-all.lbl.dob" /></th>					
				<td><c:out value="${user.dob }"></c:out></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.status" /></th>
				<c:choose>
					<c:when test="${user.active eq 2}">
						<td><s:message code="common.lbl.inactive" /></td>
					</c:when>
					<c:otherwise>
						<td><s:message code="common.lbl.active" /></td>
					</c:otherwise>
				</c:choose>	
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.email" /></th>				
				<td><c:out value="${user.email }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.mobile" /></th>
				<td><c:out value="${user.mobile }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.address" /></th>
				<td><c:out value="${user.address }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.role" /></th>
				<c:choose>
					<c:when test="${user.role eq 1 }">
						<td><s:message code="common.lbl.admin" /></td>
					</c:when>
					<c:when test="${user.role eq 2 }">
						<td><s:message code="common.lbl.teacher" /></td>
					</c:when>
					<c:when test="${user.role eq 3 }">
						<td><s:message code="common.lbl.student" /></td>
					</c:when>
					<c:otherwise>
						<td><s:message code="common.lbl.guest" /></td>
					</c:otherwise>
				</c:choose>	
			</tr>	
			
			<tr>
				<th><s:message code="list-all.lbl.lastUpdated" /></th>
				<td><c:out value="${user.lastUpdated }" /></td>
			</tr>
			<tr>
				<th><s:message code="list-all.lbl.lastUpdatedBy" /></th>
				<td><c:out value="${user.lastUpdatedBy }" /></td>
			</tr>
			
	 	</table>
	</div>
	
	
<script>
 	function backToHome() {
 		var txt = "home.html?lang=";
 		var local = "${pageContext.response.locale}";
 		window.location.href = txt + local;
 	}
</script>
	
</body>
</html>