package dao.before;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import po.Order;

@Repository("orderDao")
@Mapper
public interface OrderDao {
	
	public int addOrder(Order order);
	
	public int updateStore(@Param("list")List<Order> list);
	
	public int updateGoodsSellNum(@Param("list")List<Order> list);
	
	public int pay(@Param("userId") String userId,@Param("orderCode") String orderCode);
	
	public List<Order> selectGoodsByUserId(@Param("userId")String userId);
}
