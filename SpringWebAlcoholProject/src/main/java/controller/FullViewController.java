package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FullViewDAO;
import service.FullViewService;
import util.Common;
import vo.FullViewVO;
import vo.SearchVO;

@Controller
public class FullViewController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	private FullViewService service;

	@Autowired
	public FullViewController(FullViewService service) {
		this.service = service;
		System.out.println("FullViewController : " + service);
	}

	@RequestMapping("/fullview.do")
	public String selectList(Model model) {
		List<FullViewVO> product_list = service.selectList();
		int product_count = service.selectCount();
		model.addAttribute("product_count", product_count);
		model.addAttribute("product_list", product_list);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/search.do")
	public String search_select(Model model, SearchVO vo) {

		List<FullViewVO> product_list = service.search_select(vo);
		int product_count = service.selectSearchCount(vo);
		System.out.println(vo.getProducer_name());
		System.out.println(vo.getTerm());
		if (vo.getProducer_name() != null) {
			model.addAttribute("producer_name" + vo.getProducer_name());
		}
		if (vo.getTerm() != null) {
			model.addAttribute("term" + vo.getTerm());
		}
		System.out.println(product_list.size());
		model.addAttribute("product_list", product_list);
		model.addAttribute("selection", vo);
		model.addAttribute("product_count", product_count);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/typing_search.do")
	public String typing_search(Model model, String search) {
		List<FullViewVO> product_list = service.typing_search(search);
		int product_count = service.typing_searchCount(search);
		model.addAttribute("product_list", product_list);
		model.addAttribute("product_count", product_count);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/new_product.do")
	public String new_product(Model model) {
		List<FullViewVO> new_product_list = service.new_product();
		int new_product_count = service.new_product_count();
		model.addAttribute("product_list", new_product_list);
		model.addAttribute("product_count", new_product_count);
		model.addAttribute("term", "10");
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/best_product.do")
	public String best_product(Model model) {
		List<FullViewVO> best_product_list = service.best_product();
		int best_product_count = service.best_product_count();
		model.addAttribute("product_list", best_product_list);
		model.addAttribute("product_count", best_product_count);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";

	}

}
