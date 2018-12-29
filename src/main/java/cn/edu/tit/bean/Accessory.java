/**
 * 任务（作业、实验、课程设计）相关附件 
 *
 */
package cn.edu.tit.bean;

import java.io.File;

public class Accessory {

	private int accessoryId; // 附件id
	private String accessoryName; // 附件
	private String accessoryPath; // 附件存放路径
	private String accessoryTime; //附件发布 or 提交时间
	private int taskId; // 对应任务id
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
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public File getAccessory() {
		return accessory;
	}
	public void setAccessory(File accessory) {
		this.accessory = accessory;
	}
	
}
