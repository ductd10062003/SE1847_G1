/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

/**
 *
 * @author admin
 */
public class IConstant {
    public final static String[] USER_INFO = {"User Info", "Change Password"};
    public static final String REGEX_NAME = "^[A-Za-z]+$";
    public static final String REGEX_PHONE_NUMBER = "^\\d{10}$";
    public static final String PASSWORD_LENGTH = "8";
    public static final String REGEX_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{"+PASSWORD_LENGTH+",}$";
    public static final String REGEX_EMAIL = "^[\\w-\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
    public static final String REGEX_TEXT = "^[A-Za-z0-9 ,\\.]+S";
}
