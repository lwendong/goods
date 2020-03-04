package po;

import java.util.Date;
/**
 * …Ã∆∑∆¿¬€
 */
public class Comment {
	private String id;
	private String userId;
	private String goodsId;
	private String comment;
	private Date time;
	private String name;
	private String goodsName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getTime() {
		return time;
	}
	public void date(Date time) {
		this.time = time;
	}
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", userId=" + userId + ", goodsId=" + goodsId + ", comment=" + comment + ", time="
				+ time + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
