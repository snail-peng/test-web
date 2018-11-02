package com.syaccp.easybuy.entity;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.syaccp.easybuy.mapper.NewsMapper;

public class NewsDaoImpl implements NewsMapper {

	private static SqlSessionFactory sessionFactory; // 连接池

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

	public static void main(String[] args) {
		NewsMapper newsMapper = new NewsDaoImpl();
		//newsMapper.selectByPrimaryKey(3);

		News news = new News();
		

		news.setContent("gggg");
		//newsMapper.deleteByPrimaryKey(2);
		newsMapper.insert(news);
		
		System.out.println(news.getId());

	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		SqlSession session = null;

		try {
			session = getSession();
			session.delete("com.syaccp.easybuy.mapper.NewsMapper.deleteByPrimaryKey", id);
			session.commit();

		} catch (Exception e) {
			session.rollback();
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}

		}

		return 0;
	}

	@Override
	public int insert(News news) {
		SqlSession session = null;

		try {
			session = getSession();

			session.insert("com.syaccp.easybuy.mapper.NewsMapper.insert", news);
			session.commit();

		} catch (Exception e) {
			session.rollback();
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}

		}

		return 0;
	}

	@Override
	public News selectByPrimaryKey(Integer id) {
		SqlSession session = null;
		News   news   =null;
		try {
			session = getSession();
			news=session.selectOne("com.syaccp.easybuy.mapper.NewsMapper.selectByPrimaryKey", id);
			session.commit();

		} catch (Exception e) {
			session.rollback();
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}

		}
		return null;
	}

	@Override
	public int update(News news) {
		SqlSession session = null;

		try {
			session = getSession();

			session.update("com.syaccp.easybuy.mapper.NewsMapper.update", news);
			session.commit();

		} catch (Exception e) {
			session.rollback();
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}

		}
		return 0;
	}

	@Override
	public List<News> findAll() {
		SqlSession session = null;

		try {
			session = getSession();
			List<News>  list   =  session.selectList("com.syaccp.easybuy.mapper.NewsMapper.findAll",null);
			
			for (News news : list) {
				System.out.println(news);
			}

		} catch (Exception e) {
			session.rollback();
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}

		}
		return null;
	}

	@Override
	public News selectByTitle(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public List<News> selectForEachArray(int[] arraa) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> selectForEachList(List<Integer> aaaa) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
