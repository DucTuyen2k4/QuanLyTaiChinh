
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financial Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Custom CSS styles can be added here */
        /* For example, you can define specific styles for your application */
    </style>
</head>
<body>
<header class="bg-primary text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <!-- Left logo or branding goes here -->
                <img src="logo.png" alt="Logo" class="img-fluid">
            </div>
            <div class="col-md-8 text-center">
                <!-- Application title -->
                <h1>Financial Management</h1>
            </div>
            <div class="col-md-2 text-end">
                <!-- User settings or profile options -->
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        User Name
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Sign Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>

<nav class="bg-dark text-white">
    <div class="container">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link active" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Wallet</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Transactions</a>
            </li>
        </ul>
    </div>
</nav>

<main class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <!-- Sidebar or menu goes here -->
                <ul class="list-group">
                    <li class="list-group-item">Dashboard</li>
                    <li class="list-group-item">Income</li>
                    <li class="list-group-item">Expenses</li>
                </ul>
            </div>
            <div class="col-md-9">
                <!-- Main content goes here -->
                <h2>Dashboard</h2>
                <!-- Include your charts, summaries, or other content here -->
            </div>
        </div>
    </div>
</main>

<footer class="bg-secondary text-white text-center py-3">
    <!-- Footer content goes here -->
    &copy; 2023 Financial Management Application
</footer>

<!-- Include Bootstrap JS and your custom scripts here -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

