package module;

import java.io.FileInputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ControlExcel {

    public static void main(String[] args) {
        ReadExcel();
    }

    public static void ReadExcel() {
        
        try {
            FileInputStream file = new FileInputStream("D:\\office365_save\\excel\\testjava.xlsx");
            XSSFWorkbook wb = new XSSFWorkbook(file);
            XSSFSheet sheet = wb.getSheetAt(0);
            FormulaEvaluator formula = wb.getCreationHelper().createFormulaEvaluator();
            for (Row row : sheet) {
                for (Cell cell : row) {
                    switch (formula.evaluate(cell).getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            System.out.print(cell.getStringCellValue());
                            break;
                        case Cell.CELL_TYPE_NUMERIC:
                            System.out.print(cell.getNumericCellValue());
                            break;
                    }
                }
                System.out.println("");
            }
            file.close();
        } catch (Exception e) {

        }
        
    }
}
