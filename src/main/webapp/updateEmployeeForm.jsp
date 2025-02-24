<%@ page import="com.example.personcrud.model.Employee" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mise à jour Employé</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .header {
            background: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Mise à jour Employé</h1>
</div>
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Employee</h2>

    <form action="updateEmployeeForm" method="post">
        <input type="hidden" name="id" value="${employee.id}" />

        <div class="form-group">
            <label>Nom</label>
            <input type="text" class="form-control" name="name" value="${employee.name}" required />
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" value="${employee.email}" required />
        </div>

        <div class="form-group">
            <label>Position</label>
            <input type="text" class="form-control" name="position" value="${employee.position}" required />
        </div>

        <div class="form-group">
            <label>Salaire</label>
            <input type="number" step="0.01" class="form-control" name="salary" value="${employee.salary}" required />
        </div>

        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>

    <br>
    <a href="createEmployee" class="btn btn-secondary">Back to Employee List</a>
</div>
</body>
</html>