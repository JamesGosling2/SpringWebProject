package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import service.DetailService;
import service.FullViewService;
import service.ReviewLsjService;
import util.Common;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import javax.servlet.ServletContext;
import java.io.File;

@Controller
public class ReviewLsjController {

    private ReviewLsjService reviewService;
    private DetailService detailService;

    @Autowired
    private ServletContext app;

    @Autowired
    public void setDetailService(DetailService detailService) {
        this.detailService = detailService;
    }

    @Autowired
    public ReviewLsjController(ReviewLsjService reviewService) {
        this.reviewService = reviewService;
    } // end of constructor

    @RequestMapping("user_reviewList.do")
    public String user_reviewList() {
        return Common.Review_view2.VIEW_PATH + "user_reviewList.jsp";
    } // end of user_reviewList()

    @RequestMapping("review_write.do")
    public String review_write(Model model, int product_idx) {
        System.out.println("===== review_write.do =====");
        FullViewVO product_vo = detailService.selectOne(product_idx);
        model.addAttribute("product_vo", product_vo);

        return Common.Review_view2.VIEW_PATH + "review_write.jsp";
    } // end of review_write()

    @RequestMapping("review_insert.do")
    public String review_insert(ReviewLsjVO review_vo){
        System.out.println("===== review_insert =====");
        
        // 이미지가 저장될 절대경로
        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        // 업로드된 파일 정보
        MultipartFile review_photo = review_vo.getReview_photo();

        String review_filename = "no_file";

        if(!review_photo.isEmpty()){
            // DB에 추가할 실제 파일 이름
            review_filename = review_photo.getOriginalFilename();

            // 파일을 저장할 절대경로
            File saveFile = new File(savePath, review_filename);
            if(!saveFile.exists()){
                saveFile.mkdirs(); // 절대경로에 upload라는 이름의 폴더를 생성한다.
                // 그냥 두면 이미지 파일이 만들어 지는게 아니라 폴더로 다 만들어 진다.
            } else {
                // 동일파일일 경우 현재 업로드 시간을 붙여서 이름변경
                long time = System.currentTimeMillis();
                review_filename = String.format("%d_%s", time, review_filename);
                saveFile = new File(saveFile, review_filename);
            }

            try {
                // 업로드를 요청한 파일은 MultipartResolver클래스가 임시저장소에 보관한다.
                // 임시 저장소에 보관된 파일은 일정 시간이 지나면 사라지므로, 절대경로 위치에
                // 이미지를 물리적으로 복사해 넣어야 한다.
                review_photo.transferTo(saveFile);

            } catch (Exception e){
                e.printStackTrace();
            }
        }

        review_vo.setReview_filename(review_filename);
        int res = reviewService.review_insert(review_vo);
        System.out.println("res : " + res);

        return "redirect:main.do";
    } // end of review_insert()

} // end of class
