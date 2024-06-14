package controller.discussion;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class Util {
    public static long calculateDaysPassed(String dateString) {
        // Define the date format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Parse the date string to a LocalDate object
        LocalDate givenDate = LocalDate.parse(dateString, formatter);

        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Calculate the number of days between the given date and the current date
        return ChronoUnit.DAYS.between(givenDate, currentDate);
    }

    public static String stringShortener(String string, int length){
        if(string.length() > length){
            return string.substring(0, length) + "...";
        } else {
            return string;
        }
    }

}
