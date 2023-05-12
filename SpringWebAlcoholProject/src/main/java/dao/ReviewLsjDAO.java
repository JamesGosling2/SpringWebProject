package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.FullViewVO;
import vo.ReviewLsjVO;
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



} // end of class
