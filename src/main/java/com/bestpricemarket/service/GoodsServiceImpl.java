package com.bestpricemarket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bestpricemarket.domain.Criteria;
import com.bestpricemarket.domain.GoodsVO;
import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.domain.PricemonitoringVO;
import com.bestpricemarket.domain.ReportVO;
import com.bestpricemarket.persistence.GoodsDAO;
import com.bestpricemarket.utils.FileUtils;

@Service
public class GoodsServiceImpl implements GoodsService {

	// DAO 의존 주입
	@Inject
	private GoodsDAO gdao;

	// 지은
	// *********************************************************************************************************************************

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 상품등록
	@Override
	public void goodsRegister(GoodsVO vo, MultipartHttpServletRequest mpRequest) throws Exception {

		System.out.println("S : 상품 목록" + vo);

		gdao.registerGoods(vo);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		for (int i = 0; i < list.size(); i++) {
			gdao.insertFile(list.get(i));

		}

		// list에서 f_name값 가져와서 vo의 섬네일에 저장
		vo.setThumbnail(list.get(0).get("f_name").toString());
		
		// list에서 gno값을 가져와서 setGno 매개변수로 사용 
		gdao.setGno(Integer.parseInt(list.get(0).get("gno").toString()));

		System.out.println("@@@@@@@SSSSS " + vo);

	}

	// 상품목록 + 페이징처리
	@Override
	public List<GoodsVO> goodsList(Criteria cri) throws Exception {

		System.out.println("S : 상품목록");
		return gdao.listGoods(cri);
	}

	// 카테고리별 상품 목록 + 페이징처리
	@Override
	public List<GoodsVO> goodsCategoryList(String category, Criteria cri) throws Exception {

		System.out.println("S : 카테고리 분류 ");

		System.out.println("S 카테고리 실행 ? " + gdao.goodsCategoryList(category, cri));

		return gdao.goodsCategoryList(category, cri);
	}

	// 전체 글 개수 가져오는 처리
	@Override
	public int listTotalCount() throws Exception {

		System.out.println("S : 목록 전체 글 가져오기");

		int result = gdao.pageCount();

		System.out.println("S : 글 개수 -> " + result);

		return result;
	}
	
	// 카테고리별 글 개수 가져오는 처리
	@Override
	public int CategoryCount(String category) throws Exception {
		
		int result = gdao.CategoryCount(category);
		
		System.out.println("S : 카테고리글 개수 -> " + result);
		
		return result;
	}

	// 상품조회(상품상세페이지)
	@Override
	public GoodsVO goodsDetail(int gno) throws Exception {

		GoodsVO vo = gdao.goodsDetail(gno);

		return vo;
	}

	// 상품수정
	@Override
	public void goodsModify(GoodsVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {
		System.out.println("S : 상품 수정");
		gdao.goodsModify(vo);

		System.out.println("S : 수정된 상품 정보 -> " + vo);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;

		for (int i = 0; i < list.size(); i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				gdao.insertFile(tempMap);
			} else {
				gdao.updateFile(tempMap);
			}
		}
	}

	// 상품삭제
	@Override
	public void goodsDelete(int gno) throws Exception {
		System.out.println("S : 상품 삭제");
		gdao.goodsDelete(gno);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int gno) throws Exception {

		System.out.println("S : 첨부파일 조회");

		return gdao.selectFileList(gno);
	}

	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {

		System.out.println("S : 첨부파일 다운로드");

		return gdao.selectFileInfo(map);
	}

	
	// 현재 입찰가
	//@Override
	//public int finalPrice(int gno) throws Exception {

		//Integer result = gdao.finalPrice(gno);
		
		//return result;
	//}
	
	

	// 지은
	// *********************************************************************************************************************************

	// 상품신고
	// *******************************************************************************************************************************
	/* 태준 */
	// 상품신고
	@Override
	public MemberVO myInfo(String id) throws Exception {
		return gdao.myInfo(id);
	}

	@Override
	public ReportVO showReportDetail(int gno) throws Exception {
		ReportVO vo = gdao.showReportDetail(gno);
		return vo;
	}


	/* 태준 */
	// 상품신고
	// *******************************************************************************************************************************
	// 입찰하기
	// *******************************************************************************************************************************
	@Override
	public List<PricemonitoringVO> getBidding(int pm_g_gno) throws Exception {
		List<PricemonitoringVO> prvo = gdao.getBidding(pm_g_gno);
		return prvo;
	}

	@Override
	public int getMaxPrice(int pm_g_gno) throws Exception {
		int maxVO = gdao.getMaxPrice(pm_g_gno);
		return maxVO;
	}

	@Override
	public void insertBidding(PricemonitoringVO prvo) throws Exception {
		gdao.insertBidding(prvo);
	}
	// 입찰하기
	// *******************************************************************************************************************************
}