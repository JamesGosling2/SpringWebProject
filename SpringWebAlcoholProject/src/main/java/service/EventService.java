package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EventDAO;
import vo.EventVO;

@Service
public class EventService {
	private EventDAO event_dao;
	
	@Autowired
	public EventService(EventDAO event_dao) {
		this.event_dao = event_dao;
		
	}
	
	public List<EventVO> selectList(){
		List<EventVO> list = event_dao.selectList();
		return list;
	}
	
	public EventVO selectOne(int event_idx){
		EventVO vo = event_dao.selectOne(event_idx);
		return vo;
	}
}
