package controller;

import model.bean.Employee;
import model.service.employee.EmployeeService;
import model.service.employee.EmployeeServiceImpl;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {
    private EmployeeService employeeService ;
    public void init(){employeeService = new EmployeeServiceImpl();}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try{
            switch (action) {
                case "create":
                    createEmployee(request, response);
                    break;
                case "edit":
                    editEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
            }
        }catch (SQLException | ParseException ex) {
            throw new ServletException(ex);
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ParseException, ServletException, IOException {

    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showEmployee(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> listEmployee = employeeService.selectAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
