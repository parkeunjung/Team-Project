<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%

String M_name="";
String C_name="";
String content="";
String image ="";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWrite</title>

	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
</head>

<body>

	<div class="wrap">
			<div class="content">
				<form accept-charset="UTF-8" action="reviewRegister.jsp" method="post" enctype="multipart/form-data">
						<legend class="legend">평론가평 추가</legend><br>
						
				<div class="form-group ">
					<label  class="col-sm-2 control-label" for="M_name">영화이름</label>
					<div class="col-sm-3">
						<input  type="text" class="form-control" placeholder="영화이름을 입력해주세요" name="M_name" value="<%=M_name%>">
					</div>
				</div>

				<div class="form-group ">
					<label  class="col-sm-2 control-label" for="C_name">평론가명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="평론가명을 입력해주세요" name="C_name" value="<%=C_name%>">
					</div>
				</div>
				
				<div class="content_review ">
					<label  class="col-sm-2 control-label" for="content">내  용</label>
					<div class="col-sm-3">
						<textarea name="content" cols="30" rows="15"></textarea>
					</div>
				</div>
				<div class="form-group ">
					포스터 불러오기 <br/>
					<input type="file" name="image"/>
					<input type="submit" class="btn btn-default btn-primary" value="등록">
				</div>
				</form>
			
			
					<a href="reviewList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>
				
			
		</div>
	</div>
		



</body>
</html>
