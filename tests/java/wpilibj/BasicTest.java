
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import edu.wpi.first.wpilibj.SlewRateLimiter;
import edu.wpi.first.wpilibj.Timer;

class BasicTest {
  @Test
  void basicTest() {
    SlewRateLimiter limiter = new SlewRateLimiter(1);
    Timer.delay(1);
    assertTrue(limiter.calculate(2) < 2);
  }
}
