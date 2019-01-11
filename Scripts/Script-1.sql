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
    and (`b`.`cate_s_no` = `cs`.`cate_b_no`))))