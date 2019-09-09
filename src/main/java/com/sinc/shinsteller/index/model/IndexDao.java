package com.sinc.shinsteller.index.model;

import java.util.List;
import java.util.Map;

import com.sinc.shinsteller.index.vo.IndexVO;

public interface IndexDao {

	//public List<BoardVO> selectAll();
	List<IndexVO> selectProductsRow();
	
}
