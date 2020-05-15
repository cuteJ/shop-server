package com.onlythinking.shop.quartz.scheduler;

import com.google.common.collect.Maps;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.exception.CoreErrorCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.Map;

import static org.quartz.TriggerKey.triggerKey;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Component
public class SchedulerServiceImpl implements SchedulerService {

    private final Scheduler scheduler;

    private static final String MOBILE_JOB_KEY_GROUP = "shop_job_group";
    private static final String MOBILE_TRIGGER_KEY = "_trigger";
    private static final String MOBILE_TRIGGER_KEY_GROUP = "shop_job_trigger_group";

    @Override
    public void scheduleJob(String jobKey, Date schedulerDate, Map<String, Object> jobData, Class<? extends Job> jobClass) {
        if (CollectionUtils.isEmpty(jobData)) {
            jobData = Maps.newHashMap();
        }

        JobDetail jobDetail = JobBuilder.newJob(jobClass)
          .withIdentity(jobKey, MOBILE_JOB_KEY_GROUP)
          .storeDurably()
          .setJobData(new JobDataMap(jobData))
          .build();

        Trigger trigger = TriggerBuilder.newTrigger()
          .withIdentity(shopTriggerKey(jobKey))
          .forJob(jobDetail)
          .startAt(schedulerDate)
          .build();

        try {
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (SchedulerException e) {
            throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, e.getMessage());
        }
    }

    @Override
    public void scheduleJob(JobDetail jobDetail, Trigger trigger) {
        try {
            scheduler.scheduleJob(jobDetail, trigger);
            if (!this.scheduler.isShutdown()) {
                this.scheduler.start();
                log.info("System job {} staring", trigger.getJobKey());
            }
        } catch (SchedulerException e) {
            throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, e.getMessage());
        }
    }

    @Override
    public void reschedule(String jobKey, Date schedulerDate) {
        try {
            JobDetail jobDetail = scheduler.getJobDetail(shopJobKey(jobKey));
            if (null == jobDetail) {
                throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, String.format("任务[%s]不存在", jobKey));
            }
            Trigger trigger = TriggerBuilder.newTrigger()
              .withIdentity(shopTriggerKey(jobKey))
              .forJob(jobDetail)
              .startAt(schedulerDate)
              .build();
            scheduler.rescheduleJob(shopTriggerKey(jobKey), trigger);
        } catch (SchedulerException e) {
            throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, e.getMessage());
        }
    }

    @Override
    public void deleteJob(String jobKey) {
        try {
            scheduler.deleteJob(shopJobKey(jobKey));
        } catch (SchedulerException e) {
            throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, e.getMessage());
        }
    }

    @Override
    public void shutdown() {
        try {
            scheduler.shutdown(true);
        } catch (SchedulerException e) {
            throw new RespondedException(CoreErrorCode.SCHEDULE_JOB_EXCEPTION, e.getMessage());
        }
    }

    @Override
    public Scheduler getScheduler() {
        return this.scheduler;
    }

    private JobKey shopJobKey(String jobKey) {
        return new JobKey(jobKey, MOBILE_JOB_KEY_GROUP);
    }

    private TriggerKey shopTriggerKey(String jobKey) {
        return triggerKey(jobKey + MOBILE_TRIGGER_KEY, MOBILE_TRIGGER_KEY_GROUP);
    }
}
