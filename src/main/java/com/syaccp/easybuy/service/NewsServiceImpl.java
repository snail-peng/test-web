package com.syaccp.easybuy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.syaccp.easybuy.entity.News;
import com.syaccp.easybuy.mapper.NewsMapper;

@Service("newsService")
public class NewsServiceImpl implements NewsService {
	
	
	
	
	public NewsServiceImpl() {
		super();
		System.out.println("NewsServiceImpl");
	}


	@Resource
	private NewsMapper newsMapper;
	
	
	@Override
	public void  insert(News record){
		newsMapper.insert(record);
		
	}


	@Override
	public List<News> findAll() {
		
		return newsMapper.findAll();
	}

}
