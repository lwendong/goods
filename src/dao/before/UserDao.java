package dao.before;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import po.User;

@Repository("userDao")
@Mapper
public interface UserDao {
	
	public int selectUserByEmail(String email);
	
	public int register(User buser);
	
	public List<User> login(User buser);
}
