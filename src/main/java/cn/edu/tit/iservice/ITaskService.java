package cn.edu.tit.iservice;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Task;

public interface ITaskService {
	/**
	 * @author wenli
	 * @param task
	 * 创建新任务
	 */
	public void createTask(Task task);	//创建任务
	/**
	 * @author wenli
	 * @param taskId
	 * 截止任务
	 */
	public void stopTask(String taskId);	//截止任务
	/**
	 * @author wenli
	 * @param taskId
	 * 如果任务是由于手动截止的，而非到达终止时间而截止，使用此方法修改任务状态即可
	 */
	public void restartTask(String taskId);	//重新启动任务，任务未过期
	/**
	 * @author wenli
	 * @param taskId
	 * @param taskEndTime
	 * 如果任务是由于终止时间而截止，使用此方法重新开始任务
	 */
	public void restartTaskSetEndTime(@Param("taskId")String taskId,@Param("taskEndTime")Timestamp taskEndTime);	//重新启动任务，任务过期
	/**
	 * @author wenli
	 * @param taskId
	 * 删除任务
	 */
	public void deleteTask(String taskId);	//删除任务
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @param taskId
	 * 把任务映射到班级任务表中
	 */
	public void mapClassTask(String virtualClassNum,String taskId);	//把任务映射到班级任务表中
	/**
	 * @author wenli
	 * @param accessoris
	 * 添加附件
	 */
	public void addAccessory(List<Accessory> accessoris);	//添加附件
	/**
	 * @author wenli
	 * @param virtualClassNum
	 * @return	任务号列表
	 * 查找班级对应的任务号列表
	 */
	public List<String> searchTaskId(String virtualClassNum);//查找班级对应的任务号列表
	/**
	 * @author wenli
	 * @param taskIds
	 * @return	本课程任务列表
	 * 根据任务号列表查询task列
	 */
	public List<Task> TaskList(List<String> taskIds);	//根据任务号列表查询task列
	/**
	 * @author wenli
	 * @param taskId
	 * @return	任务详情
	 * 查看单个任务详情
	 */
	public Task searchTask(String taskId);	//查看单个任务详情
	/**
	 * @author wenli
	 * @param taskId
	 * @return	附件信息
	 * 查询任务附件
	 */
	public Accessory searchAccessory(String taskId);	//查询任务附件
	

}