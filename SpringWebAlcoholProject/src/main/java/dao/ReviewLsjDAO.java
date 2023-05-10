package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.FullViewVO;
import vo.ReviewLsjVO;
import vo.ReviewVO;
import vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewLsjDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    public ReviewLsjDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    public int review_insert(ReviewLsjVO review_vo){
        int res = sqlSession.insert("r2.review_insert", review_vo);
        return res;
    } // end of review_insert()

    public Map<String, Object> user_reviewMap(int user1_idx){
        Map<String, Object> user_reviewMap = new HashMap<String, Object>();
        List<ReviewLsjVO> reviewList = sqlSession.selectList("r2.review_user_select1", user1_idx);
        List<FullViewVO> productList = sqlSession.selectList("r2.review_user_select2", user1_idx);
        user_reviewMap.put("reviewList", reviewList);
        user_reviewMap.put("productList", productList);
        return user_reviewMap;
    } // end of reviewList()



} // end of class
