package cn.edu.tit.iservice.iserviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.tit.idao.ITurnClassDao;
import cn.edu.tit.iservice.ITurnClassService;

@Service
public class TurnClassServiceImpl implements ITurnClassService{
	@Autowired
	private  ITurnClassDao turnClassDao ;

}
