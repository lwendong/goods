package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import po.Goods;
import po.GoodsType;
@Repository("adminTypeDao")
@Mapper
public interface AdminTypeDao {
	
	public List<GoodsType> selectGoodsType();
	public List<Goods> selectGoodsTypeByPage(Map<String, Object> map);
	
	public int addType(@Param("id")String id,@Param("typeName")String typeName,@Param("code")String code);
	
	public int deleteType(String goodTypeId);
	
	public List<Goods> selectGoodsByType(String code);
}
