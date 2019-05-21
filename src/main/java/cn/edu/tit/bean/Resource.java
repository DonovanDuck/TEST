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
	private Integer resourceTypeId; // 资源类型
	private String resourcePath; // 资源存储路径
	private String courseId;// 资源所属课程	
	private String size; // 资源大小
	private String timeSize; // 视频资源时长
	private Integer watchNum; // 查看次数
	private Integer useNum; // 使用次数
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
	public Integer getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(Integer resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public String getResourcePath() {
		return resourcePath;
	}
	public void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTimeSize() {
		return timeSize;
	}
	public void setTimeSize(String timeSize) {
		this.timeSize = timeSize;
	}
	public Integer getWatchNum() {
		return watchNum;
	}
	public void setWatchNum(Integer watchNum) {
		this.watchNum = watchNum;
	}
	public Integer getUseNum() {
		return useNum;
	}
	public void setUseNum(Integer useNum) {
		this.useNum = useNum;
	}
	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", resourceName=" + resourceName + ", resourceDetail="
				+ resourceDetail + ", publishTime=" + publishTime + ", publisherId=" + publisherId + ", resourceTypeId="
				+ resourceTypeId + ", resourcePath=" + resourcePath + ", courseId=" + courseId + ", size=" + size
				+ ", timeSize=" + timeSize + ", watchNum=" + watchNum + ", useNum=" + useNum + "]";
	}
	public Resource(String resourceId, String resourceName, String resourceDetail, Timestamp publishTime,
			String publisherId, Integer resourceTypeId, String resourcePath, String courseId, String size,
			String timeSize, Integer watchNum, Integer useNum) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceDetail = resourceDetail;
		this.publishTime = publishTime;
		this.publisherId = publisherId;
		this.resourceTypeId = resourceTypeId;
		this.resourcePath = resourcePath;
		this.courseId = courseId;
		this.size = size;
		this.timeSize = timeSize;
		this.watchNum = watchNum;
		this.useNum = useNum;
	}
	public Resource() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}