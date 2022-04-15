package model.service.employee;

import model.bean.Employee;
import model.repository.employee.EmployeeRepo;
import model.repository.employee.EmployeeRepoImpl;
import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {

    EmployeeRepo employeeRepo = new EmployeeRepoImpl();

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        return employeeRepo.insertEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepo.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepo.selectAllEmployee();
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return false;
    }
}
