package dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FullViewVO;
import vo.SearchVO;

@Repository("fullview_dao")
public class FullViewDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public FullViewDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("DAO 생성자 : " + sqlSession);
	} // end of constructor
	
	public List<FullViewVO> selectList(){
		List<FullViewVO> list = sqlSession.selectList("p.product_list");
		return list;
	}
	
	public int selectCount() {
		int product_count = sqlSession.selectOne("p.product_count");
		return product_count;
	}
	
	public List<FullViewVO> search_select(SearchVO vo){
		
		if(vo.getProduct_bodytaste_rating() != null) {
			ArrayList<String> bodytaste = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_bodytaste_rating().size(); i++) {
				
				if(vo.getProduct_bodytaste_rating().get(i).equals("약한")){
					bodytaste.add("0");
					bodytaste.add("1");
					bodytaste.add("2");
					bodytaste.add("3");
				}else if(vo.getProduct_bodytaste_rating().get(i).equals("중간")) {
					bodytaste.add("4");
					bodytaste.add("5");
					bodytaste.add("6");
				}else if(vo.getProduct_bodytaste_rating().get(i).equals("강한")) {
					bodytaste.add("7");
					bodytaste.add("8");
					bodytaste.add("9");
				}
			}
			
			vo.setProduct_bodytaste_rating(bodytaste);
		}
		if(vo.getProduct_sourish_rating() != null) {
			ArrayList<String> sourish = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_sourish_rating().size(); i++) {
				
				if(vo.getProduct_sourish_rating().get(i).equals("약한")){
					sourish.add("0");
					sourish.add("1");
					sourish.add("2");
					sourish.add("3");
					
				}else if(vo.getProduct_sourish_rating().get(i).equals("중간")) {
					sourish.add("4");
					sourish.add("5");
					sourish.add("6");
				}else if(vo.getProduct_sourish_rating().get(i).equals("강한")) {
					sourish.add("7");
					sourish.add("8");
					sourish.add("9");
				}
			}
			
			vo.setProduct_sourish_rating(sourish);
		}
		if(vo.getProduct_sweet_rating() != null) {
			ArrayList<String> sweet = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_sweet_rating().size(); i++) {
				
				if(vo.getProduct_sweet_rating().get(i).equals("약한")){
					sweet.add("0");
					sweet.add("1");
					sweet.add("2");
					sweet.add("3");
				}else if(vo.getProduct_sweet_rating().get(i).equals("중간")) {
					sweet.add("4");
					sweet.add("5");
					sweet.add("6");
				}else if(vo.getProduct_sweet_rating().get(i).equals("강한")) {
					sweet.add("7");
					sweet.add("8");
					sweet.add("9");
				}
			}
			
			vo.setProduct_sweet_rating(sweet);
		}
		if(vo.getProduct_sparkling_rating()  != null) {
			ArrayList<String> sparkling = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_sparkling_rating().size(); i++) {
				
				if(vo.getProduct_sparkling_rating().get(i).equals("약한")){
					sparkling.add("0");
				}else if(vo.getProduct_sparkling_rating().get(i).equals("중간")) {
					sparkling.add("1");
				}else if(vo.getProduct_sparkling_rating().get(i).equals("강한")) {
					sparkling.add("1");
				}
			}
			
			vo.setProduct_sparkling_rating(sparkling);
		}
		
		if(vo.getProduct_alcohol_degree() != null) {
			ArrayList<String> degree = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_alcohol_degree().size(); i++) {
				if(vo.getProduct_alcohol_degree().get(i).equals("010")) {
					degree.add("0");
				}else if(vo.getProduct_alcohol_degree().get(i).equals("1020")) {
					degree.add("10");
				}else if(vo.getProduct_alcohol_degree().get(i).equals("2030")) {
					degree.add("20");
				}else if(vo.getProduct_alcohol_degree().get(i).equals("30up")) {
					degree.add("30");
				}
			}
			vo.setProduct_alcohol_degree(degree);
		}
		if(vo.getProduct_price() != null) {
			ArrayList<String> price = new ArrayList<String>();
			for(int i = 0; i<vo.getProduct_price().size(); i++) {
				if(vo.getProduct_price().get(i).equals("1down")) {
					price.add("0");
				}else if(vo.getProduct_price().get(i).equals("1to3")) {
					price.add("10000");
				}else if(vo.getProduct_price().get(i).equals("3to5")) {
					price.add("30000");
				}else if(vo.getProduct_price().get(i).equals("5to10")) {
					price.add("50000");
				}else if(vo.getProduct_price().get(i).equals("10up")) {
					price.add("100000");
				}
			}
			vo.setProduct_price(price);
		}
		List<FullViewVO> list = sqlSession.selectList("p.product_search", vo);
		return list;
	}
	
	public int selectSearchCount(SearchVO vo) {
		
		int product_count = sqlSession.selectOne("p.product_search_count", vo);
		return product_count;
	}
	
	public List<FullViewVO> typing_search(String search){
		List<FullViewVO> list = sqlSession.selectList("p.product_typing_search", search);
		return list;
	}
	
	public int typing_searchCount(String search) {
		int product_count = sqlSession.selectOne("p.product_typing_searchCount", search);
		return product_count;
	}
	
	public int insert(FullViewVO vo) {
		int i = sqlSession.insert("p.product_insert", vo);
		return i;
	}
	
    public int delete(int product_idx) {
    	int i = sqlSession.delete("p.product_delete", product_idx);
    	return i;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	

}
