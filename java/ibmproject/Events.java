package ibmproject;



public class Events {
    private String name;
    private String description;

    public Events(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
