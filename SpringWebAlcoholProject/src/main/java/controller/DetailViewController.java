package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DetailService;
import service.ReviewService;
import util.Common;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import java.util.List;
import java.util.Map;

@Controller
public class DetailViewController {

	private DetailService detailService;
	private ReviewService reviewService;

	@Autowired
	public DetailViewController(DetailService detailService, ReviewService reviewService) {
		this.detailService = detailService;
		this.reviewService = reviewService;
	} // end of constructor

//    @RequestMapping("/detailview.do")
//    public String detailview(Model model, FullViewVO vo){
//        System.out.println("------ detailView.do ------");
//        System.out.println("vo.getProduct_idx() : " + vo.getProduct_idx());
//        FullViewVO vo1 = detailService.selectOne(vo.getProduct_idx());
//        List<ReviewLsjVO> review_list = detailService.review_selectList(vo.getProduct_idx());
//        Map<String, Object> review_map = detailService.review_selectList2(vo.getProduct_idx());
//        System.out.println("vo1 : " + vo1);
//        System.out.println("review_list : " + review_list);
//        System.out.println("review_map : " + review_map);
//
//        model.addAttribute("vo1", vo1);
//        model.addAttribute("review_list", review_list);
//        model.addAttribute("review_map", review_map);

	@RequestMapping("/detailview.do")
	public String detailview(Model model, FullViewVO vo) {
		System.out.println("------ detailView.do ------");
		System.out.println("vo.getProduct_idx() : " + vo.getProduct_idx());
		FullViewVO vo1 = detailService.selectOne(vo.getProduct_idx());
		System.out.println("vo1 : " + vo1);
		double review_score = reviewService.avg(vo.getProduct_idx());

		int dot = (int) (review_score * 10) % 10;
		int num = (int) (review_score * 10) / 10;

		if (dot < 5) {
			dot = 0;
		} else if (dot < 8) {
			dot = 5;
		} else if (dot == 0) {
			dot = 0;
		} else {
			num++;
		}

		review_score = num + (double) dot / 10.0;

		model.addAttribute("review_score", review_score);
		model.addAttribute("vo1", vo1);

		return Common.Detail_view.VIEW_PATH + "product_detail_view.jsp";
	} // end of detailview()

	@RequestMapping("/producerName.do")
	public String showProducer(Model model, FullViewVO vo) {
		
		System.out.println(vo.getProducer_name());
		List<FullViewVO> producer_list =  detailService.show_producer(vo);
		int count = producer_list.size();
		
		model.addAttribute("producer_name", vo.getProducer_name());
		model.addAttribute("product_count",count);
		model.addAttribute("product_list",producer_list);
		
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

} // end of class
