package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.BoardVO;
import vo.UserVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    private HttpSession session;

    @Autowired
    public BoardDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    public Map<String, Object> board_list(){
        Map<String, Object> board_map = new HashMap<String, Object>();
        List<BoardVO> board_list = sqlSession.selectList("b.board_list1");
        List<UserVO> user_list = sqlSession.selectList("b.board_list2");

        board_map.put("board_list", board_list);
        board_map.put("user_list", user_list);

        return board_map;
    } // end of board_list()

    public HashMap<String, Object> board_list(HashMap<String, Object> map){
        HashMap<String, Object> board_map = new HashMap<String, Object>();
        List<BoardVO> board_list = sqlSession.selectList("b.board_page_select1", map);
        List<UserVO> user_list = sqlSession.selectList("b.board_page_select2", map);

        board_map.put("board_list", board_list);
        board_map.put("user_list", user_list);

        return board_map;
    } // end of board_list

    public int getRowTotal(HashMap<String, Object> map){
        int res = sqlSession.selectOne("b.board_count", map);
        return res;
    } // end of getRowTotal()

    public int board_insert(BoardVO vo){
        int res = sqlSession.insert("b.board_insert", vo);
        return res;
    } // end of board_insert()

    public BoardVO board_selectOne(int board1_idx){
        BoardVO board_vo = sqlSession.selectOne("b.board_selectOne", board1_idx);
        return board_vo;
    } // end of board_selectOne()

    public UserVO user_selectOne(int user1_idx){
        UserVO user_vo = sqlSession.selectOne("b.user_selectOne", user1_idx);
        return user_vo;
    } // end of user_selectOne()

    public int modify_readhit(int board1_idx){
        int res = sqlSession.update("b.board_modify_readhit", board1_idx);
        return res;
    } // end of modify_readhit()

    public int update_step(BoardVO originBoard_vo){
        int res = sqlSession.update("b.board_update_step", originBoard_vo);
        return res;
    } // end of update_step()

    public int insert_reply(BoardVO board_vo){
        int res = sqlSession.insert("b.board_insert_reply", board_vo);
        return res;
    } // end of insert_reply()

    public int modify(BoardVO board_vo){
        int res = sqlSession.update("b.board_modify", board_vo);
        return res;
    } // end of modify()

    public Map<String, Object> board_reply_selectMap(int board1_ref){
        List<BoardVO> board_reply_list = sqlSession.selectList("b.board_reply_select1", board1_ref);
        List<UserVO> user_list = sqlSession.selectList("b.board_reply_select2", board1_ref);
        Map<String, Object> board_reply_map = new HashMap<String, Object>();
        board_reply_map.put("board_reply_list", board_reply_list);
        board_reply_map.put("user_list", user_list);
        return board_reply_map;
    } // end of board_reply_selectList()

    public int board_delete(int board1_idx){
        int res = sqlSession.update("b.board_delete", board1_idx);
        return res;
    } // end of board_delete()

} // end of class
