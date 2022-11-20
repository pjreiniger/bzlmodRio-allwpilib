

package bazelrio_test;

import edu.wpi.first.util.CircularBuffer;
import edu.wpi.first.util.WPIUtilJNI;
import edu.wpi.first.util.CombinedRuntimeLoader;

import java.io.IOException;

import edu.wpi.first.net.WPINetJNI;

public class Main {
    private static final double[] m_values = {
      751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
    };

    public static void main(String[] args) {
        System.out.println(System.getProperty("user.dir"));

        
        CircularBuffer queue = new CircularBuffer(8);
        
        try {
            WPINetJNI.forceLoad();
            System.out.println("Loaded JNI");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        System.out.println("Hello World");

    }
}