package controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import kakaologin.KakaoLoginBO;
import naverlogin.NaverLoginBO;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.KakaoLoginService;
import service.TotalService;
import util.Common;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private HttpServletRequest request;

    private HttpSession session;

    private TotalService service;

    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    private String apiResult2 = null;

    private KakaoLoginBO kakaoLoginBO;
    private KakaoLoginService kakaoLoginService;

    @Autowired
    public void setKakaoLoginService(KakaoLoginService kakaoLoginService) {
        this.kakaoLoginService = kakaoLoginService;
    }

    @Autowired
    public LoginController(TotalService service, NaverLoginBO naverLoginBO, KakaoLoginBO kakaoLoginBO, HttpSession session) {
        this.session = session;
        this.service = service;
        this.naverLoginBO = naverLoginBO;
        this.kakaoLoginBO = kakaoLoginBO;
        System.out.println("naverLoginBO 객체 : " + naverLoginBO);
        System.out.println("kakaoLoginBO 객체 : " + kakaoLoginBO);
    } // end of constructor

    @RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model, String check, String user_email, String user_pwd) {
        if(session.getAttribute("user1") != null){
            model.addAttribute("isUser1", "loginState");
            System.out.println("----- 세션 정보 저장됨 -----");
            return Common.Main.VIEW_PATH + "main.jsp";
        }

        model.addAttribute("check", check);
        model.addAttribute("user_email", user_email);
        model.addAttribute("user_pwd", user_pwd);
        System.out.println("----- login.do -----");
        System.out.println(user_email);
        System.out.println(user_pwd);

        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of login()

    @RequestMapping(value = "/naverUrl.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String naverUrl() {
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        System.out.println("네이버 : " + naverAuthUrl);

        return "redirect:" + naverAuthUrl;
    } // end of naverUrl()

    @RequestMapping(value = "/kakaoUrl.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoUrl() {
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);

        System.out.println("카카오 : " + kakaoAuthUrl);

        return "redirect:" + kakaoAuthUrl;
    } // end of kakaoUrl()

    // 네이버 callback
    @RequestMapping(value = "/callback.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String naverCallback(Model model, @RequestParam String code, @RequestParam String state) throws Exception {
        System.out.println("naver callBack 실행됨");
        // System.out.println(code);
        // System.out.println(state);
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        System.out.println("naverCallback, oauthToken : " + oauthToken);
        // 로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        // 프로필 조회
        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");
        String birthday = (String) response_obj.get("birthday");
        String birthyear = (String) response_obj.get("birthyear");

        String birthdate = birthyear + birthday.substring(0, 2) + birthday.substring(3, 5);

        UserVO vo = service.selectOne(email);
        System.out.println("----- navercallback.do ----- ");
        System.out.println("vo : " + vo);
        System.out.println("email : " + email);

        if(vo != null){
            System.out.println("----- navercallback.do, vo null 아님 if문 실행 -----");

            return "loginSuccess.do?user1_email=" + email;
        }

        // 세션에 사용자 정보 등록
        model.addAttribute("signIn", apiResult);
        model.addAttribute("email", email);
        model.addAttribute("name", name);
        model.addAttribute("birthdate", birthdate);

        return "redirect:/naver_register_form.do";
    } // end of callback()

    // 카카오 callback
    @RequestMapping(value = "/kakaoCallback.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoCallback(Model model, @RequestParam String code){
        System.out.println("kakao callback 실행 됨");
        String access_token = kakaoLoginService.getKakaoAccessToken(code);
        System.out.println("access_token : " + access_token);

        HashMap<String, Object> userInfo = kakaoLoginService.getKakaoUserInfo(access_token);
        model.addAttribute("userInfo", userInfo);

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of kakaoCallback()

    // 카카오 callback
    /*@RequestMapping(value = "/kakaoCallback.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoCallback(Model model, @RequestParam String code, @RequestParam String state) throws Exception {
        System.out.println("kakao callback 실행 됨");
        // OAuth2AccessToken oAuth2AccessToken;
        // oAuth2AccessToken = kakaoLoginBO.getAccessToken(session, code, state);
        System.out.println("code : " + code);
        String accessToken = kakaoLoginBO.getAccessToken(session, code, state);
        // System.out.println("oAuth2AccessToken : " + oAuth2AccessToken);
        System.out.println("accessToken : " + accessToken);

        // 사용자 정보
        Map<String, Object> userInfo = kakaoLoginBO.getUserInfo(accessToken);
        System.out.println("userInfo : " + userInfo);
        model.addAttribute("userInfo", userInfo);


        // 로그인 사용자 정보를 읽어옴
        // apiResult2 = kakaoLoginBO.getUserProfile(oAuth2AccessToken);

        *//*JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult2);
        JSONObject response_obj1 = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj1.get("profile");

        // 프로필 조회
        String email = (String) response_obj1.get("email");
        String name = (String) response_obj2.get("nickname");
        System.out.println(email);
        System.out.println(name);

        // 세션에 사용자 정보 등록
        model.addAttribute("signIn", apiResult2);
        model.addAttribute("email", email);
        model.addAttribute("name", name);*//*

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of kakaocallback()*/

    @RequestMapping("/naver_register_form.do")
    public String naver_register_form(Model model, String name, String email, String birthdate) {
        // 네이버  로그인 정보 받아옴
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("birthdate", birthdate);

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of register()

    @RequestMapping("/register_form.do")
    public String register_form(Model model) {
        // 네이버  로그인 정보 받아옴

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of register()

    @RequestMapping("/register_detail_form.do")
    public String register_detail_form(Model model, UserVO vo) {
        model.addAttribute("vo", vo);
        return Common.Login.VIEW_PATH + "register_detail.jsp";
    } // end of register_detail()

    @RequestMapping("/register.do")
    public String register(Model model, UserVO vo) {
        int res = service.insert(vo);
        System.out.println(res);
        int check = 0;
        // 회원가입 성공, 실패, 첫 로드 확인
        if (res == 1) {
            check = 1;
        } else {
            check = 2;
        }
        model.addAttribute("check", check);
        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of register()

    @RequestMapping(value = "/user_login.do", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String user_login(UserVO vo) {
        System.out.println("------ user_login.do, vo 확인 ------");
        System.out.println("vo객체 : " + vo);
        System.out.println("vo.getUser1_email : " + vo.getUser1_email());
        System.out.println("vo.getUser1_pwd : " + vo.getUser1_pwd());

        String user_email = vo.getUser1_email();
        String user_pwd = vo.getUser1_pwd();


        String result = "";
        UserVO vo1 = service.selectOne(user_email);
        System.out.println("------ user_login.do, vo1 확인 ------");
        System.out.println("vo1 객체 : " + vo1);
        // System.out.println("vo1 이름 : " + vo1.getUser1_email());
        // System.out.println("vo1 비번 : " + vo1.getUser1_pwd());

        if (vo1 != null) {
            if (!user_email.equals(vo1.getUser1_email())) {
                System.out.println("----- if문 1 -----");
                result = "아이디 불일치";
                System.out.println("result : " + result);
            } else if (!user_pwd.equals(vo1.getUser1_pwd())) {
                System.out.println("----- if문 2 -----");
                result = "비밀번호 불일치";
                System.out.println("result : " + result);
            } else {
                System.out.println("----- if문 3 -----");
                result = "로그인 성공";
                System.out.println("result : " + result);
            }
        } else {
            System.out.println("----- if문 4 -----");
            result = "아이디 불일치";
            System.out.println("result : " + result);
        }

        return result;
    } // end of user_login()

    @RequestMapping("login_result.do")
    public String login_result(String check) {
        System.out.println("login_result() : " + check);
        return "redirect:/login.do?check=" + check;
    } // end of login_result()

    @RequestMapping("idMismatch.do")
    public String idMismatch(Model model, String user_email, String user_pwd) {
        System.out.println("----- idMismatch -----");
        System.out.println(user_email);
        System.out.println(user_pwd);

        model.addAttribute("user_email", user_email);
        model.addAttribute("user_pwd", user_pwd);

        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of idMismatch()

    @RequestMapping("loginSuccess.do")
    public String loginSuccess(String user1_email){
        System.out.println("----- loginSuccess.do 실행 -----");
        System.out.println("user1_email : " + user1_email);
        UserVO vo = service.selectOne(user1_email);
        System.out.println("vo : " + vo);
        session.setAttribute("user1", vo);

        return Common.Main.VIEW_PATH + "main.jsp";
    } // end of loginSuccess()

    @RequestMapping("logout.do")
    public String logout(){
        session.removeAttribute("user1");
        return "redirect:/login.do";
    } // end of logout()

    @RequestMapping(value = "loginMismatch.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginMismatch(Model model, String modal_email, String modal_pwd){
        System.out.println("----- loginMismatch.do -----");
        System.out.println("modal_email : " + modal_email);
        System.out.println("modal_pwd : " + modal_pwd);
        model.addAttribute("modal_email", modal_email);
        model.addAttribute("modal_pwd", modal_pwd);
        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of loginMismatch()

    @RequestMapping(value = "idRepetitionCheck.do", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String idRepetitionCheck(String user1_email){
        UserVO vo = service.selectOne(user1_email);
        System.out.println("----- idRepetition.do -----");
        System.out.println("vo : " + vo);
        System.out.println("user1_email : " + user1_email);

        String result = "";
        if(vo == null){
            result = "가능";
        } else{
            result = "불가능";
        }

        System.out.println("result : " + result);
        return result;
    } // end of idRepetitionCheck()

    @RequestMapping("my_information_modify.do")
    public String myInformationModify() {
        System.out.println("----- my_information_modify.do -----");

        return Common.Login.VIEW_PATH + "register_modify.jsp";
    } // end of myInformationModify()

    @RequestMapping("register_modify.do")
    public String registerModify(Model model, UserVO vo) throws IllegalAccessException {

        System.out.println("----- register_modify.do -----");
        Object voObj = vo;
        for(Field field : voObj.getClass().getDeclaredFields()){
            field.setAccessible(true);
            Object value = field.get(voObj);
            System.out.println("field : " + field.getName() + " , value : " + value);
        } // end of for

        int res = service.update(vo);

        model.addAttribute("res", res);
        return Common.Main.VIEW_PATH + "main.jsp";
    } // end of registerModify()

    @ResponseBody
    @RequestMapping(value = "formValid.do", produces = "application/json;charset=UTF-8")
    public String formValid(@RequestParam String isCheck){
        System.out.println("===== formValid.do =====");
        String result = "";
        System.out.println("isCheck : " + isCheck);

        if(isCheck.equals("1")){
            result = "1";
        } else if(isCheck.equals("2")){
            result = "2";
        }

        System.out.println("result : " + result);
        return result;
    } // end of formValid()

} // end of class
