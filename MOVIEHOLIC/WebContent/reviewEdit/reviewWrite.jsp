<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>

<%
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/movieholic";
	String dbUser = "kbc13";;
	String dbPassword = "a12345";
	
	// 사용자 정보를 위한 변수 초기화
	String M_name = "";
	String C_name = "";
	String contents = "";
	String image="";

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}

	if (id > 0) {
		actionUrl = "reviewUpdate.jsp";
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			// 질의 준비
			stmt = conn
					.prepareStatement("SELECT * FROM users WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				M_name = rs.getString("M_name");			
				C_name = rs.getString("C_name");
				contents = rs.getString("contents");
				image = rs.getString("image");
			}
		} catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
		  if (rs != null) try{rs.close();} catch(SQLException e) {}
		  if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		  if (conn != null) try{conn.close();} catch(SQLException e) {}
		    }
	} else {
		actionUrl = "reviewRegister.jsp";
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWrite</title>

<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<div class="wrap">
		<style type="text/css">
#tab {
	border-collapse: collapse;
	border-spacing: 0;
}

td, th {
	border: 1px solid #444;
	font: 12px/18px "맑은 고딕", "Malgun Gothic";
	padding: 5px;
}

thead tr, tfoot tr {
	background: #888;
	color: #fff;
}

tbody tr {
	background: #EEE;
}

span.price {
	display: box;
	text-align: right;
	width: 200px;
	font-weight: bold;
}
</style>
		</head>

		<body>
			<div>
				<table id="tab" border="1">
					<thead>
						<tr>
							<th>영화이름</th>
							<th>평론가</th>
							<th>평론</th>
							<th>이미지</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
					</tbody>

					<tfoot>
					</tfoot>

				</table>
				<input type="button" value="평론추가" id="add">
			</div>

			<div id="row" style="display: none">
				<table>
					<tr>
						<td><input type="text" size='10' name="M_name" value="<%=M_name%>"></td>
						<td><input type="text" size='15' name="C_name" value="<%=C_name%>"></td>
						<td><input type="text" size='10' name="contents" value="<%=contents%>"></td>
						<td><input type="text" size='10' name="image" value="<%=image%>"></td>
						<td>
							<% if (id <= 0) { %> 
							<input type="submit" value="등록"> 
							<% } else { %>
							<input type="submit" value="수정"> 
							<% } %>
							<input type="submit" value="삭제">
						</td>
				</table>
			</div>
	</div>
</body>
</html>

<script type="text/javascript">
	$(function() {
		$('#add').click(
				function() {
					$('#tab').find("tbody").append(
							"<tr>" + $('#row').find('tr').html() + "</tr>");
				});

		$('#del').Click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$("tr input[type='checkbox']").each(function() {
					if ($(this).attr('checked')) {
						$(this).parents("tr").empty();
					}
				});
			}
		});
	});
</script>