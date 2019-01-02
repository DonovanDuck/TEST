package cn.edu.tit.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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

public class ReadExcel {
	// 总行数
	private int totalRows = 0;
	// 总条数
	private int totalCells = 0;
	// 错误信息接收器
	private String errorMsg;
	// 构造方法
	public ReadExcel() {
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
		List<Teacher> teacherList = null;
		try {
			if (!validateExcel(fileName)) {// 验证文件名是否合格
				return null;
			}
			boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
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
		List<Teacher> teacherList = null;
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
		System.out.println("打印============" + sheet);
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
		 * */
		// 循环Excel行数
		for (int r = 0; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}				


//			Teacher teacher = new Teacher();

			// 循环Excel的列
			//			for (int c = 0; c < this.totalCells; c++) {
			//				Cell cell = row.getCell(c);
			//				if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			//					try {
			//						admin.setAdminPassword(getValue(cell));
			//					} catch (NumberFormatException e) {
			//						e.printStackTrace();
			//						System.out.println("error");
			//					}
			//				}
			//				if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
			//					try {
			//						admin.setAdminUsername(getValue(cell));
			//					} catch (Exception e) {
			//						e.printStackTrace();
			//						System.out.println("error");
			//					}
			//				}		
			//			}


//			teacherList.add(teacher);

		}
		return teacherList;
	}

	/**
	 * 获取单元格信息
	 * 针对不同类型不同返回
	 * 此处将NUMBER类型数据返回为文本
	 */
	private String getValue(Cell cell) {
		if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
			return String.valueOf(cell.getBooleanCellValue());
		}
		if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
			// 利用NumberToTextConverter.toText将返回的科学技术法变为文本
			return NumberToTextConverter.toText(cell.getNumericCellValue());
		}
		if (cell.getCellType() == cell.CELL_TYPE_STRING) {
			return String.valueOf(cell.getStringCellValue());
		}
		return String.valueOf(cell.getStringCellValue());
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
	}
}
