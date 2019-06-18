package cn.edu.tit.iservice.iserviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.bean.Task;
import cn.edu.tit.idao.ITurnClassDao;
import cn.edu.tit.iservice.ITurnClassService;

@Service
public class TurnClassServiceImpl implements ITurnClassService{
	@Autowired
	private  ITurnClassDao turnClassDao ;

	@Override
	public List<Task> getAllTurnClass() throws Exception{
		List<Task> list = new ArrayList<>();
		try {
			list = turnClassDao.getAllTurnClass();
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

}
