package com.example.personcrud.controllers;
import com.example.personcrud.dao.employeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/")
public class DeleteServlet extends HttpServlet {
    private employeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new employeeDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDAO.deleteEmployee(id);

        response.sendRedirect("select");
    }
}
