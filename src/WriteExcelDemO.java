import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import pass.connection;


public class WriteExcelDemO {

	public static void toexl() throws ClassNotFoundException {
		XSSFWorkbook workbook = new XSSFWorkbook();

		//Create a blank sheet
		XSSFSheet sheet = workbook.createSheet("ProductList");

		//This data needs to be written (Object[])
		Map<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("1", new Object[] {"ID", "NAME","CATEGORY","MODEL","PRICE","COUNT"});
		connection con= new connection();
		try {
			
			Statement stmt=con.getStatement();
	ResultSet rs=	stmt.executeQuery("select proid,proname,procategory,promodel,proprice,procount from producttable");
	int count =2;
	while(rs.next()){
		String c1=String.valueOf(count);
		data.put(c1, new Object[] {rs.getInt("proid"), rs.getString("proname"), rs.getString("procategory"),rs.getString("promodel"),rs.getInt("proprice"),rs.getInt("procount")});
	count++;
	}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset)
		{
		Row row = sheet.createRow(rownum++);
		Object [] objArr = data.get(key);
		int cellnum = 0;
		for (Object obj : objArr)
		{
		Cell cell = row.createCell(cellnum++);
		if(obj instanceof String)
		cell.setCellValue((String)obj);
		else if(obj instanceof Integer)
		cell.setCellValue((Integer)obj);
		}
		}
		try
		{
		//Write the workbook in file system
		FileOutputStream out = new FileOutputStream(new File("howtodoinjava_demo.xlsx"));
		workbook.write(out);
		out.close();
		System.out.println("howtodoinjava_demo.xlsx written successfully on disk.");
		}
		catch (Exception e)
		{
		e.printStackTrace();
		} 
	}

}
