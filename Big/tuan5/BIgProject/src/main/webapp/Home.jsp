<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <style>
        /* Importing Google font - Open Sans */
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }
        body {
            background: #ecececdb;
        }
        .card-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            max-width: 1250px;
            margin: 150px auto;
            padding: 20px;
            gap: 20px;
        }
        .card-list .card-item {
            background: #fff;
            padding: 26px;
            border-radius: 8px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.04);
            list-style: none;
            cursor: pointer;
            text-decoration: none;
            border: 2px solid transparent;
            transition: border 0.5s ease;
        }
        .card-list .card-item:hover {
            border: 2px solid #000;
        }
        .card-list .card-item img {
            width: 100%;
            aspect-ratio: 16/9;
            border-radius: 8px;
            object-fit: cover;
        }
        .card-list span {
            display: inline-block;
            background: #F7DFF5;
            margin-top: 32px;
            padding: 8px 15px;
            font-size: 0.75rem;
            border-radius: 50px;
            font-weight: 600;
        }
        .card-list .developer {
            background-color: #F7DFF5;
            color: #B22485;
        }
        .card-list .designer {
            background-color: #d1e8ff;
            color: #2968a8;
        }
        .card-list .editor {
            background-color: #d6f8d6;
            color: #205c20;
        }
        .card-item h3 {
            color: #000;
            font-size: 1.438rem;
            margin-top: 28px;
            font-weight: 600;
        }
        .card-item .arrow {
            display: flex;
            align-items: center;
            justify-content: center;
            transform: rotate(-35deg);
            height: 40px;
            width: 40px;
            color: #000;
            border: 1px solid #000;
            border-radius: 50%;
            margin-top: 40px;
            transition: 0.2s ease;
        }
        .card-list .card-item:hover .arrow  {
            background: #000;
            color: #fff;
        }
        @media (max-width: 1200px) {
            .card-list .card-item {
                padding: 15px;
            }
        }
        @media screen and (max-width: 980px) {
            .card-list {
                margin: 0 auto;
            }
        }
        a {
            color: black;
        }
        .navbar-nav .nav-item {
            margin-right: 100px; /* Đặt khoảng cách 50px giữa các thẻ li */
        }
        button {
            border: none;
            outline: none;
            padding: 0;
            margin: 0;
            background: none;
        }
        h1 {
            margin: 0 auto;
            text-align: center;
            font-weight: bold !important;
        }

    </style>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-bottom: 50px">
    <a class="navbar-brand"  href="#">
        <form action="/Home?action=Home" method="post" >
            <button  class="nav-link" >Money Lover<span class="sr-only">(current)</span></button>
        </form>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav " style="margin: auto">
            <li class="nav-item active">
                <form action="/Home?action=Home" method="post" >
                    <button  class="nav-link" >Home<span class="sr-only">(current)</span></button>
                </form>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Wallet
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown"  style="overflow: scroll;height: 80px">
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/wallet?action=FormAddWallet" style="text-align: center">+</a>
                    <div class="dropdown-divider"></div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Profile
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" >
                    <a class="dropdown-item" href="/Home?action=update">Update Profile</a>
                    <a class="dropdown-item" href="#">Delete account</a>
                    <div class="dropdown-divider"></div>
                    <form method="post" action="/Home?action=Logout">
                        <button type="submit" class="dropdown-item">Logout</button>
                    </form>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<h1>HOME</h1>
<div class="card-list" style="margin-top: 10px">

    <a href="#" class="card-item">
        <img src="${sessionScope['user'].getImage()}" alt="Card Image">
        <span class="editor">Editor</span>
        <h3>An "editor" ensures content quality and accuracy.</h3>
        <div class="arrow">
            <i class="fas fa-arrow-right card-icon"></i>
        </div>
 </a>


</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>