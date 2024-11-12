<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis</title>
    <link rel="stylesheet" href="eventdisplay.css"> 
    <style>
    /* Targeting the select element with ID 'category' */
#category {
    padding: 1rem;
    margin-bottom: 1.5rem;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    background-color: rgba(255, 255, 255, 0.1);
    color: var(--text-color);
    transition: background-color 0.3s ease;
}

/* Style when the select element is focused */
#category:focus {
    outline: none;
    background-color: rgba(255, 255, 255, 0.2);
}

/* Style for the option elements within the select */
#category option {
    background-color: var(--primary-color);
    color: var(--text-color);
}

/* Hover effect for options */
#category option:hover {
    background-color: var(--accent-color);
}
    </style>
</head>

<body>
    <div class="container">
        <div class="diagonal-split"></div>
        <header class="header">
            <div class="header-content">
                <a href="index.jsp" class="logo navl">EventAxis</a>
                <nav>
                    <ul>
                        <li><a href="index.jsp" class="navr">Home</a></li>
                        <li><a href="EventsMain.jsp" class="navr">Events</a></li>
                        <li><a href="#" class="navr">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <h2>Find Your Next Adventure</h2>
            <form id="eventForm">
                <label for="searchEventName">Event Name or Keywords:</label>
                <input type="text" id="searchEventName" name="searchEventName"
                    placeholder="e.g., Music Festival, Tech Conference, Art Exhibition...">

                <label for="category">Choose a Category:</label>
                <select id="category" name="category">
                    <option value="">All Categories</option>
                    <option value="music">Music</option>
                    <option value="tech">Technology</option>
                    <option value="art">Art</option>
                    <option value="sports">Sports</option>
                    <option value="education">Education</option>
                    <option value="health">Health</option>
                    <!-- Add more categories as needed -->
                </select>

                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Discover Events</button>
                    <button type="button" class="btn btn-secondary" onclick="loadAllEvents()">View All Events</button>
                </div>
            </form>
            <div id="eventList"></div>
        </main>
    </div>

   <script>
    document.getElementById("eventForm").addEventListener("submit", function (event) {
        event.preventDefault();
        const searchQuery = document.getElementById("searchEventName").value;
        const category = document.getElementById("category").value;
        loadEvents(searchQuery, category);
    });

    function loadAllEvents() {
        loadEvents('', '');
    }

    function loadEvents(searchQuery, category) {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'displayEvent?searchEventName=' + encodeURIComponent(searchQuery) +
            '&category=' + encodeURIComponent(category), true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                document.getElementById("eventList").innerHTML = xhr.responseText;
            } else {
                document.getElementById("eventList").innerHTML = "<p>Error loading events.</p>";
            }
        };
        xhr.onerror = function () {
            document.getElementById("eventList").innerHTML = "<p>Network error.</p>";
        };
        xhr.send();
    }
</script>
   
   
</body>

</html>
