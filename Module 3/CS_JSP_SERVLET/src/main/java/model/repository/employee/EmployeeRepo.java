package model.repository.employee;

import model.bean.Employee;
import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepo {

    public boolean insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int id);

    public List<Employee> selectAllEmployee();

    public boolean deleteEmployee(int id) throws SQLException;

    public boolean updateEmployee(Employee employee, int id) throws SQLException;
}
