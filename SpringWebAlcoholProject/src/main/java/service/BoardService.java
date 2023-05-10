package service;

import dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.BoardVO;
import vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    private BoardDAO boardDAO;

    @Autowired
    public BoardService(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    } // end of constructor

    public Map<String, Object> board_list() {
        Map<String, Object> board_map = boardDAO.board_list();
        return board_map;
    } // end of board_list()

    public Map<String, Object> board_list(HashMap<String, Object> map) {
        Map<String, Object> board_map = boardDAO.board_list(map);
        return board_map;
    } // end of board_list()

    public int getRowTotal(HashMap<String, Object> map) {
        int res = boardDAO.getRowTotal(map);
        return res;
    } // end of getRowTotal()

    public int board_insert(BoardVO vo) {
        int res = boardDAO.board_insert(vo);
        return res;
    } // end of board_insert()

    public BoardVO board_selectOne(int board1_idx) {
        BoardVO board_vo = boardDAO.board_selectOne(board1_idx);
        return board_vo;
    } // end of board_selectOne()

    public UserVO user_selectOne(int user1_idx) {
        UserVO user_vo = boardDAO.user_selectOne(user1_idx);
        return user_vo;
    } // end of user_selectOne()

    public int board_modify_readhit(int board1_idx){
        int res = boardDAO.modify_readhit(board1_idx);
        return res;
    } // end of board_modify_readhit()

    public int board_update_step(BoardVO originBoard_vo){
        int res = boardDAO.update_step(originBoard_vo);
        return res;
    } // end of board_update_step()

    public int board_insert_reply(BoardVO board_vo){
        int res = boardDAO.insert_reply(board_vo);
        return res;
    } // end of board_insert_reply

    public int board_modify(BoardVO board_vo){
        int res = boardDAO.modify(board_vo);
        return res;
    } // end of board_modify()

    public Map<String, Object> board_reply_selectMap(int board1_ref){
        Map<String, Object> board_reply_map = boardDAO.board_reply_selectMap(board1_ref);
        return board_reply_map;
    } // end of board_reply_select()

} // end of class
