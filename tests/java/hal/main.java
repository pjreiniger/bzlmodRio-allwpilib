

package bazelrio_test;

import edu.wpi.first.util.CircularBuffer;
import edu.wpi.first.util.WPIUtilJNI;
import edu.wpi.first.util.CombinedRuntimeLoader;
import edu.wpi.first.hal.HAL;

public class Main {
    private static final double[] m_values = {
      751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
    };

    public static void main(String[] args) {
        System.out.println("Hello World");
        HAL.initialize(500, 0);

    }
}