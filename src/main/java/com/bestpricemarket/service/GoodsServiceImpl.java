package com.bestpricemarket.service;

import java.io.File;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.persistence.GoodsDAO;
import com.bestpricemarket.utils.FileUtils;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	
	// DAO 의존 주입
	@Inject
	private GoodsDAO gdao;	
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 상품등록
	@Override
	public void goodsRegister(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		System.out.println("S : 상품 목록");
		 gdao.registerGoods(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			gdao.insertFile(list.get(i)); 
		}
		
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int gno) throws Exception {

		System.out.println("S : 첨부파일 조회");
		
		return gdao.selectFileList(gno);
	}
	

	
	// 상품목록
	@Override
	public List<GoodsVO> goodsList() throws Exception {

		System.out.println("S : 상품목록");
		return gdao.listGoods();
	}
		
	// 상품조회(상품상세페이지)
	@Override
	public GoodsVO goodsDetail(int gno) throws Exception {
		// TODO Auto-generated method stub
		
		GoodsVO vo = gdao.goodsDetail(gno);
		
		
		return vo;
	}
	
	// 상품수정
		
	// 상품삭제

}









