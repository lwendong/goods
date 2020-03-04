package dao.before;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import po.Goods;

@Repository("indexDao")
@Mapper
public interface IndexDao {
	
	public List<Map<String, Object>> getSaleOrder();
	
	public List<Map<String, Object>> getFocusOrder();
	
	public List<Map<String, Object>> selectNotice();
	
	public List<Map<String, Object>> getLastedGoods(Goods goods);
	
	public Goods selectGoodsById(String goodsId);
	
	public List<Goods> search(String mykey);
	
	public List<Goods> selectGoodsByType(String typeCode);
}
