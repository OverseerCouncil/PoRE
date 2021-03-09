package lab1.task2;

public class GPA {
    public double myGPA = 0;

    public synchronized void add(double i) {
        myGPA += i;
    }

}
