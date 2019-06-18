package cn.edu.tit.idao;

import java.util.List;

import org.springframework.stereotype.Component;

import cn.edu.tit.bean.Task;

@Component
public interface ITurnClassDao {

	List<Task> getAllTurnClass() throws Exception;

}
