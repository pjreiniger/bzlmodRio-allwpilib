
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import edu.wpi.first.hal.HAL;

class BasicTest {
  @Test
  void basicTest() {
    HAL.initialize(500, 0);
  }
}
