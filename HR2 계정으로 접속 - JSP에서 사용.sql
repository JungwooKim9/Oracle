/* JSP ==> DB ==> guestboard(����) */

create table guestboard (
    name varchar2(100),
    email varchar2(100),
    inputdate varchar2(100),
    subject varchar2(100),
    content varchar2(100)
    );
    
    select * from guestboard;
    
    insert into guestboard (name, email, inputdate, subject, content)
    values('�����', 'aaa@aaa', '2023. 7. 6. ���� 3:55:46', 'ù ��° �� ����', 'ù ��° �� ����');
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
    
    insert into testboard (tname, tpass, temail, today, addr, sub, content)
    values('�����', '1234', 'aaa@aaa', '2023. 7. 6. ���� 6:03:46', '����', 'ù ��° �� ����', 'ù ��° �� ����');
    commit;