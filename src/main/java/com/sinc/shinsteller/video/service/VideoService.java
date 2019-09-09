package com.sinc.shinsteller.video.service;

import java.util.List;
import java.util.Map;

import com.sinc.shinsteller.video.vo.CategoryVO;

public interface VideoService {

	List<CategoryVO> getFirstCategorys(String videoName);

	List<CategoryVO> searchService(String videoName, String record) throws Exception;

	List<CategoryVO> getAllCategorys(String videoName);

	int plusVODcnt();
	
}
