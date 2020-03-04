package service.before.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSON;

import dao.before.UserCenterDao;
import po.User;
import service.before.UserCenterService;
import po.Comment;
import util.MyUtil;

@Service("userCenterService")
@Transactional
public class UserCenterServiceImpl implements UserCenterService{
	@Autowired
	private UserCenterDao userCenterDao;
	
	public String userCenter(HttpSession session, Model model) {
		model.addAttribute("myOrder", userCenterDao.myOrder(MyUtil.getUserId(session)));
		model.addAttribute("myFocus", userCenterDao.myFocus(MyUtil.getUserId(session)));
		return "before/userCenter";
	}
	
	public String orderDetail(Model model, String orderId) {
		model.addAttribute("myOrderDetail", userCenterDao.orderDetail(orderId));
		return "before/userOrderDetail";
	}

	public String userControllerCenter(HttpSession session, Model model) {
		return "before/userControllerCenter";
	}
	
	public String userMyInfo(HttpSession session, Model model) {
		User user=(User)session.getAttribute("user");
		List<User> userList=new ArrayList<>();
		userList.add(user);
		model.addAttribute("user", JSON.toJSON(userList));
		return "before/userDetail/myinfo";
	}
	
	@Override
	public String myinfoManager(HttpSession session, Model model) {
		User user=(User)session.getAttribute("user");
		List<User> userList=new ArrayList<>();
		userList.add(user);
		model.addAttribute("user", JSON.toJSON(userList));
		return "before/userDetail/myinfo-manager";
	}
	@Override
	public void updateInfo(User user) {
		User data=user;
		Map<String,Object> map=new HashMap<>();
		map.put("id", data.getId());
		map.put("email", data.getEmail());
		map.put("password", data.getPassword());
		map.put("name", data.getName());
		userCenterDao.updateInfo(map);
	}
	@Override
	public void updateUserPassword(User user) {
		User data=user;
		Map<String,Object> map=new HashMap<>();
		map.put("id", data.getId());
		map.put("email", data.getEmail());
		map.put("password", data.getPassword());
		map.put("name", data.getName());
		userCenterDao.updateInfo(map);
	}
	@Override
	public String myinfoPassword(HttpSession session, Model model) {
		User user=(User)session.getAttribute("user");
		List<User> userList=new ArrayList<>();
		userList.add(user);
		model.addAttribute("user", JSON.toJSON(userList));
		return "before/userDetail/myinfo-updatepasword";
	}
	@Override
	public void addComment(Comment comment, HttpSession session) {
		Map<String,Object> map=new HashMap<>();
		Date date=new Date();
		User user=(User)session.getAttribute("user");
		map.put("id", MyUtil.getUUID());
		map.put("userId", user.getId());
		map.put("goodId", comment.getGoodsId());
		map.put("comment", comment.getComment());
		map.put("time", date);
		userCenterDao.insertComment(map);
	}
	@Override
	public void findgoodCommenBygoodId(String id,Model model) {
		List<Comment> commentList=userCenterDao.commentBygoodsId(id);
		model.addAttribute("commentVoBeanList",commentList);
	}
	@Override
	public String myComment(HttpSession session, Model model) {
		User user=(User)session.getAttribute("user");
		List<Comment> commentList=userCenterDao.commentByuserId(user.getId());
		model.addAttribute("commentVoBeanList",JSON.toJSON(commentList));
		return "before/userDetail/myinfo-Comment";
	}
	@Override
	public void removeCommentById(String commentId) {
		userCenterDao.deleteCommentById(commentId);
	}
	
	public void updateCommentById(String comment,String commentId) {
		Map<String,Object> map=new HashMap<>();
		map.put("comment",comment);
		map.put("id",commentId);
		userCenterDao.updateCommentById(map);
	}
	
	@Override
	public Comment commentById(String commentId) {
		return userCenterDao.commentById(commentId);
	}

	@Override
	public void disposeUser(HttpSession session, User user) {
		User loginUser = (User) session.getAttribute("user");
		if(StringUtils.isNotEmpty(user.getEmail())) {
			loginUser.setEmail(user.getEmail());
		}
		if(StringUtils.isNotEmpty(user.getName())) {
			loginUser.setName(user.getName());
			
		}
		if(StringUtils.isNotEmpty(user.getPassword())) {
			loginUser.setPassword(user.getPassword());
		}
		session.setAttribute("user",loginUser);
	}
	
}
