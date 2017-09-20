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

<title><s:message code="view-registration.lbl.view-registration" /></title>
</head>
<body>
	<div class="container">
		<div class="side-body page add-company-page">
			<div class="page-title">
				<div class="description">
					<ul class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/home"><s:message code="page-title.home" /></a></li>	
						<li><a href="<%=request.getContextPath()%>/admin/home"><s:message code="dashboard-title.home" /></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/registrations"><s:message code="admin-home.lbl.registrations" /></a></li>
						<li class="active">	<s:message code="view-registration.lbl.view-registration" />
						</li>
					</ul>
				</div>
			</div>
			<div><s:message code="common.lbl.login-as" />: <%=session.getAttribute("userlogin") %></div>			
		</div>
	</div>

	<div class="container">
		<h3 align="center"><s:message code="view-registration.lbl.view-registration" /></h3>
		<hr style="border: 1px solid blue;">
		
	 	<table class="table table-striped table-condensed">	 	
	 		<tr>
	 			<th><s:message code="view-registration.lbl.regisId" /></th>
	 			<td><c:out value="${registration.regisId }" /></td>
	 		</tr>
			<tr>
				<th><s:message code="view-registration.lbl.userId" /></th>
				<td>
					<c:out value="${registration.userId }" /> 
					<a href="#" target="_blank" id="userProfileSeeMore" 
							onclick="viewUserProfile(${registration.userId})">
							(<s:message code="common.lbl.seeMore"></s:message>)						
					</a>
				</td>		
			</tr>
			<tr>
				<th><s:message code="view-registration.lbl.sClassId" /></th>		
				<td>
					<c:out value="${registration.sClassId }" />
					<a href="#" target="_blank" id="classDetailSeeMore" 
							onclick="viewClassDetail(${registration.sClassId})">
							(<s:message code="common.lbl.seeMore"></s:message>)						
					</a>							
				</td>
			</tr>
			<tr>
				<th><s:message code="add-registration.lbl.regis-date" /></th>
				<td><c:out value="${registration.regisDate }" /></td>
			</tr>							
			<tr>
				<th><s:message code="view-user.lbl.lastUpdated" /></th>
				<td><c:out value="${registration.lastUpdated }" /></td>	
			</tr>
			<tr>	
				<th><s:message code="view-user.lbl.lastUpdatedBy" /></th>					
				<td><c:out value="${registration.lastUpdatedBy }" /></td>			
			</tr>			
	 	</table>
	</div>
	
	
<script>
function viewUserProfile(id) {
	var aSeeMore = document.getElementById("userProfileSeeMore");		
	var urlToBeViewed = "<%=request.getContextPath()%>" + "/admin/viewUserProfile/"+ id +"?lang="+ "${pageContext.response.locale}";		
	aSeeMore.href=urlToBeViewed;
}

function viewClassDetail(id) {
	var aSeeMore = document.getElementById("classDetailSeeMore");		
	var urlToBeViewed = "<%=request.getContextPath()%>" + "/admin/viewClassDetail/"+ id +"?lang="+ "${pageContext.response.locale}";		
	aSeeMore.href=urlToBeViewed;
}
</script>
	
</body>
</html>