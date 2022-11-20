

package bazelrio_test;

import edu.wpi.first.util.CircularBuffer;
import edu.wpi.first.util.WPIUtilJNI;
import edu.wpi.first.util.CombinedRuntimeLoader;
import edu.wpi.first.math.util.Units;
import edu.wpi.first.math.ComputerVisionUtil;
import org.ejml.simple.SimpleMatrix;

public class Main {
    private static final double[] m_values = {
      751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
    };

    public static void main(String[] args) {
        
    double camHeight = 1;
    double targetHeight = 3;
    double camPitch = Units.degreesToRadians(0);
    double targetPitch = Units.degreesToRadians(30);
    double targetYaw = Units.degreesToRadians(0);
    double dist =
        ComputerVisionUtil.calculateDistanceToTarget(
            camHeight, targetHeight, camPitch, targetPitch, targetYaw);

    System.out.println(dist);

    int n1 = 4;
    int m1 = 1;
    
    SimpleMatrix A1 =
        new SimpleMatrix(
                n1, n1, true, new double[] {0.5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0})
            .transpose();

    System.out.println(A1);

    }
}