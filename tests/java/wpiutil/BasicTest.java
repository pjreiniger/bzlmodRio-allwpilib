
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;
import edu.wpi.first.wpiutil.WPIUtilJNI;

class BasicTest {
  @Test
  void basicTest() {
    assertDoesNotThrow(WPIUtilJNI::now);
  }
}
