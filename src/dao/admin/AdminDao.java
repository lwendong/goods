package dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import po.User;
@Repository("adminDao")
@Mapper
public interface AdminDao {
	
	public List<User> login(User User);
}
