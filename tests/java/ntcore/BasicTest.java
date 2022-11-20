
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import edu.wpi.first.networktables.NetworkTablesJNI;

class BasicTest {
  @Test
  void basicTest() {
    int inst = NetworkTablesJNI.getDefaultInstance();
    NetworkTablesJNI.flush(inst);
  }
}
