package lab1.task1;
import java.util.Random;

public class Task1 {
    public static void foo1(int a) throws NewException666,NewException777 {
        // Do not change this method!
        if(a == 6){
            NewException666 newException666 = new NewException666("666 Exception");
            throw newException666;
        }else if(a == 7){
            NewException777 newException777 = new NewException777("777 Exception");
            throw newException777;
        }else{
            System.out.println("There is no exception");
        }
    }


    public static void foo2(int a) throws NewException666,NewException777{
        try {
            foo1(a);
        } catch (NewException666 e) {
            NewException newException = new NewException("Yes I got 666 Exception");
            System.out.println("foo2 finished");
            newException.initCause(e);
            newException.printStackTrace();
        } catch (NewException777 e) {
            NewException newException = new NewException("Yes I got 777 Exception");
            System.out.println("foo2 finished");
            newException.initCause(e);
            newException.printStackTrace();
        }
    }


    public static void main(String[] args) {
        // Do not change this method!
        try{
            int luckynumber=new Random().nextInt(2)+6;
            System.out.println("You lucky number is: "+luckynumber);
            foo2(luckynumber);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
