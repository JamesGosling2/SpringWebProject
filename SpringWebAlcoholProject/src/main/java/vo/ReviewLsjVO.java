package vo;

import org.springframework.web.multipart.MultipartFile;

public class ReviewLsjVO {
    private int review_idx, review_rating, user1_idx, product_idx;
    private String review_content, review_filename, review_regdate;
    private MultipartFile review_photo;

    public MultipartFile getReview_photo() {
        return review_photo;
    }

    public void setReview_photo(MultipartFile review_photo) {
        this.review_photo = review_photo;
    }

    public int getReview_idx() {
        return review_idx;
    }

    public void setReview_idx(int review_idx) {
        this.review_idx = review_idx;
    }

    public int getReview_rating() {
        return review_rating;
    }

    public void setReview_rating(int review_rating) {
        this.review_rating = review_rating;
    }

    public int getUser1_idx() {
        return user1_idx;
    }

    public void setUser1_idx(int user1_idx) {
        this.user1_idx = user1_idx;
    }

    public int getProduct_idx() {
        return product_idx;
    }

    public void setProduct_idx(int product_idx) {
        this.product_idx = product_idx;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public String getReview_filename() {
        return review_filename;
    }

    public void setReview_filename(String review_filename) {
        this.review_filename = review_filename;
    }

    public String getReview_regdate() {
        return review_regdate;
    }

    public void setReview_regdate(String review_regdate) {
        this.review_regdate = review_regdate;
    }
} // end of class
