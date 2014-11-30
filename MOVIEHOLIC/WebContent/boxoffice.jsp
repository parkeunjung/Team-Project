<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boxoffice</title>


	<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
	<script src=" http://www.kobis.or.kr/kobisopenapi/webservice/soap/boxoffice" type="text/javascript"></script>
	<script type="text/javascript" src='js/jquery-1.8.2.min.js'></script>
	<script type="text/javascript" src='js/boxoffice.js'>
	var svc = new KobisOpenAPIRestService("2953ce49650c4af87bfffc5e21bf13ee");
    var param = {
        key: "2953ce49650c4af87bfffc5e21bf13ee",
        targetDt: 20141130,   //문자열(필수)    조회하고자 하는 날짜를 yyyymmdd 형식으로 입력합니다.
        itemPerPage: 10,        //문자열   결과 ROW 의 개수를 지정합니다.(default : “10”, 최대 : “10“)
        multiMovieYn: "N",      //  문자열 다양성 영화/상업영화를 구분지어 조회할 수 있습니다.
        //“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
        repNationCd: "",        //문자열   한국/외국 영화별로 조회할 수 있습니다.
        //“K: : 한국영화 “F” : 외국영화 (default : 전체)
        wideAreaCd: ""         //문자열    상영지역별로 조회할 수 있으며, 지역코드는 공통코드 조회 서비스에서 “0105000000” 로서 조회된 지역코드입니다. (default : 전체)
    };

    var ret = svc.getDailyBoxOffice(true, param);
    var obj = jQuery.parseJSON(ret);
   	

	</script>
</head>

<body>
<div class="wrap">
<jsp:include page="Share/Header.jsp"/>
<div class="content">
	<form name="myform" method="get" >
		<input type ="submit" value="나와라">
	</form>
	<textarea name="result" col="80" rows="15">

	</textarea>

</div>

</div>
<jsp:include page="Share/footer.jsp" />


</body>
</html>