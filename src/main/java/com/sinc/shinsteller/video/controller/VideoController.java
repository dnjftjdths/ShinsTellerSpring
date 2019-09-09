package com.sinc.shinsteller.video.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinc.shinsteller.video.service.VideoService;
import com.sinc.shinsteller.video.vo.CategoryVO;

@Controller
public class VideoController {
	
	@Resource(name="videoS")
	private VideoService serviceImpl;
	
	// http://localhost:8088/video.sst?videoName=GentHommeVOD
	@RequestMapping(value = "/video.sst")
	public ModelAndView goVideo(String videoName) {
		System.out.println("VideoController >>>>> goVideo");
		ModelAndView mv = new ModelAndView("video");
		mv.addObject("videoName", videoName);
		return mv;
	 }
	
	
	@RequestMapping(value = "/videoTimeStamp.sst")
	@ResponseBody
	public List<CategoryVO> getTimeStamp(String videoName) {
		System.out.println("VideoController >>>>> getTimeStamp");
		List<CategoryVO> categorys = serviceImpl.getFirstCategorys(videoName);
	  return categorys;
	 }
	
	@RequestMapping(value = "/videoTimeStampAll.sst")
	@ResponseBody
	public List<CategoryVO> getAllTimeStamp(String videoName) {
		System.out.println("VideoController >>>>> getTimeStamp");
		List<CategoryVO> categorys = serviceImpl.getAllCategorys(videoName);
	  return categorys;
	 }
	
	// http://localhost:8088/voice.sst?url=GentHommeVOD&record=하얀색보여줘
	@RequestMapping(value = "/voice.sst")
	@ResponseBody
	public List<CategoryVO> voiceSearch(String videoName, String record) throws Exception {
		List<CategoryVO> resultBookmark = serviceImpl.searchService(videoName, record);
		return resultBookmark;
	}
}
