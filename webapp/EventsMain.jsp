<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis</title>
	<link rel="stylesheet" href="EventsMain.css">
</head>

<body>
    <header class="header">
        <div class="header-content">
            <a href="index.jsp" class="logo navl">EventAxis</a>
            <button class="toggle-btn" onclick="toggleNav()">
                <span class="toggle-icon"></span>
            </button>
            <nav>
                <ul id="nav-menu">
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
        </div>
    </header>
    <main>
        <section class="hero">
            <div class="slider">
                <div class="slide-track">
                    <div class="slide">
                        <img src="https://i.ytimg.com/vi/9SXmhCaXkzI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA95_RS31dcpaHijVDP8A4c4Y2ThQ" alt="Summer Festival">
                        <div class="slide-content">
                            <h2>Hack the Future</h2>
                            <p>Develop Innovative Solutions and Shape Tomorrow Tech!</p>
                        </div>
                    </div>
                    <div class="slide">
                        <img src="https://images.pexels.com/photos/1709003/pexels-photo-1709003.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Tech Conference">
                        <div class="slide-content">
                            <h2>Tech Conference</h2>
                            <p>Explore the latest innovations in technology</p>
                        </div>
                    </div>
                    <div class="slide">
                        <img src="https://iismworld.com/wp-content/uploads/2022/04/Chess-Junoon-Fest-by-IISM-MUMBAI.jpg" alt="Winter Gala">
                        <div class="slide-content">
                            <h2>Battle of Kings</h2>
                            <p>Engage in Epic Chess Battles</p>
                        </div>
                    </div>
                    <div class="slide">
                        <img src="https://i.ytimg.com/vi/9SXmhCaXkzI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA95_RS31dcpaHijVDP8A4c4Y2ThQ" alt="Summer Festival">
                        <div class="slide-content">
                            <h2>Hack the Future</h2>
                            <p>Develop Innovative Solutions and Shape Tomorrow Tech!</p>
                        </div>
                    </div>
                    <div class="slide">
                        <img src="https://images.pexels.com/photos/1709003/pexels-photo-1709003.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Tech Conference">
                        <div class="slide-content">
                            <h2>Tech Conference</h2>
                            <p>Explore the latest innovations in technology</p>
                        </div>
                    </div>
                    <div class="slide">
                        <img src="https://iismworld.com/wp-content/uploads/2022/04/Chess-Junoon-Fest-by-IISM-MUMBAI.jpg" alt="Winter Gala">
                        <div class="slide-content">
                            <h2>Battle of Kings</h2>
                            <p>Engage in Epic Chess Battles</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="event-controls">
            <h2 class="event-heading">Discover Events</h2>
            <p class="catchy-lines">
                Dive into a vibrant tapestry of experiences explore the highlights of past events that have brought our community together, or get a sneak peek at the exciting gatherings on the horizon.
            </p>
            <button class="btn" onclick="location.href='pastup.jsp'">Explore Events</button>
        </div>
    </main>
    <script>
        function toggleNav() {
            const navMenu = document.getElementById('nav-menu');
            const toggleBtn = document.querySelector('.toggle-btn');
            navMenu.classList.toggle('show');
            toggleBtn.classList.toggle('active');
        }
    </script>
</body>

</html>