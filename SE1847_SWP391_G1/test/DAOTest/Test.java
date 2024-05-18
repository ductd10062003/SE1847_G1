package DAOTest;

import entity.User;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.DAOUser;

public class Test {
    public static void main(String[] args) {
        DAOUser daoUser = new DAOUser();
        //test get all users -----------------
//        for(User user : daoUser.getAllUsers()){
//            System.out.println(user);
//        }
        // -> Test ok
        //test get a user--------------------
//        String username = "user1@gmail.com"; String password = "123456";
//        System.out.println(daoUser.getUser(username, password));
        // -> Test ok
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String formattedDate = today.format(formatter);
        System.out.println("Today's date formatted: " + formattedDate);
    }
}
