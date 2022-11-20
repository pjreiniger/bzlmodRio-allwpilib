
package bazelrio_test;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import edu.wpi.first.wpilibj2.command.CommandScheduler;
import edu.wpi.first.wpilibj2.command.StartEndCommand;
import edu.wpi.first.wpilibj2.command.CommandGroupBase;

import edu.wpi.first.wpilibj.DriverStation;
import edu.wpi.first.wpilibj.simulation.DriverStationSim;

class BasicTest {
  
  public class ConditionHolder {
    private boolean m_condition;

    public void setCondition(boolean condition) {
      m_condition = condition;
    }

    public boolean getCondition() {
      return m_condition;
    }
  }
  
  @BeforeEach
  void commandSetup() {
    CommandScheduler.getInstance().cancelAll();
    CommandScheduler.getInstance().enable();
    CommandScheduler.getInstance().clearButtons();
    CommandGroupBase.clearGroupedCommands();
    setDSEnabled(true);
  }

  public void setDSEnabled(boolean enabled) {
    DriverStationSim.setDsAttached(true);

    DriverStationSim.setEnabled(enabled);
    DriverStationSim.notifyNewData();
    DriverStation.getInstance().isNewControlData();
    while (DriverStation.getInstance().isEnabled() != enabled) {
      try {
        Thread.sleep(1);
      } catch (InterruptedException exception) {
        exception.printStackTrace();
      }
    }
  }

  @Test
  void basicTest() {
    try (CommandScheduler scheduler = CommandScheduler.getInstance()) {
      ConditionHolder cond1 = new ConditionHolder();
      ConditionHolder cond2 = new ConditionHolder();

      StartEndCommand command =
          new StartEndCommand(() -> cond1.setCondition(true), () -> cond2.setCondition(true));

      scheduler.schedule(command);
      scheduler.run();

      assertTrue(scheduler.isScheduled(command));

      scheduler.cancel(command);

      assertFalse(scheduler.isScheduled(command));
      assertTrue(cond1.getCondition());
      assertTrue(cond2.getCondition());
    }
  }
}
