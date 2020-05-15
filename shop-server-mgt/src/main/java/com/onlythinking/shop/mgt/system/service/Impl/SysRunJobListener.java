package com.onlythinking.shop.mgt.system.service.Impl;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Throwables;
import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.mapper.OtSysJobRunLogMapper;
import com.onlythinking.shop.model.OtSysJobRunLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@Component
public class SysRunJobListener implements JobListener {
    @Autowired
    private OtSysJobRunLogMapper jobRunLogMapper;

    @Override
    public String getName() {
        return "sysRunJobListener";
    }

    @Override
    public void jobToBeExecuted(JobExecutionContext context) {

    }

    @Override
    public void jobExecutionVetoed(JobExecutionContext context) {

    }

    @Override
    public void jobWasExecuted(JobExecutionContext context, JobExecutionException jobException) {
        String instanceId = context.getMergedJobDataMap().getString("instanceId");
        if (StringUtils.isBlank(instanceId)) {
            log.warn("任务{}数据 为空", instanceId);
            return;
        }
        OtSysJobRunLog runLog = new OtSysJobRunLog();
        runLog.setInstanceId(instanceId);
        if (null != jobException) {
            log.error("执行任务失败", jobException);
            runLog.setInstanceId(instanceId);
            runLog.setStatus(DicConstant.VAL_1004_01);
            if (null != context.getResult()) {
                runLog.setResult(JSON.toJSONString(context.getResult()));
            }
            runLog.setRemark(Throwables.getRootCause(jobException).getMessage());
            jobRunLogMapper.insert(runLog);
        }
        // todo 添加标记是否记录日志
//        } else {
//            runLog.setStatus(DicConstant.VAL_1004_00);
//            if (null != context.getResult()) {
//                runLog.setResult(JSON.toJSONString(context.getResult()));
//            }
//            runLog.setRemark("ok");
//            jobRunLogMapper.insert(runLog);
//        }
    }
}
