package service;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

@Service
public class KakaoLoginService {

    public String getKakaoAccessToken(String code) {
        System.out.println("===== getKakaoAccessToken() =====");
        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=53adf38e6cd2f79c7a5826586aa96ed8");
            sb.append("&redirect_uri=http://localhost:9090/kakaoCallback.do");
            sb.append("&code=" + code);

            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON 타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            // Jackson으로 불러오기
            JSONParser parser = new JSONParser();
            JSONObject jsonObject;

            jsonObject = (JSONObject) parser.parse(result);
            access_token = jsonObject.get("access_token").toString();
            refresh_token = jsonObject.get("refresh_token").toString();

            System.out.println("access_token : " + access_token);
            System.out.println("refresh_token : " + refresh_token);

            br.close();
            bw.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return access_token;
    } // end of getKakaoAccessToken()

    public HashMap<String, Object> getKakaoUserInfo(String access_token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();

        System.out.println("===== getKakaoUserInfo() =====");
        String reqURL = "https://kapi.kakao.com/v2/user/me";

        // access_token을 이용하여 사용자 정보 조회
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON 타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("responseBody : " + result);

            // Jackon 라이브러리로 파싱
            JSONParser parser = new JSONParser();
            JSONObject jsonObject;

            jsonObject = (JSONObject) parser.parse(result);

            String id = jsonObject.get("id").toString();
            JSONObject properties = (JSONObject) jsonObject.get("properties");
            JSONObject kakao_account = (JSONObject) jsonObject.get("kakao_account");

            String nickname = properties.get("nickname").toString();
            boolean has_email = Boolean.parseBoolean(kakao_account.get("has_email").toString());

            if (has_email) {
                String email = kakao_account.get("email").toString();
                userInfo.put("email", email);
                System.out.println("email : " + email);
            } else {
                userInfo.put("email", "");
            }

            userInfo.put("nickname", nickname);
            userInfo.put("has_email", has_email);

            System.out.println("id : " + id);
            System.out.println("nickname : " + nickname);
            System.out.println("has_email : " + has_email);

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userInfo;
    } // end of getKakaoUserInfo()


} // end of class
