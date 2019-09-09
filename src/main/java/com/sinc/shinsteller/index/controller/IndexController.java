package com.sinc.shinsteller.index.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinc.shinsteller.index.service.IndexService;
import com.sinc.shinsteller.index.vo.IndexVO;

@Controller
public class IndexController {

	@Resource(name="indexS")
	private IndexService serviceImpl;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		System.out.println("IndexController >>>>> index");
		// 메인화면에 보여줄 상품 리스트 조회
		List<IndexVO> products = serviceImpl.getProducts();
		if(products != null) {	// 상품 리스트가 정상적으로 넘어오면
			model.addAttribute("products", products);
		}
		return "index";
	}
	
	@RequestMapping(value = "/index.sst")
	public String goIndex(Model model) {
		System.out.println("IndexController >>>>> goIndex");
		List<IndexVO> products = serviceImpl.getProducts();
		if(products != null) {	// 상품 리스트가 정상적으로 넘어오면
			model.addAttribute("products", products);
		}
		return "index";
	}
	
}
