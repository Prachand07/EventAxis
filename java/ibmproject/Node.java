package ibmproject;



public class Node {
    Events event;
    Node next;

    public Node(Events event) {
        this.event = event;
        this.next = null;
    }
}
