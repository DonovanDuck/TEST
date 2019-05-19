/**
 * 课程所属分类（系部）
 *
 */
package cn.edu.tit.bean;

public class Category {
	
	private String categoryId; //分类（系部）id
	private String categoryName; // 系部名
	private String categoryDetail; // 系部描述
	private String categoryNum;
	
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDetail="
				+ categoryDetail + ", categoryNum=" + categoryNum + "]";
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(String categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	public String getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Category(String categoryId, String categoryName, String categoryDetail, String categoryNum) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDetail = categoryDetail;
		this.categoryNum = categoryNum;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
