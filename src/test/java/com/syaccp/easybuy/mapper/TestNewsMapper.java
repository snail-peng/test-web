package com.syaccp.easybuy.mapper;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.syaccp.easybuy.entity.News;

public class TestNewsMapper {

	
	
	/*private static SqlSessionFactory sessionFactory; // 连接池

	static {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml");
			sessionFactory = builder.build(reader);
		} catch (IOException e) {

			e.printStackTrace();
		}

	}
	
	public SqlSession getSession() {
		SqlSession session = sessionFactory.openSession();
		
		return session;
	}

	@Test
	public void testDeleteByPrimaryKey() {
		
		SqlSession session = sessionFactory.openSession();
		NewsMapper mapper = session.getMapper(NewsMapper.class);
		mapper.deleteByPrimaryKey(3);
		
	}
	
	
	@Test
	public void testSelectByTitle() {
		
		SqlSession session = sessionFactory.openSession();
		NewsMapper mapper = session.getMapper(NewsMapper.class);
		News news = mapper.selectByTitle("a");
		System.out.println(news.getContent());
		
	}
	
	
	@Test
	public void testSelectForEach() {
		
		SqlSession session = sessionFactory.openSession();
		NewsMapper mapper = session.getMapper(NewsMapper.class);
		List<News> list = mapper.selectForEachArray(new int[]{3,5});
		System.out.println(list.size());
		
	}
	
	@Test
	public void testSelectForEachList() {
		
		SqlSession session = sessionFactory.openSession();
		NewsMapper mapper = session.getMapper(NewsMapper.class);
		System.out.println(1);
		//List<News> list = mapper.selectForEachList();
		
		
	}
*/
}
