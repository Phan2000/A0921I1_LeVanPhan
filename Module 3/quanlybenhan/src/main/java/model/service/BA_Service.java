package model.service;

import model.bean.Benh_An;
import java.sql.SQLException;
import java.util.List;

public interface BA_Service {

    List<Benh_An> selectAll();

    Benh_An selectBA(int id);

    boolean deleteBenhAn(int id) throws SQLException;

    boolean updateBenhAn(Benh_An benh_an) throws SQLException;
}
