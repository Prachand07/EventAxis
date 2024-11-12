package ibmproject;



import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class EventLinkedList {
    Node head;

    public void append(Events event) {
        Node newNode = new Node(event);
        if (head == null) {
            head = newNode;
            return;
        }
        Node current = head;
        while (current.next != null) {
            current = current.next;
        }
        current.next = newNode;
    }

    public void readFromCSV(String filePath) {
        
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) { 
                    String name = parts[0].trim();
                    String description = parts[1].trim();
                    if (!name.isEmpty() && !description.isEmpty()) { 
                        Events event = new Events(name, description);
                        append(event); 
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeToCSV(String filePath) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            Node current = head;
            while (current != null) {
                writer.println(current.event.getName() + "," + current.event.getDescription());
                current = current.next;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

