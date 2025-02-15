<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create employee</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Formul employee </h2>
    <form action="createEmployee" method="post">
        <div class="form-group">
            <label for="name">Nom:</label>
            <input type="text" class="form-control" id="name" name="name" required />
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required />
        </div>
        <div class="form-group">
            <label for="position">position:</label>
            <input type="text" class="form-control" id="position" name="position" required />
        </div>
        <div class="form-group">
            <label for="salary">salary:</label>
            <input type="number" class="form-control" id="salary" name="salary" step="0.01" required />
        </div>
        <button type="submit" class="btn btn-primary btn-block">Creat</button>
    </form>
</div>
</body>
</html>
