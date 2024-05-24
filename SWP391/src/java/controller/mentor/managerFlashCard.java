/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Category;
import entity.FlashCard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import model.DAOCategory;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "managerFlashCard", urlPatterns = {"/mentor/add-flashcard"})
public class managerFlashCard extends HttpServlet {

    private DAOCategory daoCategory = new DAOCategory();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("categories", daoCategory.getAllCategories());
        request.getRequestDispatcher("../view-mentor/manager-flashcard/add-flashcard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        if (service != null && service.trim().length() > 0) {
            switch (service) {
                case "searchCategory":
                    searchCategory(request, response);
                    break;
                case "btn":
                    
                    break;
                case "createFlashCard":
                    String data = request.getParameter("data");
                    response.getWriter().print(data);
                    break;
            }
        }

    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchValue = request.getParameter("category_name").trim();
        Vector<Category> vetor = daoCategory.getCategoriesByName(searchValue);
        if (vetor != null) {
            for (Category c : vetor) {
                response.getWriter().print("<div class=\"form-check\">\n"
                        + "                                                        <input\n"
                        + "                                                            class=\"form-check-input\"\n"
                        + "                                                            type=\"radio\"\n"
                        + "                                                            name=\"category\"\n"
                        + "                                                            id=\"flexRadioDefault1\"\n"
                        + "                                                            value=\"" + c.getCategory_id() + "\"\n"
                        + "                                                            />\n"
                        + "                                                        <label\n"
                        + "                                                            class=\"form-check-label\"\n"
                        + "                                                            for=\"category\"\n"
                        + "                                                            >\n"
                        + "                                                            " + c.getCategory_name() + "\n"
                        + "                                                        </label>\n"
                        + "                                                    </div>");
            }
        }
    }
    
    private void createFlashCard(){
        Vector<FlashCard> v = new Vector<>();
        
        
    }
    
//    public Map<String, String> convertData(String data){
//        Map<String, String> map = new HashMap<>();
//        String[] pair_raw = data.split("##notpair##");
//         
//    }
    

}
