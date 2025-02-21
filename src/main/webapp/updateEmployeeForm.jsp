<%@ page import="com.example.personcrud.model.Employee" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mise à jour Employé</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
