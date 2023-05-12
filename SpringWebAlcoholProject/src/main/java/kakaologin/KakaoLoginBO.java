package kakaologin;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.codehaus.jackson.JsonParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class KakaoLoginBO {
    // 카카오 로그인 정보
    private final static String KAKAO_CLIENT_ID = "53adf38e6cd2f79c7a5826586aa96ed8";
    // private final static String KAKAO_CLIENT_SECRET = "a2HkDXc8LoDCXMq2rg3foyLhmWKSP3Wv";
    private final static String KAKAO_REDIRECT_URI = "http://localhost:9090/kakaoCallback.do";
    private final static String SESSION_STATE = "oauth_state_kakao";
    private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";

    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        System.out.println("----- getAuthorizationUrl 메서드 -----");
        System.out.println("state : " + state);
        setSession(session, state);

        OAuth20Service oAuth20Service = new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                // .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI)
                .state(state)
                .build(KakaoLoginApi.getInstance());
        return oAuth20Service.getAuthorizationUrl();
    } // end of getAuthorizationUrl()

    public String getAccessToken(HttpSession session, String code, String state) throws Exception {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=3951fe07922dbdbd33f02177d181a7ba"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:9090/kakaoCallback.do"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // jackson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JSONParser parser = new JSONParser();
            JSONObject jsonObj;

            jsonObj = (JSONObject) parser.parse(result);
            access_Token = jsonObj.get("access_token").toString();
            refresh_Token = jsonObj.get("refresh_token").toString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;

    } // end of getAccessToken()

    /*public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
        String sessionState = getSession(session);
        System.out.println("------ getAccessToken 메서드 ------");
        System.out.println("sessionState : " + sessionState);
        System.out.println("state : " + state);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oAuth20Service = new ServiceBuilder()
                    .apiKey(KAKAO_CLIENT_ID)
                    .apiSecret(KAKAO_CLIENT_SECRET)
                    .callback(KAKAO_REDIRECT_URI)
                    .state(state)
                    .build(KakaoLoginApi.getInstance());
            OAuth2AccessToken accessToken = oAuth20Service.getAccessToken(code);
            System.out.println("if문 안으로 들어와서 getAccessToken 메서드 실행됨");
            System.out.println("accessToken : " + accessToken);
            return accessToken;
        }
        return null;
    } // end of getAccessToken()*/

    public String getUserProfile(OAuth2AccessToken oAuth2AccessToken) throws Exception {
        OAuth20Service oAuth20Service = new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                // .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI)
                .build(KakaoLoginApi.getInstance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oAuth20Service);
        oAuth20Service.signRequest(oAuth2AccessToken, request);
        Response response = request.send();
        return response.getBody();
    } // end of getUserProfile()

    public Map<String, Object> getUserInfo(String access_token) throws IOException {
        System.out.println("------ getUserInfo ------");
        String host = "https://kapi.kakao.com/v2/user/me";
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            URL url = new URL(host);

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
            System.out.println("Authorization : " + urlConnection.getRequestProperty("Authorization"));
            urlConnection.setRequestMethod("POST");

            int responseCode = urlConnection.getResponseCode();
            System.out.println("responseCode = " + responseCode);


            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line = "";
            String res = "";
            while((line=br.readLine())!=null)
            {
                res+=line;
            }

            System.out.println("res = " + res);


            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(res);
            JSONObject kakao_account = (JSONObject) obj.get("kakao_account");
            JSONObject properties = (JSONObject) obj.get("properties");


            // String id = obj.get("id").toString();
            String nickname = properties.get("nickname").toString();
            String age_range = kakao_account.get("age_range").toString();

            // result.put("id", id);
            result.put("nickname", nickname);
            result.put("age_range", age_range);

            br.close();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e){
            e.printStackTrace();
        }

        return result;
    } // end of getUserInfo

    private String generateRandomString() {
        return UUID.randomUUID().toString();
    } // end of generateRandomString()

    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    } // end of setSession()

    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    } // end of getSession()

} // end of class
