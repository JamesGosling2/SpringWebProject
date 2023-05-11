package controller;

import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import util.Buy;
import util.NicePayKey;

@Controller
public class PayController implements Buy, NicePayKey {

	private final RestTemplate restTemplate = new RestTemplate();
	private final ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping(value = "/cancel")
	public String cancelDemo() {
		return "/cancel";
	}
	
	@RequestMapping("/bill.do")
	public String Bill(HttpServletRequest request, Model model) {
		UUID id = UUID.fromString(request.getParameter("orderId"));
		String resultMsg = request.getParameter("resultMsg");
		String resultCode = request.getParameter("resultCode");
		model.addAttribute("orderId", id);
		model.addAttribute("clientId", CLIENT_ID);
		model.addAttribute("resultMsg", resultMsg);

		if (resultCode.equalsIgnoreCase("0000")) {
			// 결제 성공 비즈니스 로직 구현
		} else {
			// 결제 실패 비즈니스 로직 구현
		}

		// 응답 request body 로그 확인
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramName = params.nextElement();
			System.out.println(paramName + " : " + request.getParameter(paramName));
		}

		return PAY_RESPONSE;
	}

	@RequestMapping("/cancelAuth")
	public String requestCancel(@RequestParam String tid, @RequestParam String amount, Model model) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization",
				"Basic " + Base64.getEncoder().encodeToString((CLIENT_ID + ":" + SECRET_KEY).getBytes()));
		headers.setContentType(MediaType.APPLICATION_JSON);

		Map<String, Object> AuthenticationMap = new HashMap<String, Object>();
		AuthenticationMap.put("amount", amount);
		AuthenticationMap.put("reason", "test");
		AuthenticationMap.put("orderId", UUID.randomUUID().toString());

		HttpEntity<String> request = new HttpEntity<String>(objectMapper.writeValueAsString(AuthenticationMap), headers);

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

		return "/response";
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
