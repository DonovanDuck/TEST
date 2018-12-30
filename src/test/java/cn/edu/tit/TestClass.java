package cn.edu.tit;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.idao.IAdminDao;
import cn.edu.tit.iservice.AdminService;
import cn.edu.tit.iservice.iserviceImpl.AdminServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestClass {

	@Resource
	private AdminService adminS;  //申明管理员IAdminService
	
	@Resource
	private IAdminDao adminDao;
	
	@Before
	public void before() {
		System.out.println("测试-----数据库连通-----开始");
	}

	@Test
	public void addAdmin() {
		Admin admin = new Admin(null,"username2","password2");
		//adminDao.addAdmin(admin);
		
		adminS.addAdmin(admin);
	}

}
