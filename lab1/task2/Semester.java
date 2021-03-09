package lab1.task2;

public class Semester implements Runnable {
    GPA g = null;
    double[] grade;

    public Semester(GPA cg, double[] cgrage) {
        this.g = cg;
        this.grade = cgrage;
    }

    @Override
    public void run() {
        try {
            for (double k : this.grade) {
                this.g.add(k);
                Thread.sleep(30);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
