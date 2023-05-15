package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.FullViewDAO;
import service.FullViewService;
import util.Common;
import vo.FullViewVO;
import vo.SearchVO;

@Controller
public class FullViewController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	private FullViewService service;

	@Autowired
	public FullViewController(FullViewService service) {
		this.service = service;
		System.out.println("FullViewController : " + service);
	}

	@RequestMapping("/fullview.do")
	public String selectList(Model model) {
		List<FullViewVO> product_list = service.selectList();
		int product_count = service.selectCount();
		model.addAttribute("product_count", product_count);
		model.addAttribute("product_list", product_list);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/search.do")
	public String search_select(Model model, SearchVO vo) {

		// System.out.println(vo.getProduct_type());
		List<FullViewVO> product_list = service.search_select(vo);
		int product_count = service.selectSearchCount(vo);
		model.addAttribute("product_list", product_list);
		model.addAttribute("selection", vo);
		model.addAttribute("product_count", product_count);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/typing_search.do")
	public String typing_search(Model model, String search) {
		List<FullViewVO> product_list = service.typing_search(search);
		int product_count = service.typing_searchCount(search);
		model.addAttribute("product_list", product_list);
		model.addAttribute("product_count", product_count);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}

	@RequestMapping("/product_insert.do")
	public String product_insert() {
		return Common.full_view.VIEW_PATH + "product_insert.jsp";
	}

	@RequestMapping("/insert.do")
	public String insert(FullViewVO vo) {
		
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

		
		/*
		 * try {
		 * 
		 * thumbnail.transferTo(saveFile); saveFile = new File(savePath,
		 * product_filename1); filename1.transferTo(saveFile); saveFile = new
		 * File(savePath, product_filename2); filename2.transferTo(saveFile);
		 * 
		 * } catch (IllegalStateException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
		 * e.printStackTrace(); }
		 */

		vo.setProduct_thumbnail_filename(product_thumbnail_filename);
		vo.setProduct_filename1(product_filename1);
		vo.setProduct_filename2(product_filename2);

		int i = service.insert(vo);
		return "redirect:/fullview.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int product_idx) {
		int i = service.delete(product_idx);
		return "redirect:/fullview.do";
	}

}
