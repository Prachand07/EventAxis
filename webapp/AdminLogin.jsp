<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>EventAxis</title>
    <link rel="stylesheet" href="Student.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');
        .hidden {
            display: none;
        }
         .small-button {
                display: inline-block;
                padding: 5px 10px;
                font-size: 12px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
            }
              header {
            position: fixed;
            width: 100%;
            z-index: 1000;
            padding: 20px 0;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
        }

        nav ul {

            display: flex;
            list-style: none;
        }

        nav ul li {

            margin-left: 30px;
            margin-right: 10px;
        }

        nav ul li a {
            color: #fff;

            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
            font-size: 1.2rem;

        }

        nav ul li a:hover {
            color: #a2f3e2;
        }
    </style>
</head>
<body>
    <body>
    <header>
        <div class="container header-content">
            <a href="index.jsp" class="logo">EventAxis</a>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="EventsMain.jsp">Events</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div id="formContainer">
        <div id="loginForm">
            <form>
                <h3>Login Here</h3>
                <label for="username">Username</label>
                <input type="text" placeholder="Enter Username" id="username" required>

                <label for="password">Password</label>
                <input type="password" placeholder="Password" id="password" required>

                <button type="submit">Log In</button>
                
            </form>
        </div>
    </div>

</body>
</html>