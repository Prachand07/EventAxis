package ibmproject;

import java.util.Date;

public class ListEvent {
    private String name;
    private String description;
    private Date date;
    private String category;
    
    public ListEvent(String name, String description, Date date, String eventcategory) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.category = category;
    }
    

    
    public String getcateogry() {
        return category;
    }
    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Date getDate() {
        return date;
    }
}
