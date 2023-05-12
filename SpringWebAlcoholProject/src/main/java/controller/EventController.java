package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import service.EventService;
import util.Common;
import vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext app;
	
	private EventService service;
	
	@Autowired
	public EventController(EventService service) {
		this.service = service;
		
	}
	
	@RequestMapping("/event.do")
	public String selectList(Model model) {
		List<EventVO> event_list = service.selectList();
		model.addAttribute("event_list", event_list);
		return Common.Event.VIEW_PATH + "event_main.jsp";
	}
	
	@RequestMapping("/event_detail.do")
	public String selectOne(Model model, int event_idx) {
		EventVO event_detail = service.selectOne(event_idx);
		model.addAttribute("event_detail", event_detail);
		return Common.Event.VIEW_PATH + "event_detail.jsp";
	}

}
