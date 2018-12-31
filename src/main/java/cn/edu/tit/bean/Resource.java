/**
 * 教师在一类课程里发布的资源
 * 与作业，任务平级
 */
package cn.edu.tit.bean;

import java.sql.Timestamp;

public class Resource {

	private String resourceId; // 资源id
	private String resourceName; // 资源名
	private String resourceDetail; // 资源描述
	private Timestamp publishTime; // 资源发布时间
	private String publisherId; // 发布者id
	private String resourcePath; // 资源存储路径
	private Integer catetoryId; // 资源所属分类
	
	
	// setter - getter
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceDetail() {
		return resourceDetail;
	}
	public void setResourceDetail(String resourceDetail) {
		this.resourceDetail = resourceDetail;
	}
	public Timestamp getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}
	public String getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(String publisherId) {
		this.publisherId = publisherId;
	}
	public String getResourcePath() {
		return resourcePath;
	}
	public void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}
	public Integer getCatetoryId() {
		return catetoryId;
	}
	public void setCatetoryId(Integer catetoryId) {
		this.catetoryId = catetoryId;
	}
	public Resource(String resourceId, String resourceName, String resourceDetail, Timestamp publishTime,
			String publisherId, Integer catetoryId, String resourcePath) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceDetail = resourceDetail;
		this.publishTime = publishTime;
		this.publisherId = publisherId;
		this.resourcePath = resourcePath;
		this.catetoryId = catetoryId;
	}
	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", resourceName=" + resourceName + ", resourceDetail="
				+ resourceDetail + ", publishTime=" + publishTime + ", publisherId=" + publisherId + ", resourcePath="
				+ resourcePath + ", catetoryId=" + catetoryId + "]";
	}
	
}