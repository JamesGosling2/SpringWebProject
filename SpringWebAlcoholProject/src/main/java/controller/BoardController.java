package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.BoardService;
import util.Common;
import util.Paging;
import vo.BoardVO;
import vo.UserVO;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    private BoardService service;

    @Autowired
    private ServletContext app;

    @Autowired
    private HttpSession session;

    @Autowired
    public BoardController(BoardService service) {
        this.service = service;
    } // end of constructor

    @RequestMapping("board_list.do")
    public String board_list(Model model, String page, String search, String search_text){
        System.out.println("===== board_list.do =====");

        int nowPage = 1;

        if(page != null && !page.isEmpty()) {
            nowPage = Integer.parseInt(page);
        }

        // 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
        // 1페이지 : 1 ~ 5 까지의 게시글
        // 2페이지 : 6 ~ 10 까지의 게시글
        int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
        int end = start + Common.Board.BLOCKLIST - 1;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);

        // 페이지 select
        Map<String, Object> board_map = service.board_list(map);
        System.out.println("board_map : " + board_map);
        System.out.println("board_list : " + board_map.get("board_list"));
        System.out.println("user_list : " + board_map.get("user_list"));

        // 페이지 메뉴 생성
        int row_total = service.getRowTotal(map);

        String search_param = String.format("search=%s&search_text=%s", search, search_text);

        String pageMenu = Paging.getPaging("board_list.do", nowPage, row_total, search_param, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);

        // System.out.println("pageMenu : " + pageMenu);
        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("board_map", board_map);

        session.removeAttribute("readhitCheck");

        return Common.Board.VIEW_PATH + "board_list.jsp";
    } // end of board_list()

    @RequestMapping("board_detail_view.do")
    public String board_detail(Model model, int board1_idx, int user1_idx){
        System.out.println("===== board_detail_view.do =====");
        System.out.println("board_idx : " + board1_idx);
        System.out.println("user1_idx : " + user1_idx);
        
        // 새로고침으로 조회수 증가 방지를 위한 session에 check 추가
        String readhitCheck = (String) session.getAttribute("readhitCheck");

        if(readhitCheck == null){
            int res = service.board_modify_readhit(board1_idx);
            session.setAttribute("readhitCheck", "");
        }

        BoardVO board_vo = service.board_selectOne(board1_idx);
        UserVO user_vo = service.user_selectOne(user1_idx);
        System.out.println("board_vo, subject : " + board_vo.getBoard1_subject());
        System.out.println("user_vo, subject : " + user_vo.getUser1_name());

        // 댓글 검색
        Map<String, Object> board_reply_map = service.board_reply_selectMap(board_vo.getBoard1_ref());
        System.out.println("board_reply_list : " + board_reply_map.get("board_reply_list"));
        System.out.println("user_list : " + board_reply_map.get("user_list"));

        model.addAttribute("board_vo", board_vo);
        model.addAttribute("user_vo", user_vo);
        model.addAttribute("board_reply_map", board_reply_map);

        return Common.Board.VIEW_PATH + "board_detail.jsp";
    } // end of board_detail()

    @RequestMapping("board_write.do")
    public String board_write(){
        return Common.Board.VIEW_PATH + "board_write.jsp";
    } // end of board_write()


    @RequestMapping("board_insert.do")
    public String board_insert(BoardVO board_vo){
        System.out.println("===== board_insert =====");
        System.out.println("board_vo : " + board_vo);
        System.out.println("user1_idx : " + board_vo.getUser1_idx());

        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        // 업로드된 파일 정보
        MultipartFile board_photo = board_vo.getBoard1_photo();
        System.out.println("board1_photo : " + board_photo);

        String board_filename = "no_file";

        if(!board_photo.isEmpty()){
            // DB에 추가할 실제 파일 이름
            board_filename = board_photo.getOriginalFilename();

            // 파일을 저장할 절대경로
            File saveFile = new File(savePath, board_filename);
            if(!saveFile.exists()){
                saveFile.mkdirs(); // 절대경로에 upload라는 이름의 폴더를 생성한다.
                // 그냥 두면 이미지 파일이 만들어 지는게 아니라 폴더로 다 만들어 진다.
            } else {
                // 동일파일일 경우 현재 업로드 시간을 붙여서 이름변경
                long time = System.currentTimeMillis();
                board_filename = String.format("%d_%s", time, board_filename);
                saveFile = new File(savePath, board_filename);
            }

            try {
                // 업로드를 요청한 파일은 MultipartResolver클래스가 임시저장소에 보관한다.
                // 임시 저장소에 보관된 파일은 일정 시간이 지나면 사라지므로, 절대경로 위치에
                // 이미지를 물리적으로 복사해 넣어야 한다.
                board_photo.transferTo(saveFile);

            } catch (Exception e){
                e.printStackTrace();
            }
        }

        int user1_idx = board_vo.getUser1_idx();
        System.out.println("board_subject : " + board_vo.getBoard1_subject());
        System.out.println("board_content : " + board_vo.getBoard1_content());
        System.out.println("board_readhit : " + board_vo.getBoard1_readhit());
        System.out.println("board_ref : " + board_vo.getBoard1_ref());
        System.out.println("board_step : " + board_vo.getBoard1_step());
        System.out.println("board_depth : " + board_vo.getBoard1_depth());

        board_vo.setBoard1_filename(board_filename);
        int res = service.board_insert(board_vo);
        System.out.println("res : " + res);

        return "redirect:/board_list.do";
    } // end of board_insert()

    @RequestMapping("board_reply_view.do")
    public String board_reply_view(Model model, int board1_idx, int user1_idx){
        System.out.println("----- board_reply_view.do -----");
        System.out.println("board1_idx : " + board1_idx);
        System.out.println("user1_idx : " + user1_idx);
        BoardVO board_vo = service.board_selectOne(board1_idx);
        UserVO user_vo = service.user_selectOne(user1_idx);

        model.addAttribute("board_vo", board_vo);
        model.addAttribute("user_vo", user_vo);

        return Common.Board.VIEW_PATH + "board_reply_write.jsp";
    } // end of board_reply_view()

    @RequestMapping("board_reply_insert.do")
    public String board_reply_insert(Model model, BoardVO board_vo){
        System.out.println("------ board_reply_insert.do ------");
        System.out.println("board1_idx : " + board_vo.getBoard1_idx());

        // 원본글 검색 후 저장
        BoardVO originBoard_vo = service.board_selectOne(board_vo.getBoard1_idx());
        // 기존글 step 모두 +1
        int res_step = service.board_update_step(originBoard_vo);

        board_vo.setBoard1_readhit(0);
        board_vo.setBoard1_ref(originBoard_vo.getBoard1_ref());
        board_vo.setBoard1_step(originBoard_vo.getBoard1_step() + 1);
        board_vo.setBoard1_depth(originBoard_vo.getBoard1_depth() + 1);

        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        // 업로드된 파일 정보
        MultipartFile board_photo = board_vo.getBoard1_photo();

        String board_filename = "no_file";

        board_vo.setBoard1_filename(board_filename);

        int res_reply = service.board_insert_reply(board_vo);

        return "redirect:/board_detail_view.do?board1_idx=" + Integer.toString(originBoard_vo.getBoard1_idx()) + "&user1_idx=" + Integer.toString(originBoard_vo.getUser1_idx());
    } // end of board_reply_insert()

    @RequestMapping("board_modify_form.do")
    public String board_modify_form(Model model, int board1_idx, int user1_idx){
        System.out.println("------ board_modify_form.do ------");
        BoardVO board_vo = service.board_selectOne(board1_idx);
        UserVO user_vo = service.user_selectOne(user1_idx);
        System.out.println("board_vo : " + board_vo);
        System.out.println("user_vo : " + user_vo);

        model.addAttribute("board_vo", board_vo);
        model.addAttribute("user_vo", user_vo);

        return Common.Board.VIEW_PATH + "board_modify_form.jsp";
    } // end of board_modify_form()

    @RequestMapping("board_modify.do")
    public String board_modify(BoardVO board_vo){
        System.out.println("----- board_modify.do -----");
        System.out.println("board_vo.board1_idx : " + board_vo.getBoard1_idx());

        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        // 업로드된 파일 정보
        MultipartFile board_photo = board_vo.getBoard1_photo();

        String board_filename = "no_file";

        if(!board_photo.isEmpty()){
            // DB에 추가할 실제 파일 이름
            board_filename = board_photo.getOriginalFilename();

            // 파일을 저장할 절대경로
            File saveFile = new File(savePath, board_filename);
            if(!saveFile.exists()){
                saveFile.mkdirs(); // 절대경로에 upload라는 이름의 폴더를 생성한다.
                // 그냥 두면 이미지 파일이 만들어 지는게 아니라 폴더로 다 만들어 진다.
            } else {
                // 동일파일일 경우 현재 업로드 시간을 붙여서 이름변경
                long time = System.currentTimeMillis();
                board_filename = String.format("%d_%s", time, board_filename);
                saveFile = new File(savePath, board_filename);
            }

            try {
                // 업로드를 요청한 파일은 MultipartResolver클래스가 임시저장소에 보관한다.
                // 임시 저장소에 보관된 파일은 일정 시간이 지나면 사라지므로, 절대경로 위치에
                // 이미지를 물리적으로 복사해 넣어야 한다.
                board_photo.transferTo(saveFile);

            } catch (Exception e){
                e.printStackTrace();
            }
        }
        board_vo.setBoard1_filename(board_filename);

        int res = service.board_modify(board_vo);

        return "redirect:/board_detail_view.do?board1_idx=" + board_vo.getBoard1_idx() + "&user1_idx=" + board_vo.getUser1_idx();
    } // end of board_modify()

    @RequestMapping("board_delete.do")
    public String board_delete(int board1_idx, String page){
        System.out.println("===== board_delete.do =====");
        int res = service.board_delete(board1_idx);
        System.out.println("res : " + res);

        return "redirect:/board_list.do?page=" + page;
    } // end of board_delete()

    @ResponseBody
    @RequestMapping("board_reply_delete.do")
    public String board_reply_delete(String board1_idx){
        int board2_idx = Integer.parseInt(board1_idx);
        System.out.println("===== board_delete.do =====");
        int res = service.board_delete(board2_idx);
        System.out.println("res : " + res);
        String result = "삭제 실패";
        if(res == 1){
            result = "삭제된 댓글입니다.";
        }

        return result;
    } // end of board_reply_delete()

    @RequestMapping("reply_modify_form.do")
    public String reply_modify_form(Model model, int board1_idx, int user1_idx){
        System.out.println("------ board_modify_form.do ------");
        BoardVO board_vo = service.board_selectOne(board1_idx);
        UserVO user_vo = service.user_selectOne(user1_idx);
        BoardVO original_board_vo = service.board_selectOne(board_vo.getBoard1_ref());
        UserVO original_user_vo = service.user_selectOne(original_board_vo.getUser1_idx());
        System.out.println("board_vo : " + board_vo);
        System.out.println("user_vo : " + user_vo);

        model.addAttribute("board_vo", board_vo);
        model.addAttribute("user_vo", user_vo);
        model.addAttribute("original_board_vo", original_board_vo);
        model.addAttribute("original_user_vo", original_user_vo);

        return Common.Board.VIEW_PATH + "board_reply_modify_form.jsp";
    } // end of board_modify_form()

    @RequestMapping("board_reply_modify.do")
    public String board_reply_modify(BoardVO board_vo){
        System.out.println("----- board_reply_modify.do -----");
        System.out.println("board_vo.board1_idx : " + board_vo.getBoard1_idx());

        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        String board_filename = "no_file";

        board_vo.setBoard1_filename(board_filename);

        int res = service.board_modify(board_vo);
        System.out.println("res : " + res);

        BoardVO original_board_vo = service.board_selectOne(board_vo.getBoard1_ref());

        return "redirect:/board_detail_view.do?board1_idx=" + original_board_vo.getBoard1_idx() + "&user1_idx=" + original_board_vo.getUser1_idx();
    } // end of board_reply_modify()

} // end of class




























