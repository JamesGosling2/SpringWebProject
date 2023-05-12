package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ReviewService;
import util.Common;
import vo.ReviewVO;
import vo.UserVO;

@Controller
public class ReviewController {

	ReviewService service;

	@Autowired
	public ReviewController(ReviewService service) {
		this.service = service;
	}

	@RequestMapping("/review_rating.do")
	public String review_list(Model model) {

		List<ReviewVO> list = service.selectList_review();

		model.addAttribute("review_list", list);
		return Common.Review.VIEW_PATH + "review_board.jsp";
	}
	
	@RequestMapping("user_review.do")
	public String user_reivew(Model model, UserVO vo) {
		System.out.println("-----user_reveiew.do-----");
		System.out.println("vo : " + vo.getUser1_idx());
		
		ReviewVO vo1 = service.selectOne(vo.getUser1_idx());
		
		System.out.println("vo1 : " + vo1);
		model.addAttribute("user_review", vo1);
		
		return Common.Review.VIEW_PATH + "user_review_board.jsp";
	} 

//	@RequestMapping("/review_write.do")
//	public String insert_form(Model model) {
//		List<ReviewVO> list = service.selectList_review();
//		model.addAttribute("review_list", list);
//		return Common.Review.VIEW_PATH + "review_write.jsp";
//	}

	@RequestMapping("/review_register.do")
	public String return_list(ReviewVO vo) {

		service.insert_review(vo);

		return "review_rating.do";
	}

}// end of class