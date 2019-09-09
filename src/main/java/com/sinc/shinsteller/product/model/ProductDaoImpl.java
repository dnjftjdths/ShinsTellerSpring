package com.sinc.shinsteller.product.model;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sinc.shinsteller.product.vo.ProductVO;

@Repository("productD")
public class ProductDaoImpl implements ProductDao{

	@Resource(name="sqlSession")
	private SqlSession session;

	@Override
	public ProductVO getProductRow(int prdno) {
		System.out.println("ProductDaoImpl >>>>> getProductRow");
		return session.selectOne("com.sinc.shinsteller.product.selectProduct", prdno);
	}
}
