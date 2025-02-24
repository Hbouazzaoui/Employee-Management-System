<%@ page import="com.example.personcrud.model.Employee" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #0b0e21, #463c57);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            font-family: 'Roboto', sans-serif;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .header {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .container {
            background: rgba(255, 255, 255, 0.71);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-top: 30px;
            flex: 1;
        }
        .table {
            margin-top: 20px;
        }
        .table thead th {
            background: #4a90e2;
            color: #fff;
            border: none;
        }
        .table tbody tr:hover {
            background: rgba(74, 144, 226, 0.1);
        }
        .btn-primary {
            background: #4a90e2;
            border: none;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #357abd;
        }
        .btn-success {
            background: #28a745;
            border: none;
            transition: background 0.3s ease;
        }
        .btn-success:hover {
            background: #218838;
        }
        .btn-danger {
            background: #dc3545;
            border: none;
            transition: background 0.3s ease;
        }
        .btn-danger:hover {
            background: #c82333;
        }
        .modal-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        .modal-header {
            background: #4a90e2;
            color: #fff;
            border-radius: 15px 15px 0 0;
        }
        .modal-title {
            font-weight: 500;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
        }
        .footer {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
            box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.2);
        }
        .footer a {
            color: #4a90e2;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            color: #357abd;
        }
        .social-icons a {
            color: #fff;
            font-size: 20px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        .social-icons a:hover {
            color: #4a90e2;
        }

        @media (max-width: 576px) {
            .header h1 {
                font-size: 24px;
            }

            .container {
                padding: 15px;
            }

            .table th, .table td {
                padding: 8px;
                font-size: 12px;
            }

            .btn {
                font-size: 12px;
                padding: 5px 10px;
            }

            .footer p {
                font-size: 12px;
            }

            .social-icons a {
                font-size: 16px;
            }
        }

        @media (min-width: 577px) and (max-width: 992px) {
            .header h1 {
                font-size: 28px;
            }

            .container {
                padding: 20px;
            }

            .table th, .table td {
                padding: 10px;
                font-size: 14px;
            }

            .btn {
                font-size: 14px;
                padding: 8px 15px;
            }

            .footer p {
                font-size: 14px;
            }

            .social-icons a {
                font-size: 18px;
            }
        }

        @media (min-width: 993px) {
            .header h1 {
                font-size: 32px;
            }

            .container {
                padding: 30px;
            }

            .table th, .table td {
                padding: 12px;
                font-size: 16px;
            }

            .btn {
                font-size: 16px;
                padding: 10px 20px;
            }

            .footer p {
                font-size: 16px;
            }

            .social-icons a {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Employee Management System</h1>
</div>
<div class="container">
<%--    <h2 class="text-center mb-4">Employee List</h2>--%>

    <!-- Add Employee Button -->
    <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addEmployeeModal">
        Add Employee
    </button>

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
            List<Employee> listEmployee = (List<Employee>) request.getAttribute("personList");
            if (listEmployee != null && !listEmployee.isEmpty()) {
                for (Employee employee : listEmployee) {
        %>
        <tr>
            <td><%= employee.getId() %></td>
            <td><%= employee.getName() %></td>
            <td><%= employee.getEmail() %></td>
            <td><%= employee.getPosition() %></td>
            <td><%= employee.getSalary() %></td>
            <td>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#updateEmployeeModal" data-id="<%= employee.getId() %>" data-name="<%= employee.getName() %>" data-email="<%= employee.getEmail() %>" data-position="<%= employee.getPosition() %>" data-salary="<%= employee.getSalary() %>">Edit</button>
                <a href="delete?id=<%= employee.getId() %>" class="btn btn-danger">Delete</a>
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
</div>
<br>

<!-- Footer -->
<div class="footer">
    <div class="social-icons">
        <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
    </div>
    <p>&copy; 2023 EduManage. All rights reserved.</p>
    <p>Designed with <i class="fas fa-heart" style="color: #ff4757;"></i> by Hamouda bouazzaoui</p>
</div>

<!-- Add Employee Modal -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addEmployeeModalLabel">Add Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="createEmployee" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="position">Position:</label>
                        <input type="text" class="form-control" id="position" name="position" required>
                    </div>
                    <div class="form-group">
                        <label for="salary">Salary:</label>
                        <input type="number" class="form-control" id="salary" name="salary" step="0.01" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Employee Modal -->
<div class="modal fade" id="updateEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="updateEmployeeModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateEmployeeModalLabel">Update Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="updateEmployeeForm" method="post">
                    <input type="hidden" name="id" id="employeeId" value="">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="employeeName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="employeeEmail" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="position">Position:</label>
                        <input type="text" class="form-control" id="employeePosition" name="position" required>
                    </div>
                    <div class="form-group">
                        <label for="salary">Salary:</label>
                        <input type="number" class="form-control" id="employeeSalary" name="salary" step="0.01" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#updateEmployeeModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var name = button.data('name');
        var email = button.data('email');
        var position = button.data('position');
        var salary = button.data('salary');

        var modal = $(this);
        modal.find('#employeeId').val(id);
        modal.find('#employeeName').val(name);
        modal.find('#employeeEmail').val(email);
        modal.find('#employeePosition').val(position);
        modal.find('#employeeSalary').val(salary);
    });
</script>
</body>
</html>