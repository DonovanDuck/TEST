package cn.edu.tit.iservice.iserviceImpl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Accessory;
import cn.edu.tit.bean.Task;
import cn.edu.tit.idao.ITaskDao;
import cn.edu.tit.idao.ITeacherDao;
import cn.edu.tit.iservice.ITaskService;
@Service
public class TaskServiceImpl implements ITaskService{
	@Autowired
	ITaskDao taskDao;

	@Override
	public void createTask(Task task) {
		// TODO Auto-generated method stub
		taskDao.createTask(task);
		
	}

	@Override
	public void stopTask(String taskId) {
		// TODO Auto-generated method stub
		taskDao.stopTask(taskId);
	}

	@Override
	public void restartTask(String taskId) {
		// TODO Auto-generated method stub
		taskDao.restartTask(taskId);
	}

	@Override
	public void restartTaskSetEndTime(String taskId, Timestamp taskEndTime) {
		// TODO Auto-generated method stub
		taskDao.restartTaskSetEndTime(taskId, taskEndTime);
	}

	@Override
	public void deleteTask(String taskId) {
		// TODO Auto-generated method stub
		taskDao.deleteTask(taskId);
	}

	@Override
	public void mapClassTask(String virtualClassNum, String taskId) {
		// TODO Auto-generated method stub
		taskDao.deleteTask(taskId);
	}

	@Override
	public void addAccessory(List<Accessory> accessoris) {
		// TODO Auto-generated method stub
		taskDao.addAccessory(accessoris);
	}

	@Override
	public List<String> searchTaskId(String virtualClassNum) {
		// TODO Auto-generated method stub
		return taskDao.searchTaskId(virtualClassNum);
	}

	@Override
	public List<Task> TaskList(List<String> taskIds) {
		// TODO Auto-generated method stub
		return taskDao.TaskList(taskIds);
	}

	@Override
	public Task searchTask(String taskId) {
		// TODO Auto-generated method stub
		return taskDao.searchTask(taskId);
	}

	@Override
	public Accessory searchAccessory(String taskId) {
		// TODO Auto-generated method stub
		return taskDao.searchAccessory(taskId);
	}

}
