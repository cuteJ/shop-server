package com.onlythinking.shop.mgt.system.service;

import com.onlythinking.shop.mgt.system.dto.JobInstanceDto;
import com.onlythinking.shop.model.OtSysJobDetails;
import com.onlythinking.shop.model.OtSysJobInstance;
import com.onlythinking.shop.model.OtSysJobRunLog;
import com.onlythinking.shop.model.OtSysJobTrigger;

import java.util.List;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public interface SysJobService {

    // 任务详情--------------------------details----------------------
    List<OtSysJobDetails> getSysJobDetailsList(Map<String, Object> params);

    OtSysJobDetails saveOrUpdateJobDetails(OtSysJobDetails dto);

    void removeJobDetails(String id);

    // 任务触发器--------------------------trigger----------------------
    List<OtSysJobTrigger> getSysJobTriggerList(Map<String, Object> params);

    OtSysJobTrigger saveOrUpdateJobTrigger(OtSysJobTrigger dto);

    void removeJobTrigger(String id);

    // 任务实例---------------------------instance---------------------

    List<OtSysJobInstance> getSysJobInstanceList(Map<String, Object> params);

    OtSysJobInstance getJobInstance(String instanceId);

    boolean checkJobInstance(String instanceId);

    // 创建任务实例
    void saveJobInstance(JobInstanceDto dto);

    boolean checkJobTrigger(OtSysJobTrigger trigger, boolean errorIfException);

    void startJobInstance(String instanceId);

    void pauseJobInstance(String instanceId);

    void removeJobInstance(String instanceId);

    // 实例日志--------------------------run logs----------------------
    List<OtSysJobRunLog> getSysJobRunLogList(Map<String, Object> params);

    Map<String, Object> jobRunLogStatistics(Map<String, Object> params);
}
