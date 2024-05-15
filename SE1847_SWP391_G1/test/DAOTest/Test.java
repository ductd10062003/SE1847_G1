package DAOTest;

import entity.User;
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
    }
}
