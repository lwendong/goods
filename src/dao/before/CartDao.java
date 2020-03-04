package dao.before;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("cartDao")
@Mapper
public interface CartDao {
	
	public int focus(Map<String, Object> map);
	public int nofocus(Map<String, Object> map);
	
	public List<Map<String, Object>> isFocus(Map<String, Object> map);
	
	public List<Map<String, Object>> isPutCart(Map<String, Object> map);
	
	public int putCart (Map<String, Object> map);
	
	public int updateCart (Map<String, Object> map);
	
	public List<Map<String, Object>> selectCart(String userId);
	
	public int deleteGoodsOne (Map<String, Object> map);
	
	public int addGoodsInventory (Map<String, Object> map);
	
	public int clear(String cartId);
	
	public int updateGoodsPopularityNum(String goodsId);
	
	public int updateGoodsInventory (Map<String, Object> map);
	
}
