package lab1.task2;

import java.util.Arrays;

public class Task2 {
    public static void main(String[] args) {
        // Do not change this method!
        GPA mygpa=new GPA();
        double[] s1grade=new double[20];
        double[] s2grade=new double[30];
        double[] s3grade=new double[20];
        double[] s4grade=new double[30];
        Arrays.fill(s1grade,0.05);
        Arrays.fill(s2grade,0.1);
        Arrays.fill(s3grade,0.05);
        Arrays.fill(s4grade,0.1);
        Semester s1=new Semester(mygpa,s1grade);
        Semester s2=new Semester(mygpa,s2grade);
        Semester s3=new Semester(mygpa,s3grade);
        Semester s4=new Semester(mygpa,s4grade);

        Thread t1 = new Thread(s1);
        Thread t2 = new Thread(s2);
        Thread t3 = new Thread(s3);
        Thread t4 = new Thread(s4);
        t4.start();
        t2.start();
        t3.start();
        t1.start();

        try {
            t1.join();
            t2.join();
            t3.join();
            t4.join();

            if(mygpa.myGPA>=7.999){
                System.out.println("Amazing, your GPA is 8!");
            }
            else{
                System.out.println("Try again!");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
