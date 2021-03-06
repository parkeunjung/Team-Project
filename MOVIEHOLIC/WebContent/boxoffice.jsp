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
<%@ page import="java.util.*" %> 


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

Calendar calendar = new GregorianCalendar();
calendar.add(Calendar.DATE,-1);
String y= Integer.toString(calendar.get(calendar.YEAR));

int tempm=calendar.get((calendar.MONTH))+1;
String tempm2= (Integer.toString(calendar.get((calendar.MONTH))+1));
String m = tempm<10? "0"+tempm2 : tempm2;

int tempd=calendar.get((calendar.DAY_OF_MONTH));
String tempd2= (Integer.toString(calendar.get((calendar.DAY_OF_MONTH))));
String d= tempd<10? "0"+tempd2 : tempd2;
String yesterday = y+m+d;


//파라메터 설정
//조회일자
String targetDt = request.getParameter("targetDt")==null?yesterday:request.getParameter("targetDt");
//결과row수
String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
//"Y": 다양성 영화 "N": 상업영화(default:전체)
String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
//"K": 한국영화 "F":외국영화 (default)
String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
//"0105000000" 로서 조회된 지역코드
String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");

//발급키
String key = "2953ce49650c4af87bfffc5e21bf13ee";
// KOBIS 오픈 API Rest Client를 통해 호출 
KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

//일별 박스오피스 서비스 호출(boolean isJson, String targetDt, String itemPerPage
//			,String itemPerPage,String multiMoveYn,String repNationCd,String wideAreaCd)
String dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);

//Json 라이브러리를 통해 Handling
ObjectMapper mapper = new ObjectMapper();
HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse,HashMap.class);

request.setAttribute("dailyResult", dailyResult);

//KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson,String comCode)
String codeResponse = service.getComCodeList(true,"0105000000");
HashMap<String,Object> codeResult = mapper.readValue(codeResponse,HashMap.class);
request.setAttribute("codeResult", codeResult);


	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boxoffice</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script src=" http://www.kobis.or.kr/kobisopenapi/webservice/soap/boxoffice" type="text/javascript"></script>
	<script type="text/javascript" src='js/jquery-1.8.2.min.js'></script>
	<script type="text/javascript">
	
	</script>

</head>

<body>
<div class="wrap">
<jsp:include page="Share/Header.jsp"/>
	
	<div class="content">
		<table border="1" id="boxoffice">
			<tr id="attribute">
				<%=yesterday %>
				
				<td>순위</td>
				<td>영화명</td>
				<td>개봉일</td>
				<td>순위진입</td>
				<td>관객수</td>
			</tr>
		
		<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
		<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }" var="boxoffice">
			<tr id="result">
				<td><c:out value="${boxoffice.rank }"/></td>
				<td><c:out value="${boxoffice.movieNm }"/></td>
				<td><c:out value="${boxoffice.openDt }"/></td>
				<td><c:out value="${boxoffice.rankOldAndNew }"/></td>
				<td><c:out value="${boxoffice.audiCnt }"/></td>
			</tr>	
	
		</c:forEach>
		</c:if>
		</table>
	</div>

</div>
<jsp:include page="Share/footer.jsp" />


</body>
</html>