/* JSP ==> DB ==> guestboard(방명록) */

create table guestboard (
    name varchar2(100),
    email varchar2(100),
    inputdate varchar2(100),
    subject varchar2(100),
    content varchar2(100)
    );
    
    select * from guestboard;
    
    select * from guestboard
    order by inputdate desc;

    commit;    
    
    insert into guestboard (name, email, inputdate, subject, content)
    values('김정우', 'bbb@bbb', '2023. 7. 7. 오전 11:46:46', '두 번째 글 제목', '두 번째 글 내용');
    commit;
    

create table testboard (
    tname varchar2(100),
    tpass varchar2(100),
    temail varchar2(100),
    today varchar2(100),
    addr varchar2(100),
    sub varchar2(100),
    content varchar2(100)
    );
    
    select * from testboard;
    
    commit;
    
    insert into testboard (tname, tpass, temail, today, addr, sub, content)
    values('김우정', '1234', 'aaa@aaa', '2023. 7. 6. 오후 6:03:46', '서울', '첫 번째 글 제목', '첫 번째 글 내용');
    commit;
    
    
    
    
    
    
    
    Create Table freeboard (
    id number constraint PK_freeboard_id Primary Key,   -- 게시글 번호
    name varchar2(100) not null, 
    password varchar2(100) not null, 		-- 자신의 글을 삭제시 
    email varchar2(100) null, 
    subject varchar2(100) not null, 		-- 제목
    content varchar2(2000) not null, 		-- 글내용
    inputdate varchar2(100) not null, 		-- 글쓴날짜
    -- 답변글을 처리하는 컬럼 
    masterid number default 0 , 
    readcount number default 0 , 			-- 글 조회수
    replaynum number default 0 , 
    step number default 0
); 

select * from freeboard
order by id desc;

select * from freeboard
where id = 876;

delete freeboard;      -- 테이블의 모든 레코드 삭제(10만건, 삭제 속도가 느림)
commit;

TRUNCATE table freeboard;   -- 테이블의 모든 레코드 삭제(10만건, 삭제 속도가 빠름)
-- TRUNCATE는 commit 안해도 상관 없음