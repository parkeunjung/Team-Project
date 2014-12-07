<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.util.JSONBuilder" %>
<%@ page import="net.sf.json.JSONArray" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	//파라메터 설정

	//영화코드
	String movieCd = request.getParameter("movieCd")==null?"20149120":request.getParameter("movieCd");

	//발급키
	String key = "2953ce49650c4af87bfffc5e21bf13ee";
	// KOBIS 오픈 API Rest Client를 통해 호출 
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	//서비스 호출(boolean isJson, String movieCd)
	String movieInfoResponse = service.getMovieInfo(true,movieCd);
	
	//Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> movieInfoResult = mapper.readValue(movieInfoResponse,HashMap.class);
	
	request.setAttribute("movieInfoResult", movieInfoResult);
	
	//KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson,String comCode)
	String codeResponse = service.getComCodeList(true,"0105000000");
	HashMap<String,Object> codeResult = mapper.readValue(codeResponse,HashMap.class);
	request.setAttribute("codeResult", codeResult);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src=" http://www.kobis.or.kr/kobisopenapi/webservice/soap/movie" type="text/javascript"></script>

<title>Insert title here</title>

</head>
<body>
	<table border="1">
		<tr>
			<td>순위</td>
			<td>영화명</td> 	
			<td>개봉일</td>

		</tr>
		
	<c:if test="${not empty movieInfoResultList}">
	<c:forEach items="${movieInfoResultList}" var="movieinfo">
		<tr>
			<td><c:out value="${movieinfo.movieNm }"/></td>
			<td><c:out value="${movieinfo.prdtYear }"/></td>
			<td><c:out value="${movieinfo.directors}"/></td>

		</tr>	
	
	</c:forEach>
	</c:if>
	</table>
</body>
</html>