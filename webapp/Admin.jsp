<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventAxis</title>
    <link rel="stylesheet" href="admin.css"> 
</head>
<body>
    <header>
        <h1>Admin Portal</h1>
    </header>

    <div class="container">
        <div class="dashboard">
            <h2>Manage Events</h2>
            <table id="event-list">
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Club</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                  
                </tbody>
            </table>
        </div>
    </div>

    <script>
        const eventListTable = document.getElementById('event-list').getElementsByTagName('tbody')[0];

        function fetchEvents() {
            fetch('adminlisting?action=list')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    eventListTable.innerHTML = '';
                    data.forEach((event, index) => {
                        const newRow = eventListTable.insertRow();
                        newRow.innerHTML = `
                            <td>${index + 1}</td>
                            <td>${event.event_name}</td>
                            <td>${event.event_date}</td>
                            <td>${event.club}</td>
                            <td>
                                <button class="delete-btn" onclick="deleteEvent(${event.id})">Delete</button>
                            </td>
                        `;
                    });
                })
                .catch(error => console.error('Error fetching events:', error));
        }

        function deleteEvent(id) {
            if (confirm("Are you sure you want to delete this event?")) {
                fetch(`adminlisting?action=delete&id=${id}`, { method: 'DELETE' })
                    .then(response => {
                        if (response.ok) {
                            fetchEvents(); 
                        } else {
                            console.error('Error deleting event:', response.statusText);
                        }
                    })
                    .catch(error => console.error('Error deleting event:', error));
            }
        }

        
        fetchEvents();
    </script>
</body>
</html>
