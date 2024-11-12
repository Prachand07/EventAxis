<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #4361ee, #3a0ca3);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            position: fixed;
            width: 100%;
            z-index: 1000;
            padding: 20px 0;
            background-color: transparent;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            display: flex;
            list-style: none;
            margin-right: 20px;
        }

        nav ul li {
            margin-left: 30px;
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

        .container {
            width: 90%;
            max-width: 600px;
            margin: 2rem auto;
            padding-top: 100px;
        }

        h1 {
            text-align: center;
        }

        .add-event-icon {
            background-color: white;
            color: #4361ee;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            cursor: pointer;
            margin: 1rem auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .event-form {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 2rem;
            border-radius: 10px;
            display: none;
        }

        .event-form.show {
            display: block;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
        }

        input,
        textarea {
            width: 100%;
            padding: 0.5rem;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
        }

        input::placeholder,
        textarea::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        button {
            background-color: white;
            color: #4361ee;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>

<body>

    <header>
        <div class="header-content">
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

    <div class="container">
        <h1>Committee Page</h1>
        <div class="add-event-icon" onclick="toggleForm()">+</div>
        <div class="event-form" id="eventForm">
            <form action="event" method="post">
                <div class="form-group">
                    <label for="eventName">Event Name:</label>
                    <input type="text" id="eventName" name="eventName" placeholder="Enter event name" required>
                </div>
                <div class="form-group">
                    <label for="eventDescription">Event Description:</label>
                    <textarea id="eventDescription" name="eventDescription" rows="4" placeholder="Enter event description" required></textarea>
                </div>
                <div class="form-group">
                    <label for="eventDate">Event Date:</label>
                    <input type="date" id="eventDate" name="eventDate" required>
                </div>
                <div class="form-group">
                    <label for="eventcategory">Event Category:</label>
                    <select id="eventcategory" name="eventcategory" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="Music">Music</option>
                        <option value="Technology">Technology</option>
                        <option value="Art">Art</option>
                        <option value="Health">Health</option>
                        <option value="Education">Education</option>
                        <option value="Sport">Sport</option>
                    </select>
                </div>
                <button type="submit">Add Event</button>
            </form>
        </div>
    </div>

    <script>
        function toggleForm() {
            const form = document.getElementById('eventForm');
            form.classList.toggle('show');
        }
    </script>

</body>

</html>
