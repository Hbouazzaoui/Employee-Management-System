<%@ page import="com.example.personcrud.model.Employee" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Person List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Employee List</h2>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Position</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%

            List<Employee> listEmployee = (List<Employee>) request.getAttribute("listEmployee");
            if (listEmployee != null) {
                for (Employee employee : listEmployee) {
        %>
        <tr>
            <td><%= employee.getId() %></td>
            <td><%= employee.getName() %></td>
            <td><%= employee.getEmail() %></td>
            <td><%= employee.getPosition() %></td>
            <td><%= employee.getSalary() %></td>
            <td>
                <a href="edit?id=<%= employee.getId() %>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="deletePerson?id=<%= employee.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No employees found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="createPersonForm.jsp" class="btn btn-success">Create New Person</a>
</div>
</body>
</html>