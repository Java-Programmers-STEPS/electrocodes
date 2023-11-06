
//Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSMS {
 // Find your Account Sid and Auth Token at twilio.com/console
	
	
	
 public static final String ACCOUNT_SID =
         "AC502d2c85b727872ad88a990f580a00bc";
 public static final String AUTH_TOKEN =
         "6e7c79943b7e311c5eaf6621ea8a09de";

 public static void sendsms(String phoneNumber, int otp) {
     Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

     Message message = Message
             .creator(new PhoneNumber(phoneNumber), // to
                     new PhoneNumber("+18592740758"), 
                     "your OTP is"+ otp)
             .create();
System.out.println("otp send");
     System.out.println(message.getSid());
 }
}
