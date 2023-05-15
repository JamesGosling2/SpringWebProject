package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FullViewDAO;
import vo.FullViewVO;
import vo.SearchVO;

@Service
public class FullViewService {

	private FullViewDAO fullview_dao;

	@Autowired
	public FullViewService(FullViewDAO fullview_dao) {
		this.fullview_dao = fullview_dao;
		System.out.println("fullviewService");
	}

	public List<FullViewVO> selectList() {
		List<FullViewVO> list = fullview_dao.selectList();
		return list;
	}

	public int selectCount() {
		int product_count = fullview_dao.selectCount();
		return product_count;
	}

	public List<FullViewVO> search_select(SearchVO vo) {
		// System.out.println(vo.getProduct_type());
		List<FullViewVO> list = fullview_dao.search_select(vo);
		return list;
	}

	public int selectSearchCount(SearchVO vo) {
		int product_count = fullview_dao.selectSearchCount(vo);
		return product_count;
	}

	public List<FullViewVO> typing_search(String search) {
		List<FullViewVO> list = fullview_dao.typing_search(search);
		return list;
	}

	public int typing_searchCount(String search) {
		int product_count = fullview_dao.typing_searchCount(search);
		return product_count;
	}
	
	public int insert(FullViewVO vo) {
		int i = fullview_dao.insert(vo);
		return i;
	}
	
	public int delete(int product_idx) {
	    	int i = fullview_dao.delete(product_idx);
	    	return i;
	}
	
	public List<FullViewVO> recommend(SearchVO vo){
		List<FullViewVO> list = fullview_dao.recommend(vo);
		return list;
	}
	public int recommend_count(SearchVO vo) {
		int count = fullview_dao.recommend_count(vo);
		return count;
	}
	 

	public List<FullViewVO> new_product() {
		List<FullViewVO> list = fullview_dao.new_product();
		return list;
	}

	public int new_product_count() {
		int product_count = fullview_dao.new_product_count();
		return product_count;
	}
	
	public List<FullViewVO> best_product() {
		List<FullViewVO> list = fullview_dao.best_product();
		return list;
	}

	public int best_product_count() {
		int product_count = fullview_dao.best_product_count();
		return product_count;
	}

}
