<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
%>


<%

	
	// 사용자 정보를 위한 변수 초기화
	String name = "";
	String birth = "";
	String debut = "";
	String award = "";
	String famous = "";
	String image = "";
%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화감독 쓰기</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
	<script src="../js/jquery-1.8.2.min.js"></script>
</head>
<body>
<div class="wrap">
	<div class="content">
	
 <div>
		  <form accept-charset="UTF-8" class="form-horizontal" action="directorRegister.jsp" method="post" enctype="multipart/form-data">
        <legend class="legend">영화감독 작성</legend>
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="name">감독명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"  name="name" value="<%=name%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="birth">출생</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="birth" value="<%=birth%>">
					</div>
				</div>

				<div class="form-group ">
					<label class="col-sm-2 control-label" for="debut">데뷔</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="debut" value="<%=debut%>">
					</div>
				</div>
				
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="award">수상</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="award" value="<%=award%>">
					</div>
				</div>
								
				<div class="form-group ">
					<label class="col-sm-2 control-label" for="famous">대표작</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="famous" value="<%=famous%>">
					</div>
				</div>
								
				<div class="form-group ">
					이미지 불러오기 <br/>
					<input type="file" name="image"/>
				</div>
				
				<div class="form-group">
					<a href="directorList.jsp" class="col-sm-offset-2 btn btn-default">목록으로</a>
						<input type="submit" class="btn btn-default btn-primary" value="등록">
				</div>
		  </form>
    </div>

	</div>
</div>
</body>
</html>