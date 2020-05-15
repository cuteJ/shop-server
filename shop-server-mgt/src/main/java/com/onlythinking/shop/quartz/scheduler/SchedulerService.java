package com.onlythinking.shop.quartz.scheduler;

import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;

import java.util.Date;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface SchedulerService {

    void scheduleJob(String jobKey, Date schedulerDate, Map<String, Object> jobData, Class<? extends Job> jobClass);

    void scheduleJob(JobDetail jobDetail, Trigger trigger);

    void reschedule(String jobKey, Date schedulerDate);

    void deleteJob(String jobKey);

    void shutdown();

    Scheduler getScheduler();
}
