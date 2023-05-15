package service;

import dao.DetailViewDAO;
import dao.FullViewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import java.util.List;
import java.util.Map;

@Service
public class DetailService {
	private DetailViewDAO detailViewDAO;

	@Autowired
	public DetailService(DetailViewDAO detailViewDAO) {
		this.detailViewDAO = detailViewDAO;
	} // end of constructor

	public FullViewVO selectOne(int product_idx) {
		FullViewVO vo = detailViewDAO.selectOne(product_idx);
		return vo;
	} // end of selectOne()

	public List<ReviewLsjVO> review_selectList(int product_idx) {
		List<ReviewLsjVO> reviewList = detailViewDAO.review_selectList(product_idx);
		return reviewList;
	} // end of review_selectList()

    public Map<String, Object> review_selectList2(int product_idx){
        Map<String, Object> review_map = detailViewDAO.review_selectList2(product_idx);
        return review_map;
    } // end of review_selectList2()
    
    public int product_modify(FullViewVO vo) {
    	int i = detailViewDAO.product_modify(vo);
    	return i;
    }
    
	public List<FullViewVO> show_producer(FullViewVO vo) {

		List<FullViewVO> list = detailViewDAO.show_producer(vo);
		return list;
	}//end of show_producer()

} // end of class
