<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script language="Javascript" type="text/javascript">
var obj = {
		apikey: "1498147838734fe59a8bce9b51ccc7d17fa6a53f",
		init : function(){
			obj.q = document.getElementById('query');
			obj.b = document.getElementById('button');
			obj.r = document.getElementById('result');
			obj.b.onclick = obj.pingSearch;
		},
	
	// 검색을 요청하는 함수 
	pingSearch : function(){
		if (obj.q.value) {
			obj.s = document.createElement('script');
			obj.s.type ='text/javascript';
			obj.s.charset ='utf-8';
			obj.s.src = 'http://apis.daum.net/contents/movie?apikey=' + obj.apikey + 
			'&result=1&output=json&callback=obj.pongSearch&q=' + encodeURI(obj.q.value);
			document.getElementsByTagName('head')[0].appendChild(obj.s);
		}
	},
		
	// 검색 결과를 뿌리는 함수 
	pongSearch : function(z){
		obj.r.innerHTML = '';
		for (var i = 0; i < z.channel.item.length; i++)	{
			var li = document.createElement('li');
			var a = document.createElement('a');
			var p = document.createElement('p');
			a.href = z.channel.item[i].link;
			a.innerHTML = obj.escapeHtml(z.channel.item[i].title);
			p.innerHTML =  obj.escapeHtml(z.channel.item[i].director);
			 
			li.appendChild(a);
			li.appendChild(p);
			obj.r.appendChild(li);
		}
	},

	// HTML태그 안 먹게 하는 함수
	escapeHtml : function(str) 	{
		str = str.replace(/&/g, "&");
		str = str.replace(/</g, "<");
		str = str.replace(/>/g, ">");
		return str;
	}
};
button.onclick = function() {
	obj.init();
	obj.pingSearch();
	alert("load");

};

</script>
</head>
<body>
  <div id="divSearch"> 
 	<form method="post"> 
   영화 검색 예제
    <input id="query" type="text"/>
    <input id="button" type="submit" value="검색"/>
  	</form>
  </div>
  <div id="result"></div>
</body>
</html>
		