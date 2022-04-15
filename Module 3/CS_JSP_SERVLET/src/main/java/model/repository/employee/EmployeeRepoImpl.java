package model.repository.employee;

import model.bean.Employee;
import model.repository.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepoImpl implements EmployeeRepo {

    private static final String INSERT_EMPLOYEE_SQL = "insert into nhanvien"+ "(manhanvien, hoten, ngaysinh, socmnd, luong, sodienthoai, email, diachi, mavt, matd, mabp) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from nhanvien where id =?";
    private static final String SELECT_ALL_EMPLOYEE = "select * from nhanvien";
    private static final String DELETE_EMPLOYEE_SQL = "delete from nhanvien where id = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update nhanvien set manhanvien=?, hoten = ?,ngaysinh= ?, socmnd =?, luong=?, sodienthoai = ?, email = ?, diachi = ?, mavt=?, matd=?, mabp=? where manhanvien = ?;";

    @Override
    public boolean insertEmployee(Employee employee) throws SQLException {
        boolean check = false;
        try(Connection connection = ConnectDB.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)){
            preparedStatement.setInt(1, employee.getMaNhanVien());
            preparedStatement.setString(2, employee.getHoTen());
            preparedStatement.setString(3, employee.getNgaySinh());
            preparedStatement.setString(4, employee.getSoCMND() );
            preparedStatement.setDouble(5, employee.getLuong() );
            preparedStatement.setString(6, employee.getSoDienThoai() );
            preparedStatement.setString(7, employee.getEmail() );
            preparedStatement.setString(8, employee.getDiaChi() );
            preparedStatement.setInt(9, employee.getMaVT());
            preparedStatement.setInt(10, employee.getMaTD());
            preparedStatement.setInt(11, employee.getMaBP());
            check = preparedStatement.executeUpdate() > 0;
            preparedStatement.close();
            connection.close();
        }catch (SQLException e){
            printSQLException(e);
        }
        return check;
    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try(Connection connection = ConnectDB.getConnection();PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int manhanvien = rs.getInt("manhanvien");
                String hoten = rs.getString("hoten");
                String ngaysinh = rs.getString("ngaysinh");
                String socmnd = rs.getString("socmnd");
                double luong = rs.getDouble("luong");
                String sodienthoai = rs.getString("sodienthoai");
                String email = rs.getString("email");
                String diachi = rs.getString("diachi");
                int maViTri = rs.getInt("mavt");
                int maTrinhDo = rs.getInt("matd");
                int maBophan = rs.getInt("mabp");
                employee = new Employee(manhanvien, hoten, ngaysinh, socmnd, luong, sodienthoai, email, diachi, maViTri, maTrinhDo, maBophan );
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("manhanvien");
                String hoten = rs.getString("hoten");
                String ngaysinh = rs.getString("ngaysinh");
                String socmnd = rs.getString("socmnd");
                double luong = rs.getDouble("luong");
                String sodienthoai = rs.getString("sodienthoai");
                String email = rs.getString("email");
                String diachi = rs.getString("diachi");
                int maViTri = rs.getInt("mavt");
                int maTrinhDo = rs.getInt("matd");
                int maBophan = rs.getInt("mabp");
                employees.add(new Employee(id, hoten, ngaysinh, socmnd, luong, sodienthoai, email, diachi, maViTri, maTrinhDo, maBophan));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = ConnectDB.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateEmployee(Employee employee, int id) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = ConnectDB.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            statement.setString(1, employee.getHoTen());
            statement.setString(2, employee.getNgaySinh());
            statement.setString(3, employee.getSoCMND());
            statement.setDouble(4, employee.getLuong());
            statement.setString(5, employee.getSoDienThoai());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getDiaChi());
            statement.setInt(8, employee.getMaVT());
            statement.setInt(9, employee.getMaTD());
            statement.setInt(10, employee.getMaBP());
            statement.setInt(11, employee.getMaNhanVien());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
