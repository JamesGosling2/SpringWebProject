package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import util.Common.full_view;
import vo.FullViewVO;
import vo.ReviewLsjVO;
import vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DetailViewDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    public DetailViewDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    public FullViewVO selectOne(int product_idx){
        FullViewVO vo = sqlSession.selectOne("p.product_selectOne", product_idx);
        return vo;
    } // end of selectOne()

    // review select
    public List<ReviewLsjVO> review_selectList(int product_idx){
        List<ReviewLsjVO> reviewList = sqlSession.selectList("p.review_selectList", product_idx);
        return reviewList;
    } // end of review_selectList()

    public Map<String, Object> review_selectList2(int prodcut_idx){
        List<ReviewLsjVO> reviewList = sqlSession.selectList("r.review_selectList2", prodcut_idx);
        List<UserVO> userList = sqlSession.selectList("r.review_selectList3", prodcut_idx);

        Map<String, Object> review_map = new HashMap<String, Object>();
        review_map.put("reviewList", reviewList);
        review_map.put("userList", userList);

        return review_map;
    }
    
    public List<FullViewVO> show_producer(FullViewVO vo){
    	
    	List<FullViewVO> list = sqlSession.selectList("p.show_producer", vo);
    	
    	return list;
    	
    }

} // end of class
