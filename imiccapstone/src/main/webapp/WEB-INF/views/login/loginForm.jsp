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
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/bootstrap/datetimepicker-4.17.37/css/datetimepicker.css" />
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


<title>	<s:message code="app-home.lbl.login" /></title>
<body>
<div class="container">
	<div class="card-body add-new-company-box">
		<a href="<%=request.getContextPath()%>/home"><s:message code="page-title.home" /></a>
	</div>
		

	<div class="card-body add-new-company-box">
		<h1 align="left"><s:message code="app-home.lbl.login" /></h1>
		<hr style="border: 1px solid blue;">
		
		<sf:form commandName="userIdentity" method="post" >
		
			<section class="input-info-section">					
					
				<div class="form-group row">
				
					<!-- User name-->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
						<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
							<sf:label path="userName" cssErrorClass="error" class="control-label lbl-search">
								<s:message code="list-all.lbl.user-name" />
							</sf:label> <span class="lbl-required">*</span>
						</div>
						<div
							class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
							<sf:input path="userName" cssErrorClass="error" cssClass="form-control"  />
							<sf:errors path="userName" cssErrorClass="error" cssClass="help-block" style="color: red;" />
						</div>
						<div class="clear-fix"></div>
					</div>
				</div>
		
				<div class="form-group row">
				
					<!--Password-->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
						<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
							<sf:label path="password" cssErrorClass="error" class="control-label lbl-search">
								<s:message code="list-all.lbl.password" />
							</sf:label> <span class="lbl-required">*</span>
						</div>
						<div
							class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
							<sf:input path="password" cssErrorClass="error" cssClass="form-control"  />
							<sf:errors path="password" cssErrorClass="error" cssClass="help-block" style="color: red;" />
						</div>
						<div class="clear-fix"></div>
					</div>
				</div>
			</section>
			
			<!-- Check or Cancel -->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
				<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
					<button type="submit" class="btn btn-info">
						<s:message code="app-home.lbl.login" />
					</button>
				</div>
				<div  class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
					<a href="<%=request.getContextPath()%>/home" class="btn btn-info" style="background-color: grey">
						<s:message code="add-roles.btn.cancel" />
					</a>	
				</div>
				<div class="clear-fix"></div>
			</div>
						
			 <sf:errors path="*" cssClass="error" />
			
		</sf:form>
	</div>
</div>

	
</body>
</html>