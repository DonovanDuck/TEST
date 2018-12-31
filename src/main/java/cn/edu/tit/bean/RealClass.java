/**
 * 自然班级，创建虚拟班后以自然班级为单位导入
 */
package cn.edu.tit.bean;

public class RealClass {

	private String realClassNum; // 自然班级号
	private String realClassCategory; // 自然班级所属系部
	
	// setter - getter
	public String getRealClassNum() {
		return realClassNum;
	}
	public void setRealClassNum(String realClassNum) {
		this.realClassNum = realClassNum;
	}
	public String getRealClassCategory() {
		return realClassCategory;
	}
	public void setRealClassCategory(String realClassCategory) {
		this.realClassCategory = realClassCategory;
	}
	
	
}
