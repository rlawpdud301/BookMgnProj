package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.Post;

public interface PostMapper {
	List<Post> selectPostByAll();
	
	List<Post> selectPostByDoro(Post post);

}
