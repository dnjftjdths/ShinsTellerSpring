package com.sinc.shinsteller.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sinc.shinsteller.index.model.IndexDao;
import com.sinc.shinsteller.product.model.ProductDao;
import com.sinc.shinsteller.product.vo.ProductVO;


@Service("productS")
public class ProductServiceImpl implements ProductService{

	@Resource(name = "productD")
	private ProductDao daoImpl;

	@Override
	public ProductVO getProduct(int prdno) {
		System.out.println("ProductServiceImpl >>>>> getProduct");
		ProductVO product = daoImpl.getProductRow(prdno);
		return product;
	}
	
}
