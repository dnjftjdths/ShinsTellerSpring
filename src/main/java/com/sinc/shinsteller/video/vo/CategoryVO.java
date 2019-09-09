package com.sinc.shinsteller.video.vo;

import java.util.ArrayList;
import java.util.List;

public class CategoryVO {
	// VideoService : List<VideoDTO> -> List<CategoryVO>로 변환
	
	private String category = "";		// 카테고리 명
	private List<MappingVO> subMappings = new ArrayList<MappingVO>();	// 하위 매핑 단어와 타임스탬프
	// 하위 매핑 단어가 없는 경우 mapWord=null이고 타임스탬프 리스트만 담겨 있다.
	
	public CategoryVO() {
		super();
	}
	
	public CategoryVO(String category) {
		this.category = category;
	}
	
	public CategoryVO(String category, List<MappingVO> subMappings) {
		super();
		this.category = category;
		this.subMappings = subMappings;
	}
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<MappingVO> getSubMappings() {
		return subMappings;
	}
	public void setSubMappings(List<MappingVO> subMappings) {
		this.subMappings = subMappings;
	}
	
	public void addSubMapping(MappingVO subMapping) {
		subMappings.add(subMapping);
	}
	
	@Override
	public String toString() {
		
		return "[CategoryVO] category=" + category + ", subMappings.size=" + subMappings.size();
	}
	
	
}
