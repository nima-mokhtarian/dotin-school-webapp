package util;

import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public abstract class LoggingUtility {
    private static final Logger bankLogger;
    private static final Level _LEVEL = Level.INFO;

    static {
        bankLogger = LogManager.getLogger(LoggingUtility.class);
    }

    public static void writeLog(String log) {
        bankLogger.log(_LEVEL, log);
    }
}
