<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis</title>
     <link rel="stylesheet" href="Commitee.css">
</head>

<body>
    <div class="diagonal-split"></div>
    <header class="header">
        <div class="header-content">
            <a href="index.jsp" class="logo navl">EventAxis</a>
            <nav>
                <ul id="nav-links">
                    <li>
                        <a href="index.jsp" class="navr">Home</a>
                    </li>
                    <li>
                        <a href="EventsMain.jsp" class="navr">Events</a>
                    </li>
                    <li>
                        <a href="#" class="navr">Contact</a>
                    </li>
                </ul>
            </nav>
            <div class="toggle-button" onclick="toggleMenu()">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div id="formContainer">
        <div id="loginForm">
            <form action="login" method="POST">
                <h3>Login Here</h3>
                <label for="email">Email</label>
                <input type="email" placeholder="Enter Committee Email" id="email" name="email" required>

                <label for="password">Password</label>
                <input type="password" placeholder="Password" id="password" name="password" required>

                <button type="submit">Log In</button>
                <div class="toggle-link">
                    <p>If not registered, <a href="#" onclick="toggleForms(event)">register here</a>.</p>
                </div>
               
            </form>
        </div>

        <div id="registerForm" class="hidden">
            <form action="register" method="POST">
                <h3>Register Here</h3>
                <label for="regUsername">Username</label>
                <input type="text" placeholder="Enter Committee name" id="regUsername" name="name" required>

                <label for="regEmail">Email ID</label>
                <input type="email" placeholder="Enter Email" id="regEmail" name="email" required>

                <label for="regPassword">Password</label>
                <input type="password" placeholder="Password" id="regPassword" name="password" required>

                <button type="submit">Register</button>
                <div class="toggle-link">
                    <p>If already registered, <a href="#" onclick="toggleForms(event)">log in here</a>.</p>
                </div>
            </form>
        </div>
    </div>
    <script>
        function toggleForms(event) {
            event.preventDefault();
            const loginForm = document.getElementById('loginForm');
            const registerForm = document.getElementById('registerForm');
            loginForm.classList.toggle('hidden');
            registerForm.classList.toggle('hidden');
        }

        function toggleMenu() {
            const navLinks = document.getElementById('nav-links');
            navLinks.classList.toggle('active');
        }

        function listEvents() {
            console.log("Listing events...");
        }
    </script>
</body>

</html>