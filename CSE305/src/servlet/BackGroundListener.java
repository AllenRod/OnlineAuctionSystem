package servlet;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
/**
 * Class that handles sending emails about appointments
 * 
 * @author CSE308 Team Five
 */
@WebListener
public class BackGroundListener implements ServletContextListener {

	// ScheduledExecutorService object
	private ScheduledExecutorService scheduler;
	
	public BackGroundListener() {
		super();
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		scheduler.shutdownNow();
	}
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.scheduleAtFixedRate(new AuctionChecker(), 0, 30,
				TimeUnit.MINUTES);
	}
}
