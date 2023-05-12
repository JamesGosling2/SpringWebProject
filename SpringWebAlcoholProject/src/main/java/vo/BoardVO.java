package vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
    private int board1_idx, user1_idx, board1_readhit, board1_ref, board1_step, board1_depth;
    private String board1_content, board1_subject, board1_regdate, board1_filename;
    private MultipartFile board1_photo;

    public int getBoard1_idx() {
        return board1_idx;
    }

    public void setBoard1_idx(int board1_idx) {
        this.board1_idx = board1_idx;
    }

    public int getUser1_idx() {
        return user1_idx;
    }

    public void setUser1_idx(int user1_idx) {
        this.user1_idx = user1_idx;
    }

    public int getBoard1_readhit() {
        return board1_readhit;
    }

    public void setBoard1_readhit(int board1_readhit) {
        this.board1_readhit = board1_readhit;
    }

    public int getBoard1_ref() {
        return board1_ref;
    }

    public void setBoard1_ref(int board1_ref) {
        this.board1_ref = board1_ref;
    }

    public int getBoard1_step() {
        return board1_step;
    }

    public void setBoard1_step(int board1_step) {
        this.board1_step = board1_step;
    }

    public int getBoard1_depth() {
        return board1_depth;
    }

    public void setBoard1_depth(int board1_depth) {
        this.board1_depth = board1_depth;
    }

    public String getBoard1_content() {
        return board1_content;
    }

    public void setBoard1_content(String board1_content) {
        this.board1_content = board1_content;
    }

    public String getBoard1_subject() {
        return board1_subject;
    }

    public void setBoard1_subject(String board1_subject) {
        this.board1_subject = board1_subject;
    }

    public String getBoard1_regdate() {
        return board1_regdate;
    }

    public void setBoard1_regdate(String board1_regdate) {
        this.board1_regdate = board1_regdate;
    }

    public String getBoard1_filename() {
        return board1_filename;
    }

    public void setBoard1_filename(String board1_filename) {
        this.board1_filename = board1_filename;
    }

    public MultipartFile getBoard1_photo() {
        return board1_photo;
    }

    public void setBoard1_photo(MultipartFile board1_photo) {
        this.board1_photo = board1_photo;
    }
} // end of class
