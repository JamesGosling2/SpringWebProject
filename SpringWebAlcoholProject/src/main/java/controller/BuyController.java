package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BuyDAO;
import util.Buy;
import vo.FullViewVO;
import vo.OrderListVO;

@Controller
public class BuyController implements Buy {

	@Autowired
	ServletContext app;

	@Autowired
	BuyDAO buydao;

	@RequestMapping("/buy_product.do")
	@ResponseBody
	public int buyProduct(int idx) {
		return buydao.selectProduct(idx).getProduct_price();
	}

	@RequestMapping("/cartAdd.do")
	public String cartAdd(int idx, int amount, int price, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<OrderListVO> cart = (List<OrderListVO>) (session.getAttribute("cart"));

		if (cart == null) {
			cart = new ArrayList<OrderListVO>();
		}

		boolean isExist = false;
		for (OrderListVO item : cart) {
			if (item.getProduct_idx() == idx) {
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			OrderListVO cart_input = new OrderListVO();
			cart_input.setProduct_idx(idx);
			cart.add(cart_input);
		}

		session.setAttribute("cart", cart);
		List<FullViewVO> cart_in = buydao.selectProducts(cart);
		System.out.println(cart_in.size());
		model.addAttribute("cart_in", cart_in);

		return CART_IN;
	}
}
