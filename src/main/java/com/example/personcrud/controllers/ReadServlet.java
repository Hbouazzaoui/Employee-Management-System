package com.example.personcrud.controllers;

import com.example.personcrud.dao.employeeDAO;
import com.example.personcrud.model.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ReadServlet")
public class ReadServlet extends HttpServlet {
    private employeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new employeeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listEmployee(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Employee> listEmployee = employeeDAO.getAllEmployees();
        request.setAttribute("personList", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("personList.jsp");
        dispatcher.forward(request, response);
    }
}
