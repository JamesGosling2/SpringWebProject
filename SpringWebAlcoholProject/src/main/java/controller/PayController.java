package controller;

import dao.BuyDAO;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import util.Buy;
import util.NicePayKey;
import vo.OrderListVO;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.OffsetDateTime;
import java.util.*;

@Controller
public class PayController implements Buy, NicePayKey {
	@Autowired
	BuyDAO buydao;

	private final RestTemplate restTemplate = new RestTemplate();
	private final ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping("/bill.do")
	public String Bill(HttpServletRequest request, HttpServletResponse response, Model model) {

		HttpSession session = request.getSession();
		UUID id = UUID.fromString(request.getParameter("orderId"));
		String resultCode = request.getParameter("resultCode");
		Timestamp date = Timestamp.valueOf(request.getParameter("date"));
		UserVO user = (UserVO) session.getAttribute("user1");
		if (resultCode.equalsIgnoreCase("0000")) {
			List<OrderListVO> pay_list = buydao.selectOrderList(date, user.getUser1_idx());
			for (int i = 0; i < pay_list.size(); i++) {
				Timestamp paidDate = Timestamp.from(OffsetDateTime.parse(request.getParameter("paidAt")).toInstant());
				buydao.updateOrderlistPaid(pay_list.get(i).getOrderlist_idx(), id, paidDate);
			}
			// 결제 성공 비즈니스 로직 구현
		} else {
			// 결제 실패 비즈니스 로직 구현
		}

		// 응답 request body 로그 확인
//		Enumeration<String> params = request.getParameterNames();
//
//		while (params.hasMoreElements()) {
//			String paramName = params.nextElement();
//			System.out.println(paramName + " : " + request.getParameter(paramName));
//			model.addAttribute(paramName, request.getParameter(paramName));
//		}
		try {
			response.sendRedirect("pay_list.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PAY_RESPONSE;
	}

	@RequestMapping("/cancel.do")
	public String requestCancel(@RequestParam String tid, @RequestParam String amount, Model model,
			HttpServletResponse response) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization",
				"Basic " + Base64.getEncoder().encodeToString((CLIENT_ID + ":" + SECRET_KEY).getBytes()));
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, Object> AuthenticationMap = new HashMap<String, Object>();
		AuthenticationMap.put("amount", amount);
		AuthenticationMap.put("reason", "test");
		AuthenticationMap.put("orderId", UUID.randomUUID().toString());

		HttpEntity<String> request = new HttpEntity<String>(objectMapper.writeValueAsString(AuthenticationMap),
				headers);

		ResponseEntity<JsonNode> responseEntity = restTemplate.postForEntity(
				"https://sandbox-api.nicepay.co.kr/v1/payments/" + tid + "/cancel", request, JsonNode.class);

		JsonNode responseNode = responseEntity.getBody();
		String resultCode = responseNode.get("resultCode").asText();
		model.addAttribute("resultMsg", responseNode.get("resultMsg").asText());

		System.out.println(responseNode.toString());

		if (resultCode.equalsIgnoreCase("0000")) {
			// 취소 성공 비즈니스 로직 구현
		} else {
			// 취소 실패 비즈니스 로직 구현
		}

		try {
			response.sendRedirect("pay_list.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return PAY_RESPONSE;
	}

	@RequestMapping("/hook")
	public ResponseEntity<String> hook(@RequestBody HashMap<String, Object> hookMap) throws Exception {
		String resultCode = hookMap.get("resultCode").toString();

		System.out.println(hookMap);

		if (resultCode.equalsIgnoreCase("0000")) {
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		}

		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
