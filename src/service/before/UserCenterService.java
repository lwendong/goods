package service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import po.User;
import po.Comment;

public interface UserCenterService {
	
	public String userCenter(HttpSession session, Model model);
	
	public String orderDetail(Model model, String orderId);
	
	public String userControllerCenter(HttpSession session, Model model);
	
	public String userMyInfo(HttpSession session, Model model);
	
	public String myinfoManager(HttpSession session, Model model);
	
	public String myinfoPassword(HttpSession session, Model model);
	
	public void  updateInfo(User user);
	
	public void updateUserPassword(User user);
	
	public void addComment(Comment comment,HttpSession session);
	
	public void findgoodCommenBygoodId(String goodsId,Model model);
	
	public String myComment(HttpSession session, Model model);
	
	public void removeCommentById(String commentId);
	
	public void updateCommentById(String comment,String commentId);
	
	public Comment commentById(String commentId);
	
	public void disposeUser(HttpSession session,User user);
}
