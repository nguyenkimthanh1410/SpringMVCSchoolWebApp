<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<meta http-equiv="Expires" content="0" /> <!-- for search engine know to time to delete data in its db, come back to get value updated -->
<meta http-equiv="Cache-Control" content="no-cache" /> <!-- Whether page can be in cache of browser: public, private, no-cache, no-archive -->
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> <!-- responsive -->
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
<link rel="stylesheet" type="text/css"	href="http://localhost:8080/imiccapstone/bootstrap/datetimepicker-4.17.37/css/datetimepicker.css" />
<!-- JAVASCRIPTS -->
<script type="text/javascript"	src="https://code.jquery.com/jquery-1.12.1.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/Chart.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/bootstrap-switch.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/ace/ace.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/ace/mode-html.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/lib/js/ace/theme-github.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/js/app.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/js/index.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/backend/js/moment.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/bootbox.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/datetimepicker-4.17.37/js/moment_en-US.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/bootstrap/datetimepicker-4.17.37/js/datetimepicker.min.js"></script>
<!-- <script src="/backend/js/jquery.redirect.js"></script> -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">



<style> 
.ui-datepicker {
        z-index: 9999 !important;
    }
    
btn:hover {
     -webkit-transform: scale(1.1);
     -moz-transform: scale(1.1);
     -o-transform: scale(1.1);
 }
btn {
     -webkit-transform: scale(0.8);
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }
 
 ul li {
 	display: inline-block;
 	float: left;
 	margin-left: 15px;
 }
  .clear-float {
 	clear: both;
 }
</style>
<body>
	<div class="container">
	<div class="side-body page add-company-page">
		<div class="page-title">
			<div class="description">
				<ul class="breadcrumb">
					<li>
						<a href="<%=request.getContextPath()%>/home"><s:message code="page-title.home" /></a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/admin/home.html"><s:message code="dashboard-title.home" /></a>
					</li>
					<li class="active"><s:message code="admin-home.lbl.users" /></li>	
				</ul>			
			</div>			
		</div>		
		<div>
			<s:message code="common.lbl.login-as" />:<%=session.getAttribute("userlogin") %>
		</div>		
		<div class="clear-float"></div>
		<h3 align="center"><s:message code="admin-home.lbl.users" /></h3>	
	</div>	
	<hr style="border: 1px solid blue;">
	</div>
	<div class="container">	
	<!-- List All -->			
		<h2 style="float:right">
			<a href="<%=request.getContextPath()%>/admin/createUser" class="btn btn-primary a-btn-slide-text">
				 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				<span><strong><s:message code="add-user.lbl.add-user" /></strong></span>  
			</a>
		</h2>	

			
		<h3><s:message code="list-all.btn.list-all" /></h3>
		
		<table class="table table-striped table-condensed">
			<tr align="center">
				<th><s:message code="list-all.lbl.id" /></th>
				<th><s:message code="list-all.lbl.user-name" /></th>
				<th><s:message code="list-all.lbl.password" /></th>				
				<th><s:message code="list-all.lbl.firstName" /></th>
				<th><s:message code="list-all.lbl.lastName" /></th>
				<th><s:message code="list-all.lbl.gender" /></th>
				<th><s:message code="list-all.lbl.dob" /></th>
				<th><s:message code="list-all.lbl.status" /></th>
				<th><s:message code="list-all.lbl.email" /></th>
				<th><s:message code="list-all.lbl.mobile" /></th>
				<th><s:message code="list-all.lbl.address" /></th>
				<th><s:message code="list-all.lbl.role" /></th>
				<th><s:message code="list-all.lbl.lastUpdated" /></th>
				<th><s:message code="list-all.lbl.lastUpdatedBy" /></th>
				<th colspan="3"><s:message code="list-all.lbl.actions" /></th>		
			</tr>
			<c:forEach var="user" items="${users }">
				<tr>
					<td><c:out value="${user.userId }" /></td>
					<td><c:out value="${user.userName }" /></td>
					<td><c:out value="${user.password }" /></td>
					<td><c:out value="${user.firstName }" /></td>
					<td><c:out value="${user.lastName }" /></td>					
					
					<c:choose>
						<c:when test="${user.gender eq 0 }">
							<td><s:message code="common.lbl.female" /></td>
						</c:when>
						<c:otherwise>
							<td><s:message code="common.lbl.male" /></td>
						</c:otherwise>
					</c:choose>
										
					<td><c:out value="${user.dob }"></c:out></td>
					
					<!-- Active or Inactive -->
					<c:choose>
						<c:when test="${user.active eq 1}">
							<td><s:message code="common.lbl.inactive" /></td>
						</c:when>
						<c:otherwise>
							<td><s:message code="common.lbl.active" /></td>
						</c:otherwise>
					</c:choose>	
										
					<td><c:out value="${user.email }" /></td>
					<td><c:out value="${user.mobile }" /></td>
					<td><c:out value="${user.address }" /></td>
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
					<td><c:out value="${user.lastUpdated }" /></td>
					<td><c:out value="${user.lastUpdatedBy }" /></td>					
					
					<s:url value="/admin/viewUserProfile/{id}" var="urlView">
						<s:param name="id" value="${user.userId }"></s:param>
					</s:url>
			
					<td>
						<form action="${urlView }" method="get">
							<button type="submit" class="btn btn-primary a-btn-slide-text">
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
									<span><s:message code="list-all.lbl.view" /></span>
							</button>
						</form>
					</td>
											
					
					<s:url value="/admin/showEditUserForm/{id}" var="urlEdit">
						<s:param name="id" value="${user.userId }"></s:param>
					</s:url>
					<td>
						<form action="${urlEdit}" method="get">				
							<button type="submit" class="btn btn-primary a-btn-slide-text">
									<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									<span><s:message code="list-all.lbl.edit" /></span>
							</button>
						</form>
					</td>
									
					<td>
						<button type="submit" onclick="confirmDelete(${user.userId })" 
							class="btn btn-primary a-btn-slide-text">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							<span><s:message code="list-all.lbl.delete" /></span>
						</button>						
					</td>
				</tr>		
			</c:forEach>		
		</table>	
	</div>


		<!-- Bootstrap buttons(Add, View, Edit, Delete): https://bootsnipp.com/snippets/A2Mx5 -->
	
	<!-- JavaScript -->
	<script>		
		function confirmDelete(idValue) {
			var txt = "";
			var idSelected = idValue;
			var optionPicked = confirm("Are you sure to Delete id=" + idSelected);
		    if (optionPicked == true) {
		        txt = "You've pressed OK to confirm your decision!";
		        window.location.href="<%=request.getContextPath()%>" + "/admin/deleteUser/" + idSelected;		        
		    } else {
		        txt = "You pressed Cancel!";
		    }
			alert(txt);
		}
	</script>
</body>