	import java.util.Random;
public class rdnm {

	
	   public static int createrdnm() {
	      Random rand = new Random();
	      System.out.println("Random numbers...");
	    
	      int resRandom=0;
	      for (int i = 1; i<= 10; i++) {
	         resRandom = rand.nextInt((9999 - 100) + 1) + 10;}
	      System.out.println("Random numbers...");
	      return resRandom;
	      
	   }

	}

