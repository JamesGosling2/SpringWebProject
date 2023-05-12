package util;

public class Common {
	public static class User{
		public static final String VIEW_PATH = "/WEB-INF/views/user/";
	} // end of User class

	public static class Main{
		public static final String VIEW_PATH = "/WEB-INF/views/main/";
	} // end of Main class

	public static class full_view{
		public static final String VIEW_PATH = "/WEB-INF/views/full_view/";
	} // end of full_view class

	public static class Login{
		public static final String VIEW_PATH = "/WEB-INF/views/login/";
	} // end of Login class

	public static class Detail_view{
		public static final String VIEW_PATH = "/WEB-INF/views/detail_view/";
	}

	public static class Review_view2{
		public static final String VIEW_PATH = "/WEB-INF/views/review_test/";
	}

	public static class Temporary_view{
		public static final String VIEW_PATH = "/WEB-INF/views/Temporary/";
	}
	
	public static class Review{
		public static final String VIEW_PATH = "/WEB-INF/views/review/";
	}
	
	public static class Event{
		public static final String VIEW_PATH = "/WEB-INF/views/event/";
	}

	public static class Board{
		public static final String VIEW_PATH = "/WEB-INF/views/board_view/";

		// 한 페이지에 보여줄 게시글 갯수
		public final static int BLOCKLIST = 5;

		// 한 화면에 보여질 페이지 메뉴 수
		// < 1 2 3 >
		public final static int BLOCKPAGE = 3;

	} // end of Board class

} // end of class
