create
or replace
view `booksearch` as select
	left(`i`.`book_code`,
	8) as `book_code`,
	`b`.`title` as `title`,
	`b`.`author` as `author`,
	`b`.`translator` as `translator`,
	`b`.`price` as `price`,
	`b`.`image` as `image`,
	`p`.`pub_name` as `pub_name`,
	left(`i`.`rental_date`,
	7) as `rental_date`,
	`b`.`cate_b_no` as `cate_b_no`,
	`b`.`cate_m_no` as `cate_m_no`,
	`b`.`cate_s_no` as `cate_s_no`,
	`cb`.`cate_b_name` as `cate_b_name`,
	`cm`.`cate_m_name` as `cate_m_name`,
	`cs`.`cate_s_name` as `cate_s_name`
from
	`book_rental_info` `i`
join `book` `b` on
	`i`.`book_code` = `b`.`book_code`
join `publisher` `p` on
	`b`.`pub_no` = `p`.`pub_no`
join `category_b` `cb` on
	`cb`.`cate_b_no` = `b`.`cate_b_no`
join `category_m` `cm` on
	`cm`.`cate_m_no` = `b`.`cate_m_no`
	and `b`.`cate_b_no` = `cm`.`cate_b_no`
join `category_s` `cs` on
	`cs`.`cate_s_no` = `b`.`cate_s_no`
	and `b`.`cate_m_no` = `cs`.`cate_m_no`
	and `b`.`cate_s_no` = `cs`.`cate_b_no` ;

select*from booksearch 
where book_code ='2220000101';


create
or replace
view `bookdetail` as select
	`b`.`book_code` as `book_code`,
	`b`.`title` as `title`,
	`b`.`author` as `author`,
	`b`.`translator` as `translator`,
	`b`.`price` as `price`,
	`b`.`image` as `image`,
	`b`.`rental_possible` as `rental_possible`,
	`b`.`pub_no` as `pub_no`,
	`p`.`pub_name` as `pub_name`,
	`b`.`cate_b_no` as `cate_b_no`,
	`b`.`cate_m_no` as `cate_m_no`,
	`b`.`cate_s_no` as `cate_s_no`,
	`cb`.`cate_b_name` as `cate_b_name`,
	`cm`.`cate_m_name` as `cate_m_name`,
	`cs`.`cate_s_name` as `cate_s_name`
from
	`book` `b`
left join `publisher` `p` on
	`b`.`pub_no` = `p`.`pub_no`
left join `category_b` `cb` on
	`cb`.`cate_b_no` = `b`.`cate_b_no`
left join `category_m` `cm` on
	`cm`.`cate_m_no` = `b`.`cate_m_no`
	and `b`.`cate_b_no` = `cm`.`cate_b_no`
left join `category_s` `cs` on
	`cs`.`cate_s_no` = `b`.`cate_s_no`
	and `b`.`cate_m_no` = `cs`.`cate_m_no`
	and `b`.`cate_s_no` = `cs`.`cate_b_no` ;
	
select*from bookdetail ;


SELECT  left(book_code,8) as book_code, title, author,
		translator, price, image,
		sum(rental_possible) as rental_possible,
		pub_name, cate_b_no,
		cate_m_no, cate_s_no,
		pub_no,
		cate_b_name, cate_m_name,
		cate_s_name,
		count(left(book_code,8)) as sum,
		sum(rental_possible) as possible
		FROM
		proj_library.bookdetail		
		group by left(book_code,8);
		order by ranking desc;

	
left(book_code,8) as book_code, title, author,translator,
		price, image, sum(rental_possible) as rental_possible,
		pub_name,
		cate_b_no,cate_m_no, cate_s_no,pub_no,cate_b_name, cate_m_name,
		cate_s_name,
		count(left(book_code,8)) as hap,
		sum(rental_possible) as
		possible
		FROM
		proj_library.bookdetail
		where left(book_code, 1) != 'D'
		group by left(book_code,8);
		
	
select*from bookdetail 
where book_code not like 'D%';





create view vw_test as
select `b`.`book_code` as `book_code`,
	`b`.`title` as `title`,
	`b`.`author` as `author`,
	`b`.`translator` as `translator`,
	`b`.`price` as `price`,
	`b`.`image` as `image`,
	`b`.`rental_possible` as `rental_possible`,
	`b`.`pub_no` as `pub_no`,
	`p`.`pub_name` as `pub_name`,
	`b`.`cate_b_no` as `cate_b_no`,
	`b`.`cate_m_no` as `cate_m_no`,
	`b`.`cate_s_no` as `cate_s_no`,	
	`cb`.`cate_b_name` as `cate_b_name`,
	`cm`.`cate_m_name` as `cate_m_name`,
	`cs`.`cate_s_name` as `cate_s_name`
from
	book b left join publisher p on b.pub_no = p.pub_no 
	join category_b cb on b.cate_b_no = cb.cate_b_no
	join category_m cm on b.cate_m_no = cm.cate_m_no and b.cate_b_no = cm.cate_b_no
	join category_s cs on b.cate_s_no = cs.cate_s_no  and b.cate_m_no = cs.cate_m_no and b.cate_b_no = cs.cate_b_no;





select `b`.`book_code` as `book_code`,
	`b`.`title` as `title`,
	`b`.`author` as `author`,
	`b`.`translator` as `translator`,
	`b`.`price` as `price`,
	`b`.`image` as `image`,
	`b`.`rental_possible` as `rental_possible`,
	`b`.`pub_no` as `pub_no`,
	`p`.`pub_name` as `pub_name`,
	`b`.`cate_b_no` as `cate_b_no`,
	`b`.`cate_m_no` as `cate_m_no`,
	`b`.`cate_s_no` as `cate_s_no`,
	(select cate_b_name from category_b where cate_b_no = b.cate_b_no) as `cate_b_name`,
	(select cate_m_name from category_m where concat(cate_b_no, cate_m_no) = concat(b.cate_b_no, b.cate_m_no)) as `cate_m_name`,
	(select cate_s_name from category_s where concat(cate_b_no, cate_m_no, cate_s_no) = concat(b.cate_b_no, b.cate_m_no, b.cate_s_no)) as `cate_s_name`
from book b left join publisher p on b.pub_no = p.pub_no;




select (select cate_m_name from category_m where concat(cate_b_no, cate_m_no) = concat(b.cate_b_no, b.cate_m_no) as `cate_m_name`
from book b left join publisher p on b.pub_no = p.pub_no;



desc book;
desc category_m;
select cate_b_name 
from category_b cb
where cb.cate_b_no = 0;	

select cate_m_name from category_m cm where concat(cm.cate_m_no, cm.cate_b_no) = 00;

select * from vw_test;

    ((((`book` `b`
left join `publisher` `p` on
    ((`b`.`pub_no` = `p`.`pub_no`)))
left join `category_b` `cb` on
    ((`cb`.`cate_b_no` = `b`.`cate_b_no`)))
left join `category_m` `cm` on
    (((`cm`.`cate_m_no` = `b`.`cate_m_no`)
    and (`b`.`cate_b_no` = `cm`.`cate_b_no`))))
left join `category_s` `cs` on
    (((`cs`.`cate_s_no` = `b`.`cate_s_no`)
    and (`b`.`cate_m_no` = `cs`.`cate_m_no`)
    and (`b`.`cate_s_no` = `cs`.`cate_b_no`))))

create
or replace
view `bookdetail` as select
    `b`.`book_code` as `book_code`,
    `b`.`title` as `title`,
    `b`.`author` as `author`,
    `b`.`translator` as `translator`,
    `b`.`price` as `price`,
    `b`.`image` as `image`,
    `b`.`rental_possible` as `rental_possible`,
    `b`.`pub_no` as `pub_no`,
    `p`.`pub_name` as `pub_name`,
    `b`.`cate_b_no` as `cate_b_no`,
    `b`.`cate_m_no` as `cate_m_no`,
    `b`.`cate_s_no` as `cate_s_no`,
    `cb`.`cate_b_name` as `cate_b_name`,
    `cm`.`cate_m_name` as `cate_m_name`,
    `cs`.`cate_s_name` as `cate_s_name`
from
    ((((`book` `b`
left join `publisher` `p` on
    ((`b`.`pub_no` = `p`.`pub_no`)))
left join `category_b` `cb` on
    ((`cb`.`cate_b_no` = `b`.`cate_b_no`)))
left join `category_m` `cm` on
    (((`cm`.`cate_m_no` = `b`.`cate_m_no`)
    and (`b`.`cate_b_no` = `cm`.`cate_b_no`))))
left join `category_s` `cs` on
    (((`cs`.`cate_s_no` = `b`.`cate_s_no`)
    and (`b`.`cate_m_no` = `cs`.`cate_m_no`)
    and (`b`.`cate_s_no` = `cs`.`cate_b_no`))));
    
   
   
   
   
   
   
   
   
   
   
   
   
SELECT bc, title, author, pub_name, rental_date, cate_b_no, cate_m_no, cate_s_no,count(bc) as ranking FROM bestsaler WHERE rental_date BETWEEN '2019-01-07' and '2019-01-14' group by bc order by ranking desc limit 0,10;