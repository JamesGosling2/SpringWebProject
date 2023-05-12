package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.EventVO;

@Repository("event_dao")
public class EventDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public EventDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<EventVO> selectList(){
		List<EventVO> list = sqlSession.selectList("e.event_list");
		return list;
	}
	
	public EventVO selectOne(int event_idx){
		EventVO vo = sqlSession.selectOne("e.event_detail", event_idx);
		return vo;
	}

}
