package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import po.User;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
	
	public List<User> userInfo();
	public List<User> userInfoBypage(Map<String, Object> map);
	public User userOne(@Param("id")String id);
	public int upUserManager(User user);
}
