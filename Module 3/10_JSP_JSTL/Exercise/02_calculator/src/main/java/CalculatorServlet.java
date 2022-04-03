import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.geom.FlatteningPathIterator;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first_operand = Float.parseFloat(request.getParameter("first-operand"));
        float second_operand = Float.parseFloat(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<hmtl>");
        printWriter.println("<h1>RESULT:</h1>");
        try{
            float result = Calculator.calculate(first_operand, second_operand, operator);
            printWriter.println(first_operand + " " + operator + " " + second_operand + " = " + result);
        }catch (Exception ex){
            printWriter.println("Error: " + ex.getMessage());
        }
        printWriter.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
