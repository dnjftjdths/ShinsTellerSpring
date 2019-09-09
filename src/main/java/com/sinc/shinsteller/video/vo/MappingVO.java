package com.sinc.shinsteller.video.vo;

import java.util.ArrayList;
import java.util.List;

public class MappingVO {
	private String mapWord = "";		// 매핑단어 (ex. 화이트, null)
	private List<Double> timeStamp = new ArrayList<Double>();		// 타임 스탬프 리스트
	
	public MappingVO(String mapWord) {
		this.mapWord = mapWord;
	}
	public MappingVO() {
		super();
	}
	public MappingVO(String mapWord, List<Double> timeStamp) {
		super();
		this.mapWord = mapWord;
		this.timeStamp = timeStamp;
	}
	
	public String getMapWord() {
		return mapWord;
	}
	public void setMapWord(String mapWord) {
		this.mapWord = mapWord;
	}
	public List<Double> getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(List<Double> timeStamp) {
		this.timeStamp = timeStamp;
	}
	
	public void addTimeStamp(double res_timestmp) {
		timeStamp.add(res_timestmp);
	}
	
	@Override
	public String toString() {
		String str = "";
		for (double timestmp : timeStamp) {
		    str += timestmp + " ";
		}
		return "[MappingVO] mapWord= " + mapWord + ", timeStamp=( " + str + ")";
	}
	
	
}
