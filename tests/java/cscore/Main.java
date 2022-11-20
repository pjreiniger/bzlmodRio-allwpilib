

package bazelrio_test;

import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import edu.wpi.first.util.CircularBuffer;
import edu.wpi.first.util.WPIUtilJNI;
import edu.wpi.first.util.CombinedRuntimeLoader;
import edu.wpi.first.cscore.CameraServerJNI;

public class Main {
    private static final double[] m_values = {
      751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
    };

    public static void main(String[] args) {
        System.out.println("Hello World");
        System.out.println(System.getProperty("user.dir"));

        System.out.println(CameraServerJNI.getHostname());
        
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
        Mat mat = Mat.eye(3, 3, CvType.CV_8UC1);
        System.out.println("mat = " + mat.dump());

    }
}