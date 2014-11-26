<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		%>
<%
	


	String userid = "";
	String name = "";
	String pwd = "";
	String email = "";
	

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signup</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="Share/Header.jsp"/>
  

 <div class="content">

	  <div>
		  <form class="form-horizontal" action="<%="register.jsp"%>" method="post">
			<fieldset>
			  	<input type='hidden' name='id' value='id'>
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="userid">ID</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="userid" value="<%=userid%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="name">Name</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="name" value="<%=name%>">
					</div>
				</div>

				
					<div class="form-group ">
						<label class="col-sm-2 control-label" for="pwd">Password</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" name="pwd">
						</div>
					</div>
	
					<div class="form-group ">
						<label class="col-sm-2 control-label" for="pwd_confirm">Password Confirmation</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" name="pwd_confirm">
						</div>
					</div>
			
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="email">E-mail</label>
					<div class="col-sm-3">
						<input type="email" class="form-control"  name="email" value="<%=email%>">
					</div>
				</div>

				


				<div class="form-group">
					
					
						<input type="submit" class="btn btn-default btn-primary" value="sign up">
					
				</div>
			</fieldset>
		  </form>
    </div>
  </div>
  	<jsp:include page="Share/footer.jsp" />
  
</div>
</body>
</html>