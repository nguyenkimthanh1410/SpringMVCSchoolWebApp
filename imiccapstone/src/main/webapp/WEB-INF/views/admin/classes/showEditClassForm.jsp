<%@ page contentType="text/html; charset=UTF-8" %>
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
 .error {
 	color: red;
 }
</style>
<body>
<div class="container">
	<div class="side-body page add-company-page">
		<div class="page-title">
			<div class="description">
				<ul class="breadcrumb">
					<li><a href="<%=request.getContextPath()%>/home"><s:message code="page-title.home" /></a></li>	
					<li><a href="<%=request.getContextPath()%>/admin/home"><s:message code="dashboard-title.home" /></a></li>
					<li><a href="<%=request.getContextPath()%>/admin/classes"><s:message code="admin-home.lbl.classes" /></a></li>					
					<li class="active"><s:message code="edit-class.lbl.edit-class" /></li>
				</ul>							
			</div>
			<div><s:message code="common.lbl.login-as" />: <%=session.getAttribute("userlogin") %></div>			
		</div>
		
		<!-- Form Edit Class -->
		<div>
			<h3 align="center"><s:message code="edit-class.lbl.edit-class" /></h3>
			<hr style="border: 1px solid blue;">
			<div class="card-body add-new-company-box">
				<sf:form commandName="sClass" method="post" >
				
					<section class="input-info-section">
					
						<div class="form-group row">
						
							<!-- Class ID -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="sClassId" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-class.lbl.sClassId" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div
									class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="sClassId" cssErrorClass="error" cssClass="form-control" readonly="true" />
									<sf:errors path="sClassId" cssErrorClass="error" cssClass="help-block" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>	

						<div class="form-group row">
						
							<!-- Class Name -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="sClassName" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-class.lbl.sClassName" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div
									class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="sClassName" cssErrorClass="error" cssClass="form-control" placeholder="" />
									<sf:errors path="sClassName" cssErrorClass="error" cssClass="help-block" />
								</div>
								<div class="clear-fix"></div>
							</div>
							
								<!-- Teacher id -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="selectedId"  class="control-label lbl-search">	
										<s:message code="view-class.lbl.teacherId" />
									</label> <span class="lbl-required">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:select path="teacherId" class="selectpicker form-control" 
											data-width="75%" data-style="btn-info" id="selectedId">
										<sf:options items="${teacherIds }" />										
									</sf:select>
									<a href="#" target="_blank" id="seeMore" onclick="viewBySelectedId()">								
										<s:message code="common.lbl.seeMore"></s:message>									
									</a>
								</div>
							</div>	
						</div>
							
						
						<div class="form-group row">	
											
							<!-- Start date -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="startDate" class="control-label lbl-search">
									 	<s:message code="view-class.lbl.startDate"></s:message>
									</label> <span class="lbl-required" style="margin-left: 0;">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class='input-group date' id='datetimepicker1'>
					                 	 <sf:input path="startDate" cssClass="form-control" id="dob" />
											<sf:errors path="startDate" cssClass="help-block" cssErrorClass="error" />                 
					                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					                     </span>
			                  		</div>
			                  	</div>	
			               	</div>						
								
							<!-- End date -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="endDate" class="control-label lbl-search">
									 	<s:message code="view-class.lbl.endDate"></s:message>
									</label> <span class="lbl-required" style="margin-left: 0;">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class='input-group date' id='datetimepicker2'>
					                 	 <sf:input path="endDate" cssClass="form-control" id="endDate" />
											<sf:errors path="endDate" cssClass="help-block" cssErrorClass="error" />                 
					                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					                     </span>
			                  		</div>
			                  	</div>						
							</div>
							<div class="clear-fix"></div>
						</div>
						
							
						<div class="form-group row">
												
							<!-- Last updated -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="lastUpdated" class="control-label lbl-search">
									 	<s:message code="view-user.lbl.lastUpdated"></s:message>
									</label> <span class="lbl-required" style="margin-left: 0;">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class='input-group date' id='datetimepicker3'>
					                 	 <sf:input path="lastUpdated" cssClass="form-control" id="lastUpdated" readonly="true" />
											<sf:errors path="lastUpdated" cssClass="help-block" cssErrorClass="error" />                 
					                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					                     </span>
			                  		</div>
			                  	</div>	
			               	</div>						
								
							<!--Last Updated by-->				
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="lastUpdatedBy" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-user.lbl.lastUpdatedBy" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="lastUpdatedBy" cssErrorClass="error" 
											cssClass="form-control" id="lastUpdatedBy" readonly="true" />
									<sf:errors path="lastUpdatedBy" cssClass="help-block" cssErrorClass="error"/>
								</div>
								<div class="clear-fix"></div>
							</div>
							<div class="clear-fix"></div>
						</div>	

					</section>
					
					<!-- Save or Cancel -->
					<div class="box-footer text-center">
						<button type="submit" class="btn btn-info">
							<s:message code="add-roles.btn.edit" />
						</button>
						
						<a href="<%=request.getContextPath()%>/admin/classes" 
									class="btn btn-info" style="background-color: grey">
									<s:message code="add-roles.btn.cancel" />
						</a>	
					</div>
					 <sf:errors path="*" cssClass="error" />
				</sf:form>
			</div>
		</div>		
	</div>	
</div>
	<script>
		 $(function () {
		      $('#datetimepicker1').datetimepicker();	
		      $('#datetimepicker2').datetimepicker();
		      $('#datetimepicker3').datetimepicker();
		 });
		 
		 function viewBySelectedId() {	
			var sElement = document.getElementById("selectedId");	
			var id = sElement.options[sElement.selectedIndex].value;
			/* alert(id); */
			var aSeeMore = document.getElementById("seeMore");								
			var urlToBeViewed = "<%=request.getContextPath()%>" + "/admin/viewUserProfile/"+ id +"?lang="+ "${pageContext.response.locale}";		
			aSeeMore.href=urlToBeViewed;			
		}	
		 
	</script>
</body>