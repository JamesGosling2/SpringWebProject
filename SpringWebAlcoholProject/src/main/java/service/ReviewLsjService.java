package service;

import dao.ReviewLsjDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.ReviewLsjVO;

import java.util.List;
import java.util.Map;

@Service
public class ReviewLsjService {
    private ReviewLsjDAO reviewLsjDAO;

    @Autowired
    public ReviewLsjService(ReviewLsjDAO reviewLsjDAO) {
        this.reviewLsjDAO = reviewLsjDAO;
    } // end of constructor

    public int review_insert(ReviewLsjVO review_vo){
        int res = reviewLsjDAO.review_insert(review_vo);
        return res;
    } // end of review_insert

    public Map<String, Object> user_reviewMap(int user1_idx){
        Map<String, Object> user_reviewMap = reviewLsjDAO.user_reviewMap(user1_idx);
        return user_reviewMap;
    } // end of user_reviewList()

    public ReviewLsjVO review_selectOne(int review_idx){
        ReviewLsjVO review_vo = reviewLsjDAO.review_selectOne(review_idx);
        return review_vo;
    } // end of review_selectOne()

    public int review_modify(ReviewLsjVO review_vo){
        int res = reviewLsjDAO.review_modify(review_vo);
        return res;
    } // end of review_modify()

    public int review_delete(int review_idx){
        int res = reviewLsjDAO.review_delete(review_idx);
        return res;
    } // end of review_delete()

} // end of class
