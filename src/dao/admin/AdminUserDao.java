package dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import po.User;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
	
	public List<User> userInfo();
	
	public int deleteuserManager(String userId);
}
