package model.service.impl;

import model.bean.Benh_An;
import model.repository.ConnectDB;
import model.service.BA_Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BAServiceImpl implements BA_Service {

    private static final String SELECT_ALL_SQL = "select * from benh_an";
    private static final String DELETE_BA_SQL = "delete from benh_an where ma_benh_an = ?;";
    private static final String UPDATE_BA_SQL = "update product set ma_benh_nhan = ?, ten_benh_nhan= ?, ngay_nhap_vien =?, ngay_ra_vien=?, ly_do_nhap_vien=? where ma_benh_an = ?;";
    private static final String SELECT_BA_BY_ID = "select ma_benh_nhan, ten_benh_nhan, ngay_nhap_vien, ngay_ra_vien, ly_So_nhap_vien from benh_an where ma_benh_an = ?;";

    @Override
    public List<Benh_An> selectAll() {
        List<Benh_An> benh_ans = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnection() ; PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SQL);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int maBA = rs.getInt("ma_benh_an");
                int maBN = rs.getInt("ma_benh_nhan");
                String tenBN = rs.getString("ten_benh_nhan");
                String ngay_nhap = rs.getString("ngay_nhap_vien");
                String ngay_xuat = rs.getString("ngay_ra_vien");
                String ly_do_nhap_vien = rs.getString("ly_do_nhap_vien");
                benh_ans.add(new Benh_An(maBA, maBN, tenBN, ngay_nhap, ngay_xuat, ly_do_nhap_vien));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return benh_ans;
    }

    @Override
    public Benh_An selectBA(int id) {
        Benh_An benh_an = null;
        try (Connection connection = ConnectDB.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BA_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int ma_benh_nhan = rs.getInt("ma_benh_nhan");
                String ten_benh_nhan = rs.getString("ten_benh_nhan");
                String ngay_nhap_vien = rs.getString("ngay_nhap_vien");
                String ngay_ra_vien = rs.getString("ngay_ra_vien");
                String ly_do_nhap_vien = rs.getString("ly_do_nhap_vien");
                benh_an = new Benh_An(id, ma_benh_nhan, ten_benh_nhan, ngay_nhap_vien, ngay_ra_vien, ly_do_nhap_vien);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return benh_an;
    }

    @Override
    public boolean deleteBenhAn(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection= ConnectDB.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_BA_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateBenhAn(Benh_An benh_an) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = ConnectDB.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_BA_SQL);) {
            statement.setInt(1, benh_an.getMaBenhNhan());
            statement.setString(2, benh_an.getTenBenhNhan());
            statement.setString(3, benh_an.getNgayNhapVien());
            statement.setString(4, benh_an.getNgayRaVien());
            statement.setString(5, benh_an.getLyDoNhapVien());
            statement.setInt(6, benh_an.getMaBenhAn());
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
