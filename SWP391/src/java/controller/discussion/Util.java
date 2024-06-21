//package controller.discussion;
//
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//import java.time.temporal.ChronoUnit;
//import org.jsoup.Jsoup;
///*
//NEU KHONG CHAY DUOC THI THEM THU VIEN O LIB: jsoup-1.10.2.jar vao trong thu vien cua project
// */
//
//import org.jsoup.nodes.Document;
//
//public class Util {
//    public static long calculateDaysPassed(String dateString) {
//        // Define the date format
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//
//        // Parse the date string to a LocalDate object
//        LocalDate givenDate = LocalDate.parse(dateString, formatter);
//
//        // Get the current date
//        LocalDate currentDate = LocalDate.now();
//
//        // Calculate the number of days between the given date and the current date
//        return ChronoUnit.DAYS.between(givenDate, currentDate);
//    }
//
//    public static String stringShortener(String string, int length) {
//        if (string.length() > length) {
//            return string.substring(0, length - 3) + "...";
//            // Subtract 3 from the length to leave space for the ellipsis
//        } else {
//            return string;
//        }
//    }
//
//    public static String extractTextFromHTML(String htmlContent) {
//        // Parse the HTML content using Jsoup
//        Document doc = Jsoup.parse(htmlContent);
//
//        // Use Jsoup selectors to extract text from elements
//        String text = doc.text();
//
//        return text;
//    }
//
//    public static String shortenedHTML(String htmlContent, int length) {
//        String text = extractTextFromHTML(htmlContent);
//        return stringShortener(text, length);
//    }
//
//    public static void main(String[] args) {
//        // Example usage
//        String htmlContent = "<p>The&nbsp;<strong>Grumman F-14 Tomcat</strong>&nbsp;is an American carrier-capable&nbsp;<a href=\"https://en.wikipedia.org/wiki/Supersonic_aircraft\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">supersonic</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Twinjet\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">twin-engine</a>, two-seat, twin-tail, all-weather-capable&nbsp;<a href=\"https://en.wikipedia.org/wiki/Variable-sweep_wing\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">variable-sweep wing</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fighter_aircraft\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">fighter aircraft</a>. The Tomcat was developed for the&nbsp;<a href=\"https://en.wikipedia.org/wiki/United_States_Navy\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">United States Navy</a>'s Naval Fighter Experimental (VFX) program after the collapse of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/General_Dynamics%E2%80%93Grumman_F-111B\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">General Dynamics-Grumman F-111B</a>&nbsp;project. A large and well-equipped fighter, the F-14 was the first of the American&nbsp;<a href=\"https://en.wikipedia.org/wiki/Teen_Series\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">Teen Series</a>&nbsp;fighters, which were designed incorporating&nbsp;<a href=\"https://en.wikipedia.org/wiki/Aerial_warfare\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">air combat</a>&nbsp;experience against&nbsp;<a href=\"https://en.wikipedia.org/wiki/List_of_Mikoyan_and_MiG_aircraft\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">MiG fighters</a>&nbsp;during the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vietnam_War\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">Vietnam War</a>.</p><p>The F-14 first flew on 21 December 1970 and made its first deployment in 1974 with the U.S. Navy aboard&nbsp;<a href=\"https://en.wikipedia.org/wiki/USS_Enterprise_(CVN-65)\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">USS&nbsp;<em>Enterprise</em>&nbsp;(CVN-65)</a>, replacing the&nbsp;<a href=\"https://en.wikipedia.org/wiki/McDonnell_Douglas_F-4_Phantom_II\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">McDonnell Douglas F-4 Phantom II</a>. The F-14 served as the U.S. Navy's primary maritime&nbsp;<a href=\"https://en.wikipedia.org/wiki/Air_superiority_fighter\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">air superiority fighter</a>, fleet defense&nbsp;<a href=\"https://en.wikipedia.org/wiki/Interceptor_aircraft\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">interceptor</a>, and tactical&nbsp;<a href=\"https://en.wikipedia.org/wiki/Aerial_reconnaissance\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">aerial reconnaissance</a>&nbsp;platform into the 2000s. The Low Altitude Navigation and Targeting Infrared for Night (<a href=\"https://en.wikipedia.org/wiki/LANTIRN\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">LANTIRN</a>) pod system was added in the 1990s and the Tomcat began performing precision ground-attack missions.<a href=\"https://en.wikipedia.org/wiki/Grumman_F-14_Tomcat#cite_note-USN_FF-1\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\"><sup>[1]</sup></a></p><p>The Tomcat was retired by U.S. Navy on 22 September 2006, supplanted by the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Boeing_F/A-18E/F_Super_Hornet\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">Boeing F/A-18E/F Super Hornet</a>. Several retired F-14s have been put on display across the US.</p><p>Having been exported to&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pahlavi_Iran\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">Pahlavi Iran</a>&nbsp;under the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Western_Bloc\" target=\"_blank\" style=\"background-color: initial; color: var(--color-progressive,#36c);\">Western-aligned</a>&nbsp;Shah&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mohammad_Reza_Pahlavi\" target=\"_blank\" style=\"background-color: initial;";
//        System.out.println(shortenedHTML(htmlContent, 100));
//    }
//}
