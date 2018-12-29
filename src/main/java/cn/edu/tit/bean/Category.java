/**
 * 课程所属分类（系部）
 *
 */
package cn.edu.tit.bean;

public class Category {
	
	private String categoryId; //分类（系部）id
	private String categoryName; // 课程名
	private String categoryDetail; // 课程描述
	
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
	
}
