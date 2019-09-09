package com.sinc.shinsteller.product.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sinc.shinsteller.product.service.ProductService;
import com.sinc.shinsteller.product.vo.ProductVO;

@Controller
public class ProductController {

	@Resource(name="productS")
	ProductService serviceImpl;
	
	@RequestMapping(value = "/product.sst", method = RequestMethod.GET)
	public String goProduct(int prdno, Model model) {
		System.out.println("ProductController >>>>> goProduct");
		ProductVO product = serviceImpl.getProduct(prdno);
		if(product != null) {
			model.addAttribute("product", product);
		}
		return "single-product-video";
	}
	
}
