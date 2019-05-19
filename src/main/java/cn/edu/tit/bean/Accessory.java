package cn.edu.tit.bean;

import java.io.File;

public class Accessory {

	private int accessoryId; // 附件id
	private String accessoryName; // 附件
	private String accessoryPath; // 附件存放路径
	private String accessoryTime; //附件发布 or 提交时间
	private String taskId; // 对应任务id
	private File accessory; //附件内容
	
	// setter - getter
	public int getAccessoryId() {
		return accessoryId;
	}
	public void setAccessoryId(int accessoryId) {
		this.accessoryId = accessoryId;
	}
	public String getAccessoryName() {
		return accessoryName;
	}
	public void setAccessoryName(String accessoryName) {
		this.accessoryName = accessoryName;
	}
	public String getAccessoryPath() {
		return accessoryPath;
	}
	public void setAccessoryPath(String accessoryPath) {
		this.accessoryPath = accessoryPath;
	}
	public String getAccessoryTime() {
		return accessoryTime;
	}
	public void setAccessoryTime(String accessoryTime) {
		this.accessoryTime = accessoryTime;
	}

	
	public File getAccessory() {
		return accessory;
	}
	public void setAccessory(File accessory) {
		this.accessory = accessory;
	}

	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	@Override
	public String toString() {
		return "Accessory [accessoryId=" + accessoryId + ", accessoryName=" + accessoryName + ", accessoryPath="
				+ accessoryPath + ", accessoryTime=" + accessoryTime + ", taskId=" + taskId + ", accessory=" + accessory
				+ "]";
	}
	public Accessory(int accessoryId, String accessoryName, String accessoryPath, String accessoryTime, String taskId,
			File accessory) {
		super();
		this.accessoryId = accessoryId;
		this.accessoryName = accessoryName;
		this.accessoryPath = accessoryPath;
		this.accessoryTime = accessoryTime;
		this.taskId = taskId;
		this.accessory = accessory;
	}
	public Accessory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
