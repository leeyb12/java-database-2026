-- 1. 현재 반납되지 않은 책의 정보를 조회하시오. 
SELECT r.idx AS "회원번호"
	 , m.names AS "회원명"
	 , b.names AS "도서명"
	 , r.rentaldate AS "대여일"
  FROM RENTALTBL r, BOOKSTBL b, MEMBERTBL m
 WHERE r.bookidx  = b.idx
   AND r.memberidx = m.idx
   AND r.returndate IS NULL;
 

 -- 2. 각 분류별 도서 수를 조회하시오. 책이 한 권도 없는 분류도 포함하시오.
SELECT d.division    AS "분류코드"
     , d.names       AS "분류명"
     , (SELECT COUNT(*) 
          FROM BOOKSTBL b 
         WHERE b.division = d.division) AS "도서수" 
  FROM DIVTBL d
 ORDER BY d.division;
 
 
 -- 3. 대여 이력을 기준으로 가장 많이 대여된 책 순서대로 조회하시오.
SELECT b.idx     AS "책번호"
     , b.names   AS "책제목"
     , (SELECT COUNT(*) 
          FROM RENTALTBL r 
         WHERE r.bookidx = b.idx) AS "대여횟수"
  FROM BOOKSTBL b
 ORDER BY 대여횟수 DESC
 	    , b.idx ASC;
 
 
-- 4. 회원 중 총 대여 횟수가 1회 초과인 회원을 조회하시오.
SELECT m.idx   AS "회원번호"
     , m.names AS "회원명"
     , m.levels AS "등급"
     , (SELECT COUNT(*) 
          FROM RENTALTBL r 
         WHERE r.memberidx = m.idx) AS "대여횟수"
  FROM MEMBERTBL m
 WHERE (SELECT COUNT(*) 
          FROM RENTALTBL r 
         WHERE r.memberidx = m.idx) > 1   
 ORDER BY 대여횟수, m.names DESC;


-- 5. 대여일보다 반납일이 더 빠른 이상 데이터를 조회하시오.
SELECT r.idx AS "대여번호"
     , m.names AS "회원명"
     , b.names AS "책제목"
     , TO_CHAR(r.rentaldate, 'YYYY-MM-DD') AS "대여일"
     , TO_CHAR(r.returndate, 'YYYY-MM-DD') AS "반납일"
  FROM RENTALTBL r, MEMBERTBL m, BOOKSTBL b
 WHERE r.memberidx = m.idx
   AND r.bookidx   = b.idx
   AND r.returndate < r.rentaldate
 ORDER BY r.rentaldate;
 
