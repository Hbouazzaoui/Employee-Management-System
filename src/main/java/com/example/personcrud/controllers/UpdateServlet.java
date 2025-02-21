package com.example.personcrud.controllers;

import com.example.personcrud.dao.employeeDAO;
import com.example.personcrud.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateEmployeeForm")
public class UpdateServlet extends HttpServlet {
    private employeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new employeeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeDAO.getEmployeeById(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("updateEmployeeForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String position = request.getParameter("position");
            double salary = Double.parseDouble(request.getParameter("salary"));

            Employee employee = new Employee(name, email, position, salary);
          employee.setId(id);
            employeeDAO.updateEmployee(employee);


         System.out.println(employee.getId());

            response.sendRedirect("ReadServlet");
        }

}
