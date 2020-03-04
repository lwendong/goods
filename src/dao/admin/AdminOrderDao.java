package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("adminOrderDao")
@Mapper
public interface AdminOrderDao {
	
	public List<Map<String,Object>> orderInfo();
	
	public int deleteOrderBase(String orderId);
}
