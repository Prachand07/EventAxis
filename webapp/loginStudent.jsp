<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Student.css">
    <title>EventAxis</title>
    
</head>
<body>
    <header class="header">
        <div class="header-content">
            <a href="index.jsp" class="logo">EventAxis</a>
            <nav>
                <ul id="nav-links">
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                    <li><a href="EventsMain.jsp" class="nav-link">Events</a></li>
                    <li><a href="#" class="nav-link">Contact</a></li>
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
        <form id="loginForm" action="stulogin" method="POST">
            <h3>Login Here</h3>
            <label for="email">Email</label>
            <input type="email" placeholder="Enter Student email id" id="email" name="email" required>
            <label for="password">Password</label>
            <input type="password" placeholder="Password" id="password" name="password" required>
            <button type="submit">Log In</button>
            <div class="toggle-link">
                <p>If not registered, <a href="#" onclick="toggleForms(event)">register here</a>.</p>
            </div>
            
        </form>
<form id="registerForm" class="hidden" action="sturegister" method="POST" onsubmit="return validateRegistration()">
    <h3>Register Here</h3>
    <label for="regName">Name</label>
    <input type="text" placeholder="Enter Student Name" id="regName" name="name" required>
    <label for="regEmail">Email</label>
    <input type="email" placeholder="Enter Student email id" id="regEmail" name="email" required>
    <label for="regPassword">Password</label>
    <input type="password" placeholder="Password" id="regPassword" name="password" required>
    <span id="registerPasswordError" style="color: red; display: none;">
        Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, and one number
    </span>
    <button type="submit">Register</button>
    <div class="toggle-link">
        <p>If already registered, <a href="#" onclick="toggleForms(event)">log in here</a>.</p>
    </div>
</form>


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
        function validateRegistration() {
            const passwordInput = document.getElementById("regPassword");
            const passwordError = document.getElementById("registerPasswordError");
            const password = passwordInput.value;

            
            const passwordRegex = /^(?=.[a-z])(?=.[A-Z])(?=.*\d).{8,}$/;

            if (!passwordRegex.test(password)) {
               
                passwordError.style.display = "block";
                return false;
            } else {
            
                passwordError.style.display = "none";
                return true;
            }
        }
    </script>
</body>
</html>