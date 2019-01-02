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
	private int resourceTypeId; // 资源类型
	private String resourcePath; // 资源存储路径
	private Integer courseId;// 资源所属分类
	private Integer resourceChapterId; // 资源所属目录id
	
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
	
	public int getResourceType() {
		return resourceTypeId;
	}
	public void setResourceType(int resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public int getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(int resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public Integer getResourceChapterId() {
		return resourceChapterId;
	}
	public void setResourceChapterId(Integer resourceChapterId) {
		this.resourceChapterId = resourceChapterId;
	}
	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", resourceName=" + resourceName + ", resourceDetail="
				+ resourceDetail + ", publishTime=" + publishTime + ", publisherId=" + publisherId + ", resourceTypeId="
				+ resourceTypeId + ", resourcePath=" + resourcePath + ", courseId=" + courseId + ", resourceChapterId="
				+ resourceChapterId + "]";
	}
	public Resource(String resourceId, String resourceName, String resourceDetail, Timestamp publishTime,
			String publisherId, int resourceTypeId, String resourcePath, Integer courseId, Integer resourceChapterId) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceDetail = resourceDetail;
		this.publishTime = publishTime;
		this.publisherId = publisherId;
		this.resourceTypeId = resourceTypeId;
		this.resourcePath = resourcePath;
		this.courseId = courseId;
		this.resourceChapterId = resourceChapterId;
	}
	
}