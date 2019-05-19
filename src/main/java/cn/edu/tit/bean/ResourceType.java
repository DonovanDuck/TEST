/**
 * 
 */
package cn.edu.tit.bean;

/**
 * @author LiMing
 * 资源类型实体类
 */
public class ResourceType {
	private Integer resourceTypeId; 
	private String resourceType;
	public Integer getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(Integer resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public String getResourceType() {
		return resourceType;
	}
	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}
	public ResourceType(Integer resourceTypeId, String resourceType) {
		super();
		this.resourceTypeId = resourceTypeId;
		this.resourceType = resourceType;
	}
	public ResourceType() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ResourceType [resourceTypeId=" + resourceTypeId + ", resourceType=" + resourceType + "]";
	}
	
}
