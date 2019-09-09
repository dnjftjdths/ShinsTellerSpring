package com.sinc.shinsteller.index.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.shinsteller.index.model.IndexDao;
import com.sinc.shinsteller.index.vo.IndexVO;


@Service("indexS")
public class IndexServiceImpl implements IndexService{

	@Resource(name = "indexD")
	private IndexDao daoImpl;

	@Override
	public List<IndexVO> getProducts() {	// 메인화면에 보여줄 상품 리스트 조회
		System.out.println("IndexServiceImpl >>>>> getProducts");
		return daoImpl.selectProductsRow();
	}
	
}
