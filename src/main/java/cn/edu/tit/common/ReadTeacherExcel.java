package cn.edu.tit.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import cn.edu.tit.bean.Admin;
import cn.edu.tit.bean.Teacher;
/**
 * 读取教师EXCEL表
 * @author Liming
 * */
public class ReadTeacherExcel {
	// 总行数
	private int totalRows = 0;
	// 总条数
	private int totalCells = 0;
	// 错误信息接收器
	private String errorMsg;
	// 构造方法
	public ReadTeacherExcel() {
	}
	// 获取总行数
	public int getTotalRows() {
		return totalRows;
	}
	// 获取总列数
	public int getTotalCells() {
		return totalCells;
	}
	// 获取错误信息
	public String getErrorInfo() {
		return errorMsg;
	}

	/**
	 * 读EXCEL文件，获取信息集合
	 * 
	 * @param fielName
	 * @return
	 */
	public List<Teacher> getExcelInfo(MultipartFile mFile) {
		String fileName = mFile.getOriginalFilename();// 获取文件名
		List<Teacher> teacherList = new ArrayList<Teacher>();
		try {
			// 验证文件名是否合格
			if (!validateExcel(fileName)) {
				return null;
			}
			// 根据文件名判断文件是2003版本还是2007版本
			boolean isExcel2003 = true;
			if (isExcel2007(fileName)) {
				isExcel2003 = false;
			}
			teacherList = createExcel(mFile.getInputStream(), isExcel2003);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacherList;
	}

	/**
	 * 根据excel里面的内容读取信息
	 * @param is    输入流
	 * @param isExcel2003 excel是2003还是2007版本
	 * @throws IOException
	 */
	public List<Teacher> createExcel(InputStream is, boolean isExcel2003) {
		List<Teacher> teacherList = new ArrayList<Teacher>();
		try {
			Workbook wb = null;
			if (isExcel2003) {// 当excel是2003时,创建excel2003
				wb = new HSSFWorkbook(is);
			} else {// 当excel是2007时,创建excel2007
				wb = new XSSFWorkbook(is);
			}
			teacherList = readExcelValue(wb);// 读取Excel里面的信息
		} catch (IOException e) {
			e.printStackTrace();
		}
		for (Teacher teacher2 : teacherList) {
			System.out.println(teacher2.toString());
		}
		return teacherList;
	}

	/**
	 * 读取Excel里面的信息
	 * 
	 * @param wb
	 * @return
	 */
	private List<Teacher> readExcelValue(Workbook wb) {
		// 得到第一个shell
		Sheet sheet = wb.getSheetAt(0);
		// 得到Excel的行数
		this.totalRows = sheet.getPhysicalNumberOfRows();
		// 得到Excel的列数(前提是有行数)
		if (totalRows > 1 && sheet.getRow(0) != null) {
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
		}
		List<Teacher> teacherList = new ArrayList<Teacher>();

		/**
		 * 核心主体，处理EXCEL文件，读取excel文件信息
		 * 此处方法为循环处理
		 * 第一层循环为循环行
		 * 第二层循环为循环列
		 * 
		 * 此处对EXCEL表的格式限制为：第一行第一列开始为数据，并且列次递增数据分别为
		 * 工号、教师名、教师密码、教师性别、教育背景、教师职称、教师电话、电子邮箱
		 * */
		// 循环Excel行数

		for (int r = 0; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}				
			Teacher teacher = new Teacher();
			//循环Excel的列
			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				/**
				 * 切记判空，否则在getvalue()处将报空指针
				 * */
				if(cell == null)
				{
					continue;
				}
				switch (c) {
				case 0:
					teacher.setEmployeeNum(getValue(cell));//设置工号
					break;
				case 1:
					teacher.setTeacherName(getValue(cell));//设置教师名
					break;
				case 2:
					teacher.setTeacherPassword(getValue(cell));//设置教师密码
					break;
				case 3:
					teacher.setTeacherGender(getValue(cell));//设置教师性别
					break;	
				case 4:
					teacher.setEducationBackground(getValue(cell));//设置教育背景
					break;
				case 5:
					teacher.setProfessionalTitles(getValue(cell));//设置教师职称
					break;
				case 6:
					teacher.setTelephone(getValue(cell));//设置教师电话
					break;
				case 7:
					teacher.setEmail(getValue(cell));//设置教师电子邮箱
					break;
				case 8:
					teacher.setFaceImg(null);
					break;
				case 9:
					teacher.setTeacherNickName(null);
					break;
				case 10:
					teacher.setStatus(null);;
					break;
				case 11:
					teacher.setTeacherCategory(null);;
					break;
				default:
					break;
				}
			}
			if(teacher.getEmployeeNum()!=null)
			{
				teacherList.add(teacher);
			}
		}
		return teacherList;
	}

	/**
	 * 获取单元格信息
	 * 数据库存储的均为VARCHAR类型数据
	 * 将所有数据返回均设定为String类型数据
	 */
	private String getValue(Cell cell) {
	    if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
	          // 返回布尔类型的值
	          return String.valueOf(cell.getBooleanCellValue());
	      } else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
	          // 返回数值类型的值
	    	  return NumberToTextConverter.toText(cell.getNumericCellValue());
	      } else {
	          // 返回字符串类型的值
	          return String.valueOf(cell.getStringCellValue());
	      }
	}

	/**
	 * 验证EXCEL文件
	 */
	public boolean validateExcel(String fileName) {
		//文件名为空、不是2003、不是2007
		if (fileName == null || !(isExcel2003(fileName) || isExcel2007(fileName))) {
			errorMsg = "文件名不是excel格式";
			return false;
		}
		return true;
	}

	//是否是2003的excel，返回true是2003
	public static boolean isExcel2003(String fileName) {
		return fileName.matches("^.+\\.(?i)(xls)$");
	}

	//是否是2007的excel，返回true是2007
	public static boolean isExcel2007(String fileName) {
		return fileName.matches("^.+\\.(?i)(xlsx)$");
	} } 