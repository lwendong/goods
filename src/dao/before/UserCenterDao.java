package dao.before;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import po.User;
import po.Comment;

@Repository("userCenterDao")
@Mapper
public interface UserCenterDao {
	
	public List<Map<String, Object>> myOrder(String userId);
	
	public List<Map<String, Object>> myFocus(String userId);
	
	public List<Map<String, Object>> orderDetail(String orderId);
	
	public List<User> myInfo(@Param("id")String userId);
	
	public void updateInfo(Map<String,Object> map);
	
	public void insertComment(Map<String,Object> map);
	
	public List<Comment> commentBygoodsId(@Param("goodsId")String goodsId);
	
	public List<Comment> commentByuserId(@Param("userId")String userId);
	
	public void deleteCommentById(@Param("commentId")String commentId);
	
	public void updateCommentById(Map<String,Object> map);
	
	public Comment commentById(@Param("commentId")String commentId);
	
	public int selectGoodsByUserIdOnOrder(@Param("userId")String userId,@Param("goodsId")String goodsId);
}
