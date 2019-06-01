/**
 * 存放通用工具
 */
package cn.edu.tit.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.DateFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import cn.edu.tit.bean.Resource;
import cn.edu.tit.iservice.IResourceService;
import cn.edu.tit.iservice.ITeacherService;

@Component
public  class  Common {
	// 使用日志工厂获取日志对象
    private static Log log = LogFactory.getLog(Common.class);
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
	 * springmvc的MultipartFile进行文件上传
	 * @param file
	 * @param request
	 */
	public static void springFileUpload(HttpServletRequest request){
		
        // 转换request，解析出request中的文件
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        // 获取文件map集合
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        String fileName = null;
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
        	if (entity!=null) {// 判断上传的文件是否为空
        		// 获取单个文件
	            MultipartFile mf = entity.getValue();
	            // 获得原始文件名
	            fileName = mf.getOriginalFilename();
                String path=null;// 文件路径
                String type=null;// 文件类型
              //  String fileName=file.getOriginalFilename();// 文件原名称
                //System.out.println("上传的文件原名称:"+fileName);
                // 判断文件类型
                type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
                if (type!=null) {// 判断文件类型是否为空
//                        // 项目在容器中实际发布运行的根路径
//                        String realPath=request.getSession().getServletContext().getRealPath("/");
//                        // 自定义的文件名称
//                        String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
//                        // 设置存放图片文件的路径
//                        path=realPath+/*System.getProperty("file.separator")+*/trueFileName;
                    	path = readProperties("path")+"/"+fileName;
                    
//                        System.out.println("存放图片文件的路径:"+path);
                        // 转存文件到指定的路径
                        try {
    						mf.transferTo(new File(path));
    						
    					} catch (Exception e) {
    						// TODO Auto-generated catch block
    						e.printStackTrace();
    						System.out.println("上传失败");
    					} 
                        System.out.println("文件成功上传到指定目录下");
                }else {
                    System.out.println("文件类型为空");
                }
            }else {
                System.out.println("没有找到相对应的文件");
            }
        }
		
	}

	/**
	 * java文件传输工具
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Object[] fileFactory(HttpServletRequest request, String id) {
		try {
			Map<String, Object> formdata = new HashMap<String, Object>(); // 要返回的map,存储的是要转换的类信息
			List<File> returnFileList = new ArrayList<>(); // 要返回的文件集合
			String studentId = (String) request.getSession().getAttribute("studentId");
			String path = readProperties("path");
			if(!"".equals(id) && id != null){
				if(studentId==null||studentId.equals("")) {
					path +="/"+id;
				}else {
					path +="/"+id+"/"+studentId;
				}
			}
			// 创建工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
			List<FileItem> items = upload.parseRequest(request);// 得到所有的字段
			for (FileItem fi : items) {
				if (!fi.isFormField()) { // 判断是否是普通表单字段
					String fileName = fi.getName(); 
					if (!fileName.isEmpty()) {
						File fullFile = new File(new String(fileName.getBytes(), "utf-8")); // 解决文件名乱码问题,获得文件内容
						File savedFile = new File(path, fullFile.getName()); // 为文件设置存储路径
						// 文件夹不存在时创建文件夹
						File fileParent = savedFile.getParentFile();  
						if(!fileParent.exists()){  
						    fileParent.mkdirs();  
						}  
						savedFile.createNewFile();
						
						fi.write(savedFile); // 存储文件
						returnFileList.add(savedFile); // 保存要返回的文件集合
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
	public static String readProperties(String readKey){
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
	/**
	 * @author wenli
	 * @return
	 * 时间戳转成string 类型
	 * yyyy/MM/dd
	 */
	public static String TimestamptoString() {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());  
        String tsStr = "";  
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
        try {  
            tsStr = sdf.format(timestamp);  
            System.out.println(tsStr);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		return tsStr;
	}
	/**
	 * @author wenli
	 * @param info
	 * @return
	 * @throws NoSuchAlgorithmException
	 * 密码加密，单向加密MD5算法
	 */
	public static String eccryptMD5(String info) throws NoSuchAlgorithmException{
		//根据MD5算法生成MessageDigest对象
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		byte[] srcBytes = info.getBytes();
		//使用srcBytes更新摘要
		md5.update(srcBytes);
		//完成哈希计算，得到result
		byte[] resultBytes = md5.digest();
		StringBuffer stringBuffer =new StringBuffer();
		for (int i = 0; i < resultBytes.length; i++) {
			stringBuffer.append(resultBytes[i]);
		}
		
		return eccryptSHA(stringBuffer.toString());
	}
	/**
	 * @author wenli
	 * @param info
	 * @return
	 * @throws NoSuchAlgorithmException
	 * sha加密算法
	 */
	public static String eccryptSHA(String info) throws NoSuchAlgorithmException{
		MessageDigest sha = MessageDigest.getInstance("SHA");
		byte[] srcBytes = info.getBytes();
		//使用srcBytes更新摘要
		sha.update(srcBytes);
		//完成哈希计算，得到result
		byte[] resultBytes = sha.digest();
		StringBuffer stringBuffer =new StringBuffer();
		for (int i = 0; i < resultBytes.length; i++) {
			stringBuffer.append(resultBytes[i]);
		}
		
		return stringBuffer.toString();
	}
	
	/**
	 * @author wenli
	 * @param fileName
	 * @return
	 * 判断文件类型
	 */
	public static int fileType(String fileName ,ITeacherService teacherService) {
		String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
		System.out.println("什么类型:"+type);
		if(isIncludeInWord(type)) {
			 try {
				return  teacherService.getResourceTypeId("word");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInExcel(type)) {
			 try {
				return  teacherService.getResourceTypeId("excel");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInPPT(type)) {
			 try {
				return  teacherService.getResourceTypeId("ppt");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInVideo(type)) {
			 try {
				return  teacherService.getResourceTypeId("video");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInMusic(type)) {
			 try {
				return  teacherService.getResourceTypeId("audio");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInPhoto(type)) {
			 try {
				return  teacherService.getResourceTypeId("photo");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		if(isIncludeInCompressed(type)) {
			 try {
				return  teacherService.getResourceTypeId("compressed");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Common处调用的teacherService.getResourceTypeId(type)出问题了");
				return 0;
			}
		}
		return 0;
		
	} 
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInWord(String key){
        boolean include = false;
        for (TypeMatchByWord e: TypeMatchByWord.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInPhoto(String key){
        boolean include = false;
        for (TypeMatchByPhoto e: TypeMatchByPhoto.values()){
        	
        	System.out.println(e);
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInExcel(String key){
        boolean include = false;
        for (TypeMatchByExcel e: TypeMatchByExcel.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInPPT(String key){
        boolean include = false;
        for (TypeMatchByPPT e: TypeMatchByPPT.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInVideo(String key){
        boolean include = false;
        for (TypeMatchByVideo e: TypeMatchByVideo.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInMusic(String key){
        boolean include = false;
        for (TypeMatchByMusic e: TypeMatchByMusic.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }
	/**
	 * @author wenli
	 * @param key
	 * @return
	 */
	public static boolean isIncludeInCompressed(String key){
        boolean include = false;
        for (TypeMatchByCompressed e: TypeMatchByCompressed.values()){
            if(e.toString().toLowerCase().equals(key.toLowerCase())){
                include = true;
                break;
            }
        }
        return include;
    }


	/**
     * 判断当前时间是否在[startTime, endTime]区间，注意时间格式要一致
     * 
     * @param nowTime 当前时间
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     * @author wenli
	 * @throws ParseException 
     */
    public static boolean isEffectiveDate(Timestamp now, Timestamp start, Timestamp ended) throws ParseException {
    	String format = "yyyy-MM-dd HH:mm:ss";
    	Date nowTime = new java.util.Date(now.getTime());
    	Date startTime = new java.util.Date(start.getTime());
    	Date endTime = new java.util.Date(ended.getTime());
    	DateFormat df=new SimpleDateFormat(format);
    	nowTime=df.parse(df.format(nowTime )) ;
    	startTime=df.parse(df.format(startTime )) ;
    	endTime=df.parse(df.format(endTime )) ;
        if (nowTime.getTime() == startTime.getTime()
                || nowTime.getTime() == endTime.getTime()) {
            return true;
        }

        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);

        Calendar begin = Calendar.getInstance();
        begin.setTime(startTime);

        Calendar end = Calendar.getInstance();
        end.setTime(endTime);

        if (date.after(begin) && date.before(end)) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * @author wenli
     * @return
     * 计算时间差
     */
    public static String timeDifference(Timestamp now,Timestamp end) {
    		String timeEnd="";
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try { 
			    Date d2 = df.parse(Common.getTimeStampNumberFormat(now)); 
			    Date d1 = df.parse(Common.getTimeStampNumberFormat(end)); 
			    long date = d1.getTime() - d2.getTime(); 
			    long day = date / (1000 * 60 * 60 * 24);  
			    long hour = (date / (1000 * 60 * 60) - day * 24);  
			    long min = ((date / (60 * 1000)) - day * 24 * 60 - hour * 60);
			    long s = (date/1000 - day*24*60*60 - hour*60*60 - min*60);
			    System.out.println(""+day+"天"+hour+"小时"+min+"分"+s+"秒"); 
			    timeEnd=day+"天"+hour+"小时"+min+"分";
			}catch (Exception e) {
				System.out.println("时间差出错了");
			}
			return timeEnd;
    }
    static String getTimeStampNumberFormat(Timestamp formatTime) {
        SimpleDateFormat mFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return mFormat.format(formatTime);
    }
    
    

	
}
