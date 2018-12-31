package cn.edu.tit;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Category;
import cn.edu.tit.iservice.IAdminService;


@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class AdminTest {
	private static Logger logger = Logger.getLogger(AdminTest.class);

	@Resource
	private IAdminService iadminService;
	
	List<Admin> admin = new ArrayList<Admin>();
	List<Category> categories = new ArrayList<Category>();
	
	@Test
	public void Test() {
		
		/**
		 * 测试插入管理员功能
		 * */
//		admin = iadminService.readAdmin();
//		for (Admin admin2 : admin) {
//			System.out.println("工号是~~~~~~~~~~~~~~~"+admin2.getAdminId());
//			System.out.println("密码是~~~~~~~~~~~~~~~"+admin2.getAdminPassword());
//			System.out.println("名字是~~~~~~~~~~~~~~~"+admin2.getAdminUsername());
//		}
//		Admin admin1 = new Admin(null,"username","password");
//		admin.add(admin1);
//		iadminService.addAdmin(admin);
		
		
		/**
		 * 测试管理员管理系部功能
		 * */
		Category category = new Category("1520561","计算机工程系","这是一个作风优良的系部");
		Category category2 = new Category("152051","法学系","这是一个断案的系部");
		categories.add(category2);
		categories.add(category);
		iadminService.initializeCategory(categories);
		}
	}

