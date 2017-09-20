<%@ page contentType="text/html; charset=UTF-8" import="imic.springmvc.util.*" %>
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
						<li><a href="<%=request.getContextPath()%>/admin/users.html"><s:message code="admin-home.lbl.users" /></a></li>	
						<li class="active"><s:message code="edit-user.lbl.edit-user" /></li>
				</ul>													
			</div>
			<div>
				<s:message code="common.lbl.login-as" />: <%=session.getAttribute("userlogin") %>
			</div>			
		</div>
		
		<h3 align="center"><s:message code="edit-user.lbl.edit-user" /></h3>
		<hr style="border: 1px solid blue;">
		
		<!-- Form Edit User -->
		<div>
			<div class="card-body add-new-company-box">
				<sf:form commandName="user" method="post" >
					<section class="input-info-section">
					
						<!-- User Id -->
						<div class="form-group row">						
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="userId" class="control-label lbl-search">
									 	<s:message code="list-all.lbl.id"></s:message>
									</label> 
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">									
					             	<sf:input path="userId" cssClass="form-control" id="userId" readonly="true"/>											
			                  	</div>
			                  </div>							
							  <div class="clear-fix"></div>
						</div>					

						<div class="form-group row">
						
							<!-- UserName -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="userName" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-user.lbl.user-name" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div
									class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="userName" cssErrorClass="error" cssClass="form-control" id="userName" readonly="true"/>
									<sf:errors path="userName" cssErrorClass="error" cssClass="help-block" />
								</div>
								<div class="clear-fix"></div>
							</div>
							
							<!-- Password -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<sf:label path="password" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-user.lbl.password" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:password path="password" cssErrorClass="error" cssClass="form-control" id="password" placeholder="" />
									<sf:errors path="password" cssErrorClass="error" cssClass="help-block" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>

					<div class="form-group row">
						
							<!-- First Name -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="userName" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-user.lbl.firstName" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="firstName" cssErrorClass="error" cssClass="form-control" id="firstName" placeholder="" />
									<sf:errors path="firstName" cssClass="help-block" cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
						
							<!-- Last Name -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<sf:label path="lastName" cssErrorClass="error" class="control-label lbl-search">
										<s:message code="view-user.lbl.lastName" />
									</sf:label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="lastName" cssErrorClass="error" cssClass="form-control"	id="lastName" placeholder="" />
									<sf:errors path="lastName" cssClass="help-block" cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>
						
						<div class="form-group row">						
							<!-- Date of Birth -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="dob" class="control-label lbl-search">
									 	<s:message code="view-user.lbl.dob"></s:message>
									</label> <span class="lbl-required" style="margin-left: 0;">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class='input-group date' id='datetimepicker1'>
					                 	 <sf:input path="dob" cssClass="form-control" id="dob" />
											<sf:errors path="dob" cssClass="help-block" cssErrorClass="error" />                 
					                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					                     </span>
			                  		</div>
			                  	</div>							
								
								<div class="clear-fix"></div>
							</div>
						</div>
					 	
					
						<div class="form-group row">
						
							<!-- Gender -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="gender" class="control-label lbl-search"> 
									<s:message	code="view-user.lbl.gender" /></label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class="radio3 radio-check radio-success radio-inline">
										<sf:radiobutton path="gender" value="1" id="radioNam" />
										<label for="radioNam"> 
											<s:message code="common.lbl.male" />
										</label>
									</div>
									<div class="radio3 radio-check radio-success radio-inline">
										<sf:radiobutton path="gender" value="0" id="radioNu" />
										<label for="radioNu"> 
											<s:message code="common.lbl.female" />
										</label>
									</div>
								</div>
								<div class="clear-fix"></div>
							</div>
							
							<!-- Email -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div
									class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<sf:label path="email" cssErrorClass="error" class="control-label lbl-search">
									 	<s:message code="view-user.lbl.email" />
									 </sf:label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="email" cssErrorClass="error" cssClass="form-control" id="email" placeholder="abc@gmail.com.vn" />
									<sf:errors path="email" cssClass="help-block"	cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>
						

						<div class="form-group row">
						
							<!-- Mobile -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<sf:label path="mobile" cssErrorClass="error" class="control-label lbl-search"> 
										<s:message	code="view-user.lbl.mobile" />
									</sf:label>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="mobile"  cssErrorClass="error" cssClass="form-control"  id="mobile" placeholder="" />
									<sf:errors path="mobile"  cssClass="help-block" cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
							
							<!-- Address -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<label for="address"  class="control-label lbl-search">	
										<s:message code="view-user.lbl.address" />
									</label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="address"  cssClass="form-control"  id="address"	placeholder="address" />
									<sf:errors path="address" cssClass="help-block" cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>
						
						<div class="form-group row">
						
							<!-- Role -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="role"  class="control-label lbl-search">	
										<s:message code="view-user.lbl.role" />
									</label> <span class="lbl-required">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:select path="role" class="selectpicker form-control" data-width="75%" data-style="btn-info">
										<%-- <sf:option value="${user.role }" label="${user.role }"></sf:option> --%>
										<sf:options items="${roles }" />										
									</sf:select>
									<span>
										<%=Integer.parseInt(StringPool.ADMIN_ROLE) %>:<s:message code="common.lbl.admin"/>,
										<%=Integer.parseInt(StringPool.TEACHER_ROLE) %>:<s:message code="common.lbl.teacher"/>,
										<%=Integer.parseInt(StringPool.STUDENT_ROLE) %>:<s:message code="common.lbl.student"/>,
										<%=Integer.parseInt(StringPool.GUEST_ROLE) %>:<s:message code="common.lbl.guest"/>										
									</span>
								</div>
							</div>	
								
							<!-- Status: Active or not -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<label for="status"  class="control-label lbl-search">	
										<s:message code="view-user.lbl.status" />									
									</label> <span class="lbl-required">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:select path="active" id="status" class="selectpicker form-control" data-width="75%" data-style="btn-info" >
										<sf:options items="${statusList }" />										
									</sf:select>
									<span>
										<%=Integer.parseInt(StringPool.STATUS_ACTIVE) %>:<s:message code="common.lbl.active" />
										<%=Integer.parseInt(StringPool.STATUS_INACTIVE) %>:<s:message code="common.lbl.inactive" />,
									 </span>
								</div>				
							</div>		
							<div class="clear-fix"></div>
						</div>
						
												
						<div class="form-group row">
						
							<!-- Last Updated -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 text-right col-full-width">
									<label for="lastUpdated" class="control-label lbl-search">
									 	<s:message code="view-user.lbl.lastUpdated"></s:message>
									</label> <span class="lbl-required" style="margin-left: 0;">*</span>
								</div>
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<div class='input-group date' id='datetimepicker2' >
					                 	 <sf:input path="lastUpdated" cssClass="form-control" id="lastUpdated" readonly="true"/>
											<sf:errors path="lastUpdated" cssClass="help-block" cssErrorClass="error" />                 
					                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					                     </span>
			                  		</div>	
			                  	</div>							
								<div class="clear-fix"></div>
							</div>
							
							<!-- Last Updated By -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right col-full-width">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right col-full-width">
									<label for="lastUpdatedBy"  class="control-label lbl-search">	
										<s:message code="view-user.lbl.lastUpdatedBy" />
									</label> <span class="lbl-required">*</span>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 text-left col-full-width">
									<sf:input path="lastUpdatedBy"  cssClass="form-control"  id="lastUpdatedBy" readonly="true" />
									<sf:errors path="lastUpdatedBy" cssClass="help-block" cssErrorClass="error" />
								</div>
								<div class="clear-fix"></div>
							</div>
						</div>
						
					</section>
					
					<!-- Save or Cancel -->
					<div class="box-footer text-center">
						<button type="submit" class="btn btn-info" style="width: 80px;">
							<s:message code="add-roles.btn.edit" />
						</button>
												
						<a href="<%=request.getContextPath()%>/admin/users" class="btn btn-info"  style="background-color: grey">
							<s:message code="add-roles.btn.cancel" />
						</a>					
					</div>
					
				</sf:form>
			</div>
		</div>		
	</div>	
</div>
	<script>
		 $(function () {
		      $('#datetimepicker1').datetimepicker();
		      $('#datetimepicker2').datetimepicker();
		 });		 
		 
	</script>
</body>