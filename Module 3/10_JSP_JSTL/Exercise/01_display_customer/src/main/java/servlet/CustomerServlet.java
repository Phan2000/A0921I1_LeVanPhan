package servlet;

import model.Customer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/list"})
public class CustomerServlet extends HttpServlet {
    List<Customer> customerList = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        customerList.add(new Customer("Nguyen Hoang Nam","1983-08-20","Ha Noi", "123.img"));
        customerList.add(new Customer("Tran Dang Khoa","1984-08-21","Thanh Hoa", "456.img"));
        customerList.add(new Customer("Hoang Van Cong","1985-08-22","Lang Son", "789.img"));
        request.setAttribute("listCustomer", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/home.jsp");
        requestDispatcher.forward(request, response);
    }
}
