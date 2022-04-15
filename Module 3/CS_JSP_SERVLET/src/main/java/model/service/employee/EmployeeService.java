package model.service.employee;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {
    public boolean insertEmployee(Employee employee) throws SQLException;

    public Employee selectEmployee(int id);

    public List<Employee> selectAllEmployee();

    public boolean deleteEmployee(int id) throws SQLException;

    public boolean updateEmployee(Employee employee) throws SQLException;
}
