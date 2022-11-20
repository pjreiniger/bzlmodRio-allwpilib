

package bazelrio_test;

import edu.wpi.first.wpiutil.CircularBuffer;
import edu.wpi.first.wpiutil.WPIUtilJNI;
import edu.wpi.first.wpiutil.CombinedRuntimeLoader;
import edu.wpi.first.networktables.*;

public class Main {
    private static final double[] m_values = {
      751.848, 766.366, 342.657, 234.252, 716.126, 132.344, 445.697, 22.727, 421.125, 799.913
    };

    public static void main(String[] args) {
        System.out.println("Hello World");
        
        NetworkTableInstance m_serverInst = NetworkTableInstance.create();
        NetworkTableInstance m_clientInst = NetworkTableInstance.create();
        
    m_serverInst.startServer("topiclistenertest.json", "127.0.0.1", 10010);
    m_clientInst.startClient("client");
    m_clientInst.setServer("127.0.0.1", 10010);
    
    System.out.println("Hello World");
    }
}