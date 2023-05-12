package service;

import dao.ReviewLsjDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.ReviewLsjVO;

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

} // end of class
