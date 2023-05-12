package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import service.DetailService;
import service.ReviewService;
import util.Common;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

@Controller
public class DetailViewController {

	private DetailService detailService;
	private ReviewService reviewService;
	
	@Autowired
	ServletContext app;

	@Autowired
	public DetailViewController(DetailService detailService, ReviewService reviewService) {
		this.detailService = detailService;
		this.reviewService = reviewService;
	} // end of constructor


//    @RequestMapping("/detailview.do")
//    public String detailview(Model model, FullViewVO vo){
//        System.out.println("------ detailView.do ------");
//        System.out.println("vo.getProduct_idx() : " + vo.getProduct_idx());
//        FullViewVO vo1 = detailService.selectOne(vo.getProduct_idx());
//        List<ReviewLsjVO> review_list = detailService.review_selectList(vo.getProduct_idx());
//        Map<String, Object> review_map = detailService.review_selectList2(vo.getProduct_idx());
//        System.out.println("vo1 : " + vo1);
//        System.out.println("review_list : " + review_list);
//        System.out.println("review_map : " + review_map);
//
//        model.addAttribute("vo1", vo1);
//        model.addAttribute("review_list", review_list);
//        model.addAttribute("review_map", review_map);

	@RequestMapping("/detailview.do")
	public String detailview(Model model, FullViewVO vo) {
		System.out.println("------ detailView.do ------");
		System.out.println("vo.getProduct_idx() : " + vo.getProduct_idx());
		FullViewVO vo1 = detailService.selectOne(vo.getProduct_idx());
		System.out.println("vo1 : " + vo1);
		double review_score = reviewService.avg(vo.getProduct_idx());

		int dot = (int) (review_score * 10) % 10;
		int num = (int) (review_score * 10) / 10;

		if (dot < 5) {
			dot = 0;
		} else if (dot < 8) {
			dot = 5;
		} else if (dot == 0) {
			dot = 0;
		} else {
			num++;
		}

		review_score = num + (double) dot / 10.0;

		model.addAttribute("review_score", review_score);
		model.addAttribute("vo1", vo1);

		return Common.Detail_view.VIEW_PATH + "product_detail_view.jsp";
	} // end of detailview()
	
	@RequestMapping("/modify.do")
	public String modify(Model model, int product_idx) {
		FullViewVO vo = detailService.selectOne(product_idx);
		model.addAttribute("vo1", vo);
		return Common.Detail_view.VIEW_PATH + "detail_modify.jsp";
	}
	
	@RequestMapping("/product_modify.do")
	public String product_modify(FullViewVO vo) {
		String currentDirectory = System.getProperty("user.dir");
		List<String> path = new ArrayList<String>();
		while(new File(currentDirectory).getParent() != null) {
			currentDirectory = new File(currentDirectory).getParent();
			path.add(currentDirectory);
			System.out.println(currentDirectory);
		}
		currentDirectory = path.get(path.size() - 2);
        currentDirectory +="\\work2\\SpringWebAlcoholProject\\src\\main\\webapp\\resources\\alcohol_image\\";

		String savePath = currentDirectory;
		String realPath = app.getRealPath(savePath);
		
		System.out.println(realPath);
		System.out.println(currentDirectory);
		
		MultipartFile thumbnail = vo.getThumbnail();
		MultipartFile filename1 = vo.getFilename1();
		MultipartFile filename2 = vo.getFilename2();

		String product_filename1 = "no_file";
		String product_filename2 = "no_file";

        String product_thumbnail_filename = "no_file";

        if(!thumbnail.isEmpty()){
            // DB에 추가할 실제 파일 이름
        	product_thumbnail_filename = thumbnail.getOriginalFilename();
        	product_filename1 = filename1.getOriginalFilename();
    		product_filename2 = filename2.getOriginalFilename();

            // 파일을 저장할 절대경로
            File saveFile = new File(savePath, product_thumbnail_filename);
            File saveFile1 = new File(savePath, product_filename1);
            File saveFile2 = new File(savePath, product_filename2);
            if(!saveFile.exists()){
                saveFile.mkdirs(); // 절대경로에 upload라는 이름의 폴더를 생성한다.
                // 그냥 두면 이미지 파일이 만들어 지는게 아니라 폴더로 다 만들어 진다.
            } else {
                // 동일파일일 경우 현재 업로드 시간을 붙여서 이름변경
                long time = System.currentTimeMillis();
                product_thumbnail_filename = String.format("%d_%s", time, product_thumbnail_filename);
                product_filename1 = String.format("%d_%s", time, product_filename1);
                product_filename2 = String.format("%d_%s", time, product_filename2);
                saveFile = new File(savePath, product_thumbnail_filename);
                saveFile1 = new File(savePath, product_filename1);
                saveFile2 = new File(savePath, product_filename2);
            }

            try {
                // 업로드를 요청한 파일은 MultipartResolver클래스가 임시저장소에 보관한다.
                // 임시 저장소에 보관된 파일은 일정 시간이 지나면 사라지므로, 절대경로 위치에
                // 이미지를 물리적으로 복사해 넣어야 한다.
                thumbnail.transferTo(saveFile);
                filename1.transferTo(saveFile1);
                filename2.transferTo(saveFile2);
                

            } catch (Exception e){
                e.printStackTrace();
            }
        }
        
        vo.setProduct_thumbnail_filename(product_thumbnail_filename);
		vo.setProduct_filename1(product_filename1);
		vo.setProduct_filename2(product_filename2);
        
		int i = detailService.product_modify(vo);
		return "redirect:/detailview.do?product_idx="+vo.getProduct_idx();
	}


	// sdfssdfsdf

} // end of class
