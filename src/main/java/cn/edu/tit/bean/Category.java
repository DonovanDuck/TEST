/**
 * 课程所属分类（系部）
 *
 */
package cn.edu.tit.bean;

public class Category {
	
	private String categoryId; //分类（系部）id
	private String categoryName; // 系部名
	private String categoryDetail; // 系部描述
	
	// setter - getter
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
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDetail="
				+ categoryDetail + "]";
	}
	public Category(String categoryId, String categoryName, String categoryDetail) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDetail = categoryDetail;
	}
	
}
