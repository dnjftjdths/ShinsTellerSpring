package com.sinc.shinsteller.video.model;

import java.util.List;

import com.sinc.shinsteller.video.dto.VideoDTO;

public interface VideoDao {

	List<VideoDTO> getFirstVodResultList(String videoName);
	List<VideoDTO> getAllVodResultList(String videoName);

	List<VideoDTO> selectList(String url, List<String> keywords);
	int updateVODcnt();

	
}
