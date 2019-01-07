package com.yi.BookMgnProj;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import com.yi.BookMgnProj.mvc.MyBatisSqlSessionFactory;



public class MyBatisSqlSessionFactoryTest extends AbstractTest {

	@Test
	public void testOpenSession() {
		log.debug("testOpenSession()");
		SqlSession session = MyBatisSqlSessionFactory.openSession();
		log.debug("session " + session);
		Assert.assertNotNull(session);
	}
}
