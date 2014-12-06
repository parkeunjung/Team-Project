<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		%>
<%
		String errorMsg = null;
	
		String userPwd = (String)session.getAttribute("userPwd");
		String userId = (String)session.getAttribute("userId");
		String userid = "";
		String name = "";
		String pwd = "";
		String email = "";
		
		
	

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mypage</title>
	
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.8.2.min.js"></script>

</head>
<body>
<div class="wrap">
<jsp:include page="Share/Header.jsp"/>
  

 <div class="content">

	  
		  <form class="form-horizontal" action="<%="update.jsp"%>" method="post">
			  	
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="userid">ID</label>
					<div class="col-sm-3">
						<label ><%=userId %></label>
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
						<input type="submit" class="btn btn-default btn-primary" value="update">
				</div>
		  </form>
   
  </div>
  	
  
</div>
<jsp:include page="Share/footer.jsp" />
</body>
</html>