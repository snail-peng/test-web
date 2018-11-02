package com.syaccp.easybuy.service;

import java.util.List;

import com.syaccp.easybuy.entity.News;

public interface NewsService {

	void insert(News record);
	
	List<News> findAll();

}