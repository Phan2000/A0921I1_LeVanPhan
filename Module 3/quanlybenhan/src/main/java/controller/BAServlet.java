package controller;

import model.bean.Benh_An;
import model.service.BA_Service;
import model.service.impl.BAServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "BAServlet", urlPatterns = "/homes")
public class BAServlet extends javax.servlet.http.HttpServlet {
    private BA_Service ba_service;
    public void init(){
        ba_service = new BAServiceImpl();
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                updateBA(request, response);
                break;
        }
    }

    private void updateBA(HttpServletRequest request, HttpServletResponse response) {
        int ma_benh_an = Integer.parseInt(request.getParameter("ma_benh_an"));
        int ma_benh_nhan = Integer.parseInt(request.getParameter("ma_benh_nhan"));
        String ten_benh_nhan = request.getParameter("ten_benh_nhan");
        String ngay_nhap_vien = request.getParameter("ngay_nhap_vien");
        String ngay_xuat_vien = request.getParameter("ngay_ra_vien");
        String ly_do_nhap_vien = request.getParameter("ly_do_nhap_vien");

        Benh_An book = new Benh_An(ma_benh_an, ma_benh_nhan, ten_benh_nhan, ngay_nhap_vien, ngay_xuat_vien, ly_do_nhap_vien);
        try {
            ba_service.updateBenhAn(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteBA(request, response);
                break;
            default:
                listBA(request, response);
                break;
        }
    }

    private void listBA(HttpServletRequest request, HttpServletResponse response) {
        List<Benh_An> benh_anList = ba_service.selectAll();
        request.setAttribute("benhAnList", benh_anList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBA(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            ba_service.deleteBenhAn(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Benh_An> benh_anList = ba_service.selectAll();
        request.setAttribute("benhAnList", benh_anList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Benh_An benh_an = ba_service.selectBA(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/update.jsp");
        request.setAttribute("benh_an", benh_an);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
