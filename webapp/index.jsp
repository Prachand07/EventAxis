<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis - Redefining College Events</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="diagonal-split"></div>
   <header>
        <div class="container header-content">
            <a href="index.jsp" class="logo">EventAxis</a>
            <nav id="nav-menu">
                <ul id="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="EventsMain.jsp">Events</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <div class="toggle-button" id="toggle-button">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>

    <main>
        <div class="container content-wrapper">
            <div class="content">
                <h1 class="title">EventAxis</h1>
                <h5 class="subtitle">Explore the Latest College Events!</h5>
                <p class="text">Join the excitement, enhance your skills, and stay ahead with the latest technological trends. Register now and claim exclusive goodies!</p>
                <div class="login-options">
                    <button class="login-button" onclick="location.href='loginStudent.jsp'">Student Login</button>
                    <button class="login-button" onclick="location.href='Commite.jsp'">Committee Access</button>
                    <button class="login-button" onclick="location.href='AdminLogin.jsp'">Admin Dashboard</button>
                </div>
            </div>
            <div class="features">
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-rocket"></i></div>
                    <h2 class="feature-title">Effortless Planning</h2>
                    <p class="feature-text">Streamline your event planning process with our intuitive tools and templates.</p>
                </div>
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-globe"></i></div>
                    <h2 class="feature-title">Team Collaboration</h2>
                    <p class="feature-text">Work seamlessly with your team in real-time, enhancing productivity and creativity.</p>
                </div>
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
                    <h2 class="feature-title">Smart Analytics</h2>
                    <p class="feature-text">Gain valuable insights with our advanced analytics and reporting tools.</p>
                </div>
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-magic"></i></div>
                    <h2 class="feature-title">Revolutionize Your Events!</h2>
                    <p class="feature-text">Join successful organizers and elevate your events.</p>                 
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <script>
     
        document.getElementById('toggle-button').addEventListener('click', function() {
            const navMenu = document.getElementById('nav-menu');
            navMenu.classList.toggle('active');
            this.classList.toggle('active');
        });
    </script>
</body>
</html>
