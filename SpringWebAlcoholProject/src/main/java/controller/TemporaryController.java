package controller;

import dao.FullViewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.FullViewService;
import util.Common;
import vo.FullViewVO;

import java.lang.reflect.Array;
import java.util.List;

@Controller
public class TemporaryController {
    private FullViewService service;

    @Autowired
    public TemporaryController(FullViewService service) {
        this.service = service;
    } // end of constructor

    @RequestMapping("purchaseItemList.do")
    public String purchaseItemList(Model model){
        List<FullViewVO> purchase_lit = service.selectList();
        model.addAttribute("purchase_list", purchase_lit);

        return Common.Temporary_view.VIEW_PATH + "purchaseItem.jsp";
    } // end of purchaseItemList()
} // end of class
