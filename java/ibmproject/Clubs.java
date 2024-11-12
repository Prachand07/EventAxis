package ibmproject;

public class Clubs {
    private String name;
    private String password;
    private String email;
    
    

    public Clubs(String name, String password,String email) {
        this.name = name;
        this.email=email;
        this.password = password;
        
    }

    public String getName() {
        return name;
    }
    
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String toString() {
        return name + "," + password + "," + email;
    }
       
    }

