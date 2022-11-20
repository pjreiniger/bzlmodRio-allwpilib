
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import edu.wpi.cscore.CameraServerJNI;

class BasicTest {
  @Test
  void basicTest() {
    CameraServerJNI.getHostname();
  }
}
