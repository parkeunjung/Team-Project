<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.2.min.js"></script>
<title>Mypage</title>
</head>
<body>
<div class="wrap">
 <jsp:include page="Share/Header.jsp"/>
	
	<div class="content">
		Mypage
		<div id="mypage_content">
			<div class="mypage_content">
			<a href="myinfo.jsp">MEMBERSHIP</a>
			</div>
			<br>
			<div class="mypage_content">
				<a href="mymovielist.jsp">My movie list</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="Share/footer.jsp" />
	

</body>
</html>