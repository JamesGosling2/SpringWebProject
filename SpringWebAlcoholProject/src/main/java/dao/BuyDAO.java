package dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FullViewVO;
import vo.OrderListVO;
import vo.ProducerVO;

@Repository
public class BuyDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public FullViewVO selectProduct(int product_idx){
		return session.selectOne("b.select_product", product_idx);
	}
	public List<FullViewVO> selectProducts(List<OrderListVO> cart) {
		
		return session.selectList("b.select_products",cart);
	}
	public ProducerVO selectProducer(int idx) {
		return session.selectOne("b.select_producer_name",idx);
	}
	public int insertOrder(List<OrderListVO> list) {
		int res=0;
		for (OrderListVO vo : list) {			
			res+=session.insert("b.insertOrder",vo);
		}
		return res;
	}
	public Date Sysdate() {
		return session.selectOne("b.sysdate");
	}
}
