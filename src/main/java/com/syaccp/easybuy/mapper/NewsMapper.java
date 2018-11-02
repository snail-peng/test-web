package com.syaccp.easybuy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syaccp.easybuy.entity.News;



public interface NewsMapper {

	/**
	 * mybatis不需要做数据访问层接口实现类：
	 * 
	 * 1. namespace="com.syaccp.easybuy.mapper.NewsMapper" 2. <select
	 * id="selectByPrimaryKey" 必须与方法名一致
	 * 
	 * 
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Integer id);

	int insert(News record);

	News selectByPrimaryKey(Integer id);

	List<News> findAll();

	int update(News record);
	
	News selectByTitle(@Param("title")String title);
	
	
	List<News> selectForEachArray(@Param("arr") int[] arraa);
	
	List<News> selectForEachList(@Param("arr1")List<Integer> aaaa);
	
	

}