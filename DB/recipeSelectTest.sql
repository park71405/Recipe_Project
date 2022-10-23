select *
from recipe
where RCP_PAT2 = '밥'
order by RCP_SEQ desc;

select *
from recipe
where RCP_PAT2 like '%국%';

select * 
from recipe_process;

select 
			pro_no, rcp_seq, manual01, manual02, manual03, manual04, manual05, manual06, manual07, manual08, manual09, manual10,
			manual11, manual12, manual13, manual14, manual15, manual16, manual17, manual18, manual19, manual20, 
			manual_img01, manual_img02, manual_img03, manual_img04, manual_img05, manual_img06, manual_img07, manual_img08, manual_img09, manual_img10,
			manual_img11, manual_img12, manual_img13, manual_img14, manual_img15, manual_img16, manual_img17, manual_img18, manual_img19, manual_img20
		from recipe_process
		where  rcp_seq = 17;

select 
			parts_no, rcp_seq, rcp_pat_nm, rcp_pat_vl, rcp_pat_type
		from recipe_parts1
		where 
			rcp_seq = 17;
            
select *
from recipe
where rcp_seq = 17;
            

select rcp_pat_nm
from recipe_parts7;

select count(parts_no)
from recipe_parts2
where rcp_seq = 17;

select 
			no_no, no_title, no_content, no_date, mana_name
		from notice
		order by no_no desc;
        
insert into manager (MANA_NAME, MANA_ID, NAMA_PW)
value ("관리자1", "admin", 1234);

select *
from notice;

select count(ingre_no) from refri;

select * from user;


update user
set
	user_name = 'ha2',
    user_phone = '010-1234-1111',
    user_email = 'test@gamil.com'
where user_id = 'test2';

select * from refri;

insert into refri (ingre_NAME, ingre_type, ingre_capacity, user_name)
value ('양파', '채소', '3개' ,'hahaha');

insert into refri (ingre_NAME, ingre_type, ingre_capacity, user_name)
value ('삼겹살', '육류', '300g' ,'hahaha');

insert into refri (ingre_NAME, ingre_type, ingre_capacity, user_name)
value ('우유', '유제품', '100ml' ,'hahaha');

insert into review(rv_title, rv_content, user_name)
values('후기 테스트2', '후기테스트1', 'hahaha');

select * from qa;

insert into qa(qa_title, qa_content, user_name)
values('qa 테스트2', 'qa테스트1', 'hahaha');

select *
from refri
where ingre_type like "육류";

#가진 재료가 들어간 레시피 id
select *
from refri ingre join recipe_parts rcp
where rcp.rcp_pat_nm like concat('%',ingre.INGRE_NAME,'%');

#가진 재료가 들어간 레시피 id + 그 레시피에 가진 재료가 몇개 있는지
select rcp.rcp_seq, count(rcp_seq) as 'ingre_count'
from refri ingre join recipe_parts rcp
where rcp.rcp_pat_nm like concat('%',ingre.INGRE_NAME,'%')
group by rcp.rcp_seq 
having count(rcp.rcp_seq) >= 2;

#(가진 재료가 들어간 레시피 id + 그 레시피에 가진 재료가 몇개 있는지)와
#레시피 테이블을 조인해 레시피 정보 출력
select rcp.*, parts.ingre_count
from recipe rcp join (select rcp_p.rcp_seq, count(rcp_p.rcp_seq) as 'ingre_count'
	from refri refri_ingre join recipe_parts rcp_p
	where rcp_p.rcp_pat_nm like concat('%',refri_ingre.INGRE_NAME,'%')
	group by rcp_p.rcp_seq 
	having count(rcp_p.rcp_seq) >= 2) parts
where rcp.rcp_seq = parts.rcp_seq
order by parts.ingre_count desc;

####################################

select * from refri;
