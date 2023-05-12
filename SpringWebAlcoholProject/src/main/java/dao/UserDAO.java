package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository("userDao")
public class UserDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public UserDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("DAO 생성자 : " + sqlSession);
	} // end of constructor

	public int insert(UserVO vo){
		int res = sqlSession.insert("u.user_insert", vo);
		return res;
	} // end of insert()

	public UserVO selectOne(String user_email){
		System.out.println("------ dao selectOne() ------");
		System.out.println("user_email : " + user_email);
		UserVO vo = sqlSession.selectOne("u.user_selectOne", user_email);
		System.out.println("vo 객체 : " + vo);
		return vo;
	} // end of selectOne()

	public int update(UserVO vo){
		int res = sqlSession.insert("u.user_update", vo);
		return res;
	} // end of insert()



} // end of class
