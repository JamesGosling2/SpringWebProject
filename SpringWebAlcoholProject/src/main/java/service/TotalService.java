package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.FullViewVO;
import vo.UserVO;

@Service
public class TotalService {

	private UserDAO userDao;


	@Autowired
	public TotalService(UserDAO userDao) {
		this.userDao = userDao;
		System.out.println("Service 생성자 : " + userDao);
	} // end of constructor

	public int insert(UserVO vo){
		int res = userDao.insert(vo);
		return res;
	} // end of insert()

	public UserVO selectOne(String user_email){
		UserVO vo = userDao.selectOne(user_email);
		return vo;
	} // end of selectOne()

	public int update(UserVO vo){
		int res = userDao.update(vo);
		return res;
	} // end of update()

} // end of class
