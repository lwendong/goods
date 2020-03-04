package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import po.Goods;
@Repository("adminGoodsDao")
@Mapper
public interface AdminGoodsDao {
	
	public List<Goods> selectGoods();
	
	public List<Goods> selectAllGoodsByPage(Map<String, Object> map);
	
	public int addGoods(Goods goods);
	
	public Goods selectGoodsById(String goodsId);
	
	public int deleteGoods(List<String> goodsIds);
	
	public int deleteGoodsOne(String goodsId);
	
	public int updateGoodsById(Goods goods);
	
	public List<Map<String, Object>> selectCartGoods(String goodsId);
	
	public List<Map<String, Object>> selectFocusGoods(String goodsId);
	
	public List<Map<String, Object>> selectOrderdetailGoods(String goodsId);
}
