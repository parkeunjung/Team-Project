CREATE DATABASE movieholic DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON movieholic.* TO 'kbc13'@'localhost' IDENTIFIED BY 'a12345';

use movieholic;

CREATE TABLE directors (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(255) NOT NULL,
	birth VARCHAR(255) NOT NULL,
	debut VARCHAR(255) NOT NULL,
	award VARCHAR(255) NOT NULL,
	famous VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL
);

INSERT INTO directors VALUES ('봉준호', '1969년 9월 14일', '1994년 영화 '백색인'','2014년 제14회 디렉터스 컷 어워즈 올해의 감독상','설국열차, 마더, 괴물, 살인의 추억','Bong Joonho.PNG');
INSERT INTO directors VALUES ('김기덕', '1960년 12월 20일', '1996년 영화 '악어' 연출','2014년 제71회 베니스국제영화제 베니스데이즈 작품상 , 2013년 제4회 올해의 영화상 작품상','피에타, 나쁜 남자, 아리랑','Kim Kiduk.PNG');
INSERT INTO directors VALUES ('박찬욱', '1963년 8월 23일', '1992년 영화 '달은... 해가 꾸는 꿈' 감독',' 2011년 제61회 베를린영화제 단편영화부문 황금곰상','올드 보이, 친절한 금자씨, 공동경비구역 JSA, 박쥐','park ChanWook.PNG');
INSERT INTO directors VALUES ('임권택', '1936년 5월 2일', '1962년 영화 '두만강아 잘있거라'','2011년 제19회 인간상록수 문화 영화인부문','잡초, 만다라, 씨받이, 장군의 아들, 서편제','Lim Gwontaek.PNG');
INSERT INTO directors VALUES ('홍상수', '1960년', '1996년 영화 '돼지가 우물에 빠진 날' 연출','2014년 제34회 한국영화평론가협회상 최우수 작품상,2013년 제14회 부산영화평론가협회상 심사위원특별상','돼지가 우물에 빠진 날, 생활의 발견, 자유의 언덕','Hong Sangsoo.PNG');
INSERT INTO directors VALUES ('이창동', '1954년 4월 1일', '1993년 영화 '그 섬에 가고싶다' 조연출','2011년 제47회 백상예술대상 영화부문 감독상',' 초록물고기, 박하사탕, 오아시스, 밀양','Lee Changdong.PNG');
INSERT INTO directors VALUES ('스티븐 스필버그', '1946년 12월 18일', '1959년 영화 'The Last Gun' 연출',' 2013년 포브스 세계에서 가장 영향력 있는 유명인사 100인',' E.T, 쥬라기 공원, 죠스, 우주전쟁','Steven Spielberg.PNG');
INSERT INTO directors VALUES ('크리스토퍼 놀란', '1970년 7월 30일', '1998년 영화 '미행'','2011년 제16회 크리틱스 초이스 시상식 액션영화상',' 메멘토, 인셉션, 다크나이트, 인터스텔라','Christopher Nolan.PNG');
INSERT INTO directors VALUES ('마이클 베이', ' 1965년 2월 17일', '1995년 영화 '나쁜 녀석들'','클리오광고제 그랑프리클리오','나쁜 녀석들, 텍사스 전기톱 연쇄살인사건, 트랜스포머','Michael Bay.PNG');
INSERT INTO directors VALUES ('제임스 카메론', '1954년 8월 16일', '1978년 영화 '제노제네시스'','2011년 제34회 일본 아카데미상 우수 외국작품상, 2010년 그린 플래닛 영화 시상식 최우수 감독상','터미네이터, 타이타닉, 아바타','James Cameron.PNG');
