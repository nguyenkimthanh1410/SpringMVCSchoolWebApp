package imic.springmvc.util;

import java.util.Random;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;


public final class StringUtils
{

    private StringUtils()
    {

    }

    public static boolean isNullOrEmpty(String value)
    {
        return value == null || value.isEmpty();
    }

    public static boolean lenghtPhone(String value, int min, int max)
    {
        return value.length() >= min && value.length() <= max;
    }

    public static boolean length(String value, int max)
    {
        return value.length() <= max;
    }

    public static boolean email(String value)
    {
        String emailPattern =
            "^[\\w!#$%&�*+/=?`{|}~^-]+(?:\\.[\\w!#$%&�*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
        Pattern regex = Pattern.compile(emailPattern);
        java.util.regex.Matcher matcher = regex.matcher(value);
        return matcher.find();
    }

    public static boolean isAscii(CharSequence _str)
    {
        if (_str == null || _str.length() == 0)
            return true;

        int i = 0;
        char c = 0;
        int len = _str.length();

        for (i = 0; i < len; i++)
        {
            c = _str.charAt(i);
            if ((c & 0xFF80) == 0)
                continue;
            return false;
        }

        return true;
    }

    public static String trim(String st, int limit)
    {
        byte[] b;
        byte[] b1;

        if (st == null || st.length() == 0)
            return "";

        b = st.getBytes();
        b1 = new byte[limit];

        if ((b.length) <= limit)
            return st;
        for (int i = 0; i < limit; i++)
            b1[i] = b[i];

        return new String(b1, 0, b1[limit - 1] >= 0xa1 ? limit - 1 : limit);
    }

    public static String nameFromEmail(String email)
    {
        return email.substring(0, email.indexOf('@'));
    }

    public static String getBeforeFirstByMark(String inString, String inMark) throws PatternSyntaxException
    {
        String[] parts = inString.split("\\" + inMark + ""); // String array, each element is
        // text between dots
        String beforeFirstDot = parts[0];
        return beforeFirstDot;
    }

    public static String getUserNameFromAssigny(String value)
    {
        String result = "";
        String[] us = value.split(Pattern.quote("("));
        result = us[1].substring(0, us[1].length() - 1);
        return result;
    }

    /**
     * @author QUYNQ
     *         <p>
     *         Add one-sentence summarising the method functionality here; this sentence should only contain one
     *         full-stop.
     *         </p>
     *
     * @since TODO module version when it was introduced
     * @return
     *
     */
    public static String getRandomPassword(int numberCharacter)
    {
        String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder pass = new StringBuilder();
        Random rnd = new Random();
        while (pass.length() < numberCharacter)
        { // length of the random string.
            int index = (int) (rnd.nextFloat() * CHARS.length());
            pass.append(CHARS.charAt(index));
        }
        String saltStr = pass.toString();
        return saltStr;
    }
}
