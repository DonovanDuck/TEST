/**
 * 存放通用工具
 */
package cn.edu.tit.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Component;

@Component
public class Common {

	/**
	 * 创建随机串
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}

	/**
	 * 把map转换成对象
	 * 
	 * @param map
	 * @param clazz
	 * @return
	 * 
	 * 把Map转换成指定类型
	 */
	@SuppressWarnings("rawtypes")
	public static <T> T toBean(Map map, Class<T> clazz) {
		try {
			/*
			 * 1. 通过参数clazz创建实例 2. 使用BeanUtils.populate把map的数据封闭到bean中
			 */
			T bean = clazz.newInstance();
			ConvertUtils.register(new DateConverter(), java.util.Date.class);
			BeanUtils.populate(bean, map);
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 文件传输工具
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Object[] fileFactory(HttpServletRequest request) {
		try {
			Map<String, Object> formdata = new HashMap<String, Object>(); // 要返回的map,存储的是要转换的类信息
			List<File> returnFileList = new ArrayList<>(); // 要返回的文件集合
			String path = readProperties("path");
			// 创建工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
			for (FileItem fi : items) {
				if (!fi.isFormField()) { // 判断是否是普通表单字段
					String fileName = fi.getName();
					if (fileName != null) {
						File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
						File savedFile = new File(path, fullFile.getName()); // 为文件设置存储路径
						fi.write(savedFile); // 存储文件
						returnFileList.add(fullFile); // 保存要返回的文件集合
					}
				} else {
					formdata.put(fi.getFieldName(), fi.getString("UTF-8")); // 普通表单字段封装在map里，通过它转换为所需的类
				}
			}
			Object[] obj = new Object[]{returnFileList,formdata};
			return obj;
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 读取properties的字段
	 * @param readKey 字段名
	 * @return
	 */
	public String readProperties(String readKey){
		try {
			Properties properties = new Properties();
		    // 使用ClassLoader加载properties配置文件生成对应的输入流
		    InputStream in = Common.class.getClassLoader().getResourceAsStream("common.properties");
		    // 使用properties对象加载输入流
		    properties.load(in);
		    //获取key对应的value值
		    return properties.getProperty(readKey);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
