package po;

/**
 * 商品类型
 */
public class GoodsType {
	private String id;//id
	private String code;//商品类型代码
	private String name;//商品类型名称
	private Boolean deleted;//是否删除
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	
	
}
