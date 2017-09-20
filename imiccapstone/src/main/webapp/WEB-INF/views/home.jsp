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
				<ul>
					<li class="active">
						<a href="#"><s:message code="page-title.home" /></a>
					</li>
					<li>
						<a href="login.html"><s:message	code="app-home.lbl.login" /></a>
					</li>
					<li>
						<a href="logout.html"><s:message	code="app-home.lbl.logout" /></a>
					</li>
				</ul>
			</div>
			<div class="description" style="float:right">
				Language (<a href="?lang=en">EN</a> | <a href="?lang=vi_VN">VN</a> )			
				Current Locale : ${pageContext.response.locale}
			</div>
		</div>
	</div>
	
	
	<div class="clear-float"></div>
	<div>
		<h5><s:message code="common.lbl.login-as" />: <%=session.getAttribute("userlogin") %></h5>
		<a href="processGoToUserPage">Go to your page</a> 
	</div>	
		
	<hr style="border: 1px solid blue;">	
	
	<div align="center">	
		<h2><s:message code="website.title" /></h2>
		<img alt="Spring in the air" src="<%="https://discoversdkcdn.azureedge.net/postscontent/spring/spring_9.jpg" %>">
		
		<%-- <img alt="Spring in the air" src="<%=request.getContextPath()%>/bootstrap/backend/test.png"> --%>
	</div>
</div>	
</body>