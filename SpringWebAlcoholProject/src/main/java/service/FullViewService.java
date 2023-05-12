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
	
	public List<FullViewVO> selectList(){
		List<FullViewVO> list = fullview_dao.selectList();
		return list;
	}
	
	public int selectCount() {
		int product_count = fullview_dao.selectCount();
		return product_count;
	}
	
	public List<FullViewVO> search_select(SearchVO vo){
		//System.out.println(vo.getProduct_type());
		List<FullViewVO> list = fullview_dao.search_select(vo);
		return list;
	}
	
	public int selectSearchCount(SearchVO vo) {
		int product_count = fullview_dao.selectSearchCount(vo);
		return product_count;
	}
	
	public List<FullViewVO> typing_search(String search){
		List<FullViewVO> list = fullview_dao.typing_search(search);
		return list;
	}
	
	public int typing_searchCount(String search) {
		int product_count = fullview_dao.typing_searchCount(search);
		return product_count;
	}



}
