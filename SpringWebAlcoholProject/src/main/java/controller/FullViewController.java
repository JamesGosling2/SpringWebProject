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
		System.out.println("FullViewController : " + service );
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
		
		//System.out.println(vo.getProduct_type());
		List<FullViewVO> product_list = service.search_select(vo);
		int product_count = service.selectSearchCount(vo);
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
	
	

}
