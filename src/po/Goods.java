package po;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 *	��Ʒ��
 */
public class Goods {
	private String id;//��Ʒid
	private String name;//��Ʒ����
	private String description;//��Ʒ����
	private String typeCode;//��Ʒ����code
	private String img;//��ƷͼƬ
	private Integer inventory;//��Ʒ���
	private Integer price;//��Ʒ�۸�
	private Integer sellNum;//��Ʒ������
	private Integer popularityNum;//��Ʒ������
	private Date createTime;//����ʱ��
	private Date updateTime;//����ʱ��
	private Boolean deleted;//�Ƿ�h��
	private MultipartFile logoImage;
	private String typeName;//��Ʒ����name
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getSellNum() {
		return sellNum;
	}
	public void setSellNum(Integer sellNum) {
		this.sellNum = sellNum;
	}
	public Integer getPopularityNum() {
		return popularityNum;
	}
	public void setPopularityNum(Integer popularityNum) {
		this.popularityNum = popularityNum;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public MultipartFile getLogoImage() {
		return logoImage;
	}
	public void setLogoImage(MultipartFile logoImage) {
		this.logoImage = logoImage;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
