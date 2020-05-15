package com.onlythinking.shop.mgt.system.jobs;

import com.onlythinking.commons.exception.RespondedException;
import lombok.extern.slf4j.Slf4j;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

import java.util.Random;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@DisallowConcurrentExecution
public class HelloWordJob implements Job {

    @Override
    public void execute(JobExecutionContext context) {
        String instanceId = context.getMergedJobDataMap().getString("instanceId");
        log.info("Job [{}] running ", instanceId);
        log.info("Hello world");

        if (new Random().nextInt(20) % 2 == 0) {
            throw RespondedException.argumentInvalid("执行任务参数错误");
        }
    }

}
