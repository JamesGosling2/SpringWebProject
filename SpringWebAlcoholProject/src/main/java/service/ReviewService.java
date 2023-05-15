package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewDAO;
import vo.FullViewVO;
import vo.ReviewVO;
import vo.UserVO;

@Service
public class ReviewService {

	ReviewDAO reviewDao;

	@Autowired
	public ReviewService(ReviewDAO reviewDao) {
		// TODO Auto-generated constructor stub
		this.reviewDao = reviewDao;
	}

	public List<ReviewVO> selectList_review() {
		List<ReviewVO> list = reviewDao.selectList();
		return list;
	} // end of selectList()

	public int insert_review(ReviewVO vo) {
		int res = reviewDao.insert(vo);
		return res;
	}// end of insert_review

	public ReviewVO selectOne(int user1_idx) {
		ReviewVO vo = reviewDao.selectOne(user1_idx);
		return vo;
	}

	public double avg(int product_idx) {
		
		double res = reviewDao.avg(product_idx);
		
		return res;
	}

}
