<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventAxis</title>
    <link rel="stylesheet" href="pastup.css"> 
    
</head>
<body>
  <header class="header">
            <div class="header-content">
                <a href="index.jsp" class="logo navl">EventAxis</a>
                <nav>
                    <ul>
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
        <h1>Event Axis</h1>

        <div class="button-container">
            <form action="eventlist" method="get">
                <button type="submit" name="action" value="past" class="tab">Show Past Events</button>
                <button type="submit" name="action" value="upcoming" class="tab">Show Upcoming Events</button>
            </form>
        </div>

        <div class="events-grid">
            <c:if test="${not empty events}">
        <c:forEach var="event" items="${events}">
            <div class="event-card">
                <div class="event-card-header">
                    <h3>${event.name}</h3>
                </div>
                <div class="event-card-body">
                    <c:choose>
                        
                        <c:when test="${param.action == 'past'}">
                            <p class="date">Happened on ${event.date}</p> 
                            <h4>${event.description}</h4>
                        </c:when>
                       
                        <c:when test="${param.action == 'upcoming'}">
                            <p class="date">Happening on ${event.date}</p>
                            <h4>${event.description}</h4>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </c:if>

            <c:if test="${empty events && not empty param.action}">
                <script>
                    alert('No events to display.');
                </script>
            </c:if>
        </div>
    </main>
</body>
</html>
