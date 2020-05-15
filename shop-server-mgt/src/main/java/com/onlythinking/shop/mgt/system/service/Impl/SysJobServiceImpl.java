package com.onlythinking.shop.mgt.system.service.Impl;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.onlythinking.commons.exception.RespondedException;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.core.utils.UUIDUtils;
import com.onlythinking.shop.core.utils.Validations;
import com.onlythinking.shop.mapper.OtSysJobDetailsMapper;
import com.onlythinking.shop.mapper.OtSysJobInstanceMapper;
import com.onlythinking.shop.mapper.OtSysJobRunLogMapper;
import com.onlythinking.shop.mapper.OtSysJobTriggerMapper;
import com.onlythinking.shop.mgt.system.dto.JobInstanceDto;
import com.onlythinking.shop.mgt.system.service.SysJobService;
import com.onlythinking.shop.model.OtSysJobDetails;
import com.onlythinking.shop.model.OtSysJobInstance;
import com.onlythinking.shop.model.OtSysJobRunLog;
import com.onlythinking.shop.model.OtSysJobTrigger;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
public class SysJobServiceImpl implements SysJobService {

    private final OtSysJobDetailsMapper jobDetailsMapper;
    private final OtSysJobTriggerMapper jobTriggerMapper;
    private final OtSysJobInstanceMapper jobInstanceMapper;
    private final OtSysJobRunLogMapper jobRunLogMapper;

    private final Scheduler scheduler;

    @Override
    public List<OtSysJobDetails> getSysJobDetailsList(Map<String, Object> params) {
        return jobDetailsMapper.getList(params);
    }

    @Override
    public OtSysJobDetails saveOrUpdateJobDetails(OtSysJobDetails dto) {
        if (StringUtils.isNotBlank(dto.getId())) {
            jobDetailsMapper.updateByPK(dto);
        } else {
            dto.setStatus(DicConstant.VAL_1000_00);
            jobDetailsMapper.insert(dto);
        }
        return dto;
    }

    @Override
    public void removeJobDetails(String id) {
        List<OtSysJobInstance> jobInstances = jobInstanceMapper.getList(ImmutableMap.of("jobId", id));
        if (CollectionUtils.isNotEmpty(jobInstances)) {
            log.info("该任务存在实例关联数据 {}", jobInstances.stream().map(OtSysJobInstance::getInstanceId).toArray());
            throw RespondedException.violationError("{mgt.system.job.details.remove.pre}");
        }
        OtSysJobDetails db = jobDetailsMapper.getByPK(id);
        jobDetailsMapper.deleteByPK(db.getId());
    }

    @Override
    public List<OtSysJobTrigger> getSysJobTriggerList(Map<String, Object> params) {
        return jobTriggerMapper.getList(params);
    }

    @Override
    public OtSysJobTrigger saveOrUpdateJobTrigger(OtSysJobTrigger dto) {
        this.checkJobTrigger(dto, true);

        if (StringUtils.isNotBlank(dto.getId())) {
            jobTriggerMapper.updateByPK(dto);
        } else {
            jobTriggerMapper.insert(dto);
        }
        return dto;
    }

    @Override
    public void removeJobTrigger(String id) {
        List<OtSysJobInstance> jobInstances = jobInstanceMapper.getList(ImmutableMap.of("triggerId", id));
        if (CollectionUtils.isNotEmpty(jobInstances)) {
            log.info("该触发器存在实例关联数据 {}", jobInstances.stream().map(OtSysJobInstance::getInstanceId).toArray());
            throw RespondedException.violationError("{mgt.system.job.trigger.remove.pre}");
        }
        OtSysJobTrigger db = jobTriggerMapper.getByPK(id);
        jobTriggerMapper.deleteByPK(db.getId());
    }

    @Override
    public List<OtSysJobInstance> getSysJobInstanceList(Map<String, Object> params) {
        return jobInstanceMapper.getList(params);
    }

    @Override
    public OtSysJobInstance getJobInstance(String instanceId) {
        return jobInstanceMapper.getOne(ImmutableMap.of("instanceId", instanceId));
    }

    @Override
    public boolean checkJobInstance(String instanceId) {
        OtSysJobInstance jobInstance = getJobInstance(instanceId);
        TriggerKey triggerKey = TriggerKey.triggerKey(jobInstance.getInstanceId(), StringUtils.isBlank(jobInstance.getGroupName()) ? Scheduler.DEFAULT_GROUP : jobInstance.getGroupName());
        try {
            if (scheduler.checkExists(triggerKey)) {
                return true;
            }
        } catch (SchedulerException e) {
            log.error("{} error {}", jobInstance.getJobName(), e.toString());
            throw RespondedException.argumentInvalid(e.getMessage());
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional
    public void saveJobInstance(JobInstanceDto dto) {
        OtSysJobDetails jobDetails = jobDetailsMapper.getByPK(dto.getJobId());
        OtSysJobTrigger jobTrigger = jobTriggerMapper.getByPK(dto.getTriggerId());

        if (null == jobDetails || null == jobTrigger) {
            throw RespondedException.argumentInvalid("{mgt.system.job.trigger.null}");
        }
        OtSysJobInstance instance = new OtSysJobInstance();
        String instanceId = UUIDUtils.getUUID();
        instance.setJobId(jobDetails.getId());
        instance.setTriggerId(jobTrigger.getId());
        instance.setClazzPath(jobDetails.getClazzPath());
        instance.setGroupName(StringUtils.isNotBlank(dto.getGroupName()) ? dto.getGroupName() : Scheduler.DEFAULT_GROUP);
        instance.setInstanceId(instanceId);
        if (null != dto.getInstanceParams() && dto.getInstanceParams().keySet().size() > 0) {
            instance.setInstanceParams(JSON.toJSONString(dto.getInstanceParams()));
        }

        instance.setJobName(jobDetails.getJobName() + "-" + RandomStringUtils.randomAlphabetic(5).toLowerCase());
        instance.setTriggerRule(dto.toTriggerRule(jobTrigger));
        instance.setStartTime(dto.getStartTime());
        instance.setEndTime(dto.getEndTime());
        instance.setStatus(DicConstant.VAL_1003_00);

        jobInstanceMapper.insert(instance);

        // 启动实例
        try {
            Class<? extends Job> clazz = (Class<? extends Job>) Class.forName(jobDetails.getClazzPath());

            JobDataMap data = new JobDataMap();
            // 填充任务参数 todo
//            jobDetails.getJobParams();
            data.put("instanceId", instanceId);
            if (null != dto.getInstanceParams() && dto.getInstanceParams().keySet().size() > 0) {
                Map<String, String> params = dto.getInstanceParams();
                for (String param : params.keySet()) {
                    data.put(param, params.get(param));
                }
            }

            JobDetail jobDetail = JobBuilder
              .newJob(clazz)
              .withIdentity(instance.getInstanceId(), instance.getGroupName())
              .setJobData(data)
              .build();

            Trigger trigger = toTrigger(instance, jobTrigger);
            scheduler.scheduleJob(jobDetail, trigger);
            if (!this.scheduler.isStarted()) {
                this.scheduler.start();
                log.info("---Job instance [{}] start-------", instance.getInstanceId());
            } else {
                log.info("---Job instance [{}] already start-------", instance.getInstanceId());
            }
        } catch (SchedulerException e) {
            throw RespondedException.argumentInvalid(e.getMessage());
        } catch (ClassNotFoundException e) {
            throw RespondedException.argumentInvalid("{mgt.system.job.instance.save}", instance.getClazzPath());
        }
    }

    private Trigger toTrigger(OtSysJobInstance instance, OtSysJobTrigger jobTrigger) {
        TriggerKey triggerKey = TriggerKey.triggerKey(instance.getInstanceId(), instance.getGroupName());
        Trigger trigger;
        Date startTime = null == instance.getStartTime() ? new Date() : instance.getStartTime();
        if (DicConstant.VAL_1002_00.equals(jobTrigger.getTriggerType())) {
            DateBuilder.IntervalUnit intervalUnit = DateBuilder.IntervalUnit.valueOf(jobTrigger.getIntervalUnit());
            int interval = jobTrigger.getInterval();
            int repeatCount = null == jobTrigger.getRepeatCount() ? SimpleTrigger.REPEAT_INDEFINITELY : jobTrigger.getRepeatCount();
            SimpleScheduleBuilder scheduleBuilder = null;
            CalendarIntervalScheduleBuilder calendarIntervalScheduleBuilder = null;

            switch (intervalUnit) {
                case MILLISECOND:
                    scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                      .withRepeatCount(repeatCount)
                      .withIntervalInMilliseconds(interval);
                    break;
                case SECOND:
                    scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                      .withRepeatCount(repeatCount)
                      .withIntervalInSeconds(interval);
                    break;
                case MINUTE:
                    scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                      .withRepeatCount(repeatCount)
                      .withIntervalInMinutes(interval);
                    break;
                case HOUR:
                    scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                      .withRepeatCount(repeatCount)
                      .withIntervalInHours(interval);
                    break;
                case DAY:
                    calendarIntervalScheduleBuilder = CalendarIntervalScheduleBuilder.calendarIntervalSchedule()
                      .withIntervalInDays(interval);
                    break;
                case MONTH:
                    calendarIntervalScheduleBuilder = CalendarIntervalScheduleBuilder.calendarIntervalSchedule()
                      .withIntervalInMonths(interval);
                    break;
                case WEEK:
                    calendarIntervalScheduleBuilder = CalendarIntervalScheduleBuilder.calendarIntervalSchedule()
                      .withIntervalInWeeks(interval);
                    break;
                case YEAR:
                    calendarIntervalScheduleBuilder = CalendarIntervalScheduleBuilder.calendarIntervalSchedule()
                      .withIntervalInYears(interval);
                    break;
                default:
                    throw RespondedException.argumentInvalid("{mgt.system.job.trigger.intervalUnit}");
            }
            if (DicConstant.CALENDAR_INTERVAL.contains(jobTrigger.getTriggerType())) {
                trigger = TriggerBuilder.newTrigger()
                  .withIdentity(triggerKey)
                  .startAt(startTime)
                  .endAt(instance.getEndTime())
                  .withSchedule(calendarIntervalScheduleBuilder)
                  .build();
            } else {
                trigger = TriggerBuilder.newTrigger()
                  .withIdentity(triggerKey)
                  .startAt(startTime)
                  .endAt(instance.getEndTime())
                  .withSchedule(scheduleBuilder)
                  .build();
            }
        } else if (DicConstant.VAL_1002_01.equals(jobTrigger.getTriggerType())) {

            DailyTimeIntervalScheduleBuilder scheduleBuilder = null;
            DateBuilder.IntervalUnit intervalUnit = DateBuilder.IntervalUnit.valueOf(jobTrigger.getIntervalUnit());
            int interval = jobTrigger.getInterval();

            if (StringUtils.isNotBlank(jobTrigger.getStartTimeOfDay()) && StringUtils.isNotBlank(jobTrigger.getEndTimeOfDay())) {
                String[] startTimes = StringUtils.split(jobTrigger.getStartTimeOfDay(), AppSystem.SEPARATOR_TIME);
                String[] endTimes = StringUtils.split(jobTrigger.getEndTimeOfDay(), AppSystem.SEPARATOR_TIME);
                if (StringUtils.isNotBlank(jobTrigger.getDaysOfWeek())) {
                    String[] weeks = StringUtils.split(jobTrigger.getDaysOfWeek(), AppSystem.SEPARATOR_COMMA);
                    scheduleBuilder = DailyTimeIntervalScheduleBuilder.dailyTimeIntervalSchedule()
                      .startingDailyAt(TimeOfDay.hourMinuteAndSecondOfDay(Integer.parseInt(startTimes[0]), Integer.parseInt(startTimes[1]), Integer.parseInt(startTimes[2])))
                      .endingDailyAt(TimeOfDay.hourMinuteAndSecondOfDay(Integer.parseInt(endTimes[0]), Integer.parseInt(endTimes[1]), Integer.parseInt(endTimes[2])))
                      .onDaysOfTheWeek(Arrays.stream(weeks).map(Integer::parseInt).collect(Collectors.toSet()))
                      .withInterval(interval, intervalUnit);
                } else {
                    scheduleBuilder = DailyTimeIntervalScheduleBuilder.dailyTimeIntervalSchedule()
                      .startingDailyAt(TimeOfDay.hourMinuteAndSecondOfDay(Integer.parseInt(startTimes[0]), Integer.parseInt(startTimes[1]), Integer.parseInt(startTimes[2])))
                      .endingDailyAt(TimeOfDay.hourMinuteAndSecondOfDay(Integer.parseInt(endTimes[0]), Integer.parseInt(endTimes[1]), Integer.parseInt(endTimes[2])))
                      .withInterval(interval, intervalUnit);
                }
            }

            trigger = TriggerBuilder.newTrigger()
              .withIdentity(triggerKey)
              .startAt(startTime)
              .endAt(instance.getEndTime())
              .withSchedule(scheduleBuilder)
              .build();
        } else if (DicConstant.VAL_1002_02.equals(jobTrigger.getTriggerType())) {
            trigger = TriggerBuilder.newTrigger()
              .withIdentity(triggerKey)
              .startAt(startTime)
              .endAt(instance.getEndTime())
              .withSchedule(CronScheduleBuilder.cronSchedule(jobTrigger.getCron()))
              .build();
        } else {
            throw RespondedException.argumentInvalid("{mgt.system.job.trigger.triggerType}");
        }
        return trigger;
    }

    @Override
    public boolean checkJobTrigger(OtSysJobTrigger trigger, boolean errorIfException) {
        if (StringUtils.isBlank(trigger.getTriggerType())) {
            return Validations.validateErrorIfException("{mgt.system.job.trigger.triggerType_null}", errorIfException);
        }

        if (DicConstant.VAL_1002_00.equals(trigger.getTriggerType())) {
            if (StringUtils.isBlank(trigger.getIntervalUnit()) || !DicConstant.ALL_INTERVAL.contains(trigger.getIntervalUnit())) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.intervalUnit}", errorIfException);
            }
        } else if (DicConstant.VAL_1002_01.equals(trigger.getTriggerType())) {
            if (StringUtils.isBlank(trigger.getIntervalUnit()) || !DicConstant.ALL_INTERVAL.contains(trigger.getIntervalUnit())) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.intervalUnit}", errorIfException);
            }
            if (StringUtils.isBlank(trigger.getStartTimeOfDay()) || StringUtils.isBlank(trigger.getEndTimeOfDay())) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.timeRange}", errorIfException);
            }

            int[] startTimes = toTimeOfDay(StringUtils.split(trigger.getStartTimeOfDay(), AppSystem.SEPARATOR_TIME));
            int[] endTimes = toTimeOfDay(StringUtils.split(trigger.getEndTimeOfDay(), AppSystem.SEPARATOR_TIME));

            if (null == startTimes || !validate(startTimes)) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.startTime}", errorIfException);
            }

            if (null == endTimes || !validate(endTimes)) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.endTime}", errorIfException);
            }

            if (StringUtils.isNotBlank(trigger.getDaysOfWeek())) {
                Set<Integer> onDaysOfWeek = Arrays.stream(StringUtils.split(trigger.getDaysOfWeek(), AppSystem.SEPARATOR_COMMA)).map(Integer::parseInt).collect(Collectors.toSet());
                for (Integer day : onDaysOfWeek)
                    if (!DailyTimeIntervalScheduleBuilder.ALL_DAYS_OF_THE_WEEK.contains(day)) {
                        return Validations.validateErrorIfException("{mgt.system.job.trigger.weeks}", errorIfException);
                    }
            }
        } else if (DicConstant.VAL_1002_02.equals(trigger.getTriggerType())) {
            if (StringUtils.isBlank(trigger.getCron())) {
                return Validations.validateErrorIfException("{mgt.system.job.trigger.cron}", errorIfException);
            }
        } else {
            return Validations.validateErrorIfException("{mgt.system.job.trigger.triggerType}", errorIfException);
        }

        return true;
    }

    @Override
    public void startJobInstance(String instanceId) {
        OtSysJobInstance jobInstance = getJobInstance(instanceId);
        if (DicConstant.VAL_1003_00.equals(jobInstance.getStatus())) {
            throw RespondedException.argumentInvalid("{mgt.system.job.instance.start}");
        }
        TriggerKey triggerKey = TriggerKey.triggerKey(jobInstance.getInstanceId(), jobInstance.getGroupName());
        try {
            this.scheduler.resumeTrigger(triggerKey);
            jobInstance.setStatus(DicConstant.VAL_1003_00);
            jobInstanceMapper.updateByPK(jobInstance);
        } catch (SchedulerException e) {
            throw RespondedException.argumentInvalid(e.getMessage());
        }
    }

    @Override
    @Transactional
    public void pauseJobInstance(String instanceId) {
        OtSysJobInstance jobInstance = getJobInstance(instanceId);
        TriggerKey triggerKey = TriggerKey.triggerKey(jobInstance.getInstanceId(), jobInstance.getGroupName());
        try {
            scheduler.pauseTrigger(triggerKey);
            jobInstance.setStatus(DicConstant.VAL_1003_01);
            jobInstanceMapper.updateByPK(jobInstance);
            log.info("---Job instance [{}] pause successful -------", jobInstance.getInstanceId());
        } catch (SchedulerException e) {
            throw RespondedException.argumentInvalid(e.getMessage());
        }
    }

    @Override
    @Transactional
    public void removeJobInstance(String instanceId) {
        OtSysJobInstance jobInstance = getJobInstance(instanceId);
        JobKey jobKey = JobKey.jobKey(jobInstance.getInstanceId(), jobInstance.getGroupName());
        try {
            scheduler.deleteJob(jobKey);
            jobInstanceMapper.deleteByPK(jobInstance.getId());
            log.info("---Job instance [{}] remove successful -------", jobInstance.getInstanceId());
        } catch (SchedulerException e) {
            throw RespondedException.argumentInvalid(e.getMessage());
        }
    }

    @Override
    public List<OtSysJobRunLog> getSysJobRunLogList(Map<String, Object> params) {
        return jobRunLogMapper.getList(params);
    }

    @Override
    public Map<String, Object> jobRunLogStatistics(Map<String, Object> params) {
        Map<String, Object> result = Maps.newHashMap();
        params.put("status", DicConstant.VAL_1004_00);
        result.put("success_count", jobRunLogMapper.count(params));
        params.put("status", DicConstant.VAL_1004_01);
        result.put("fail_count", jobRunLogMapper.count(params));
        return result;
    }

    private int[] toTimeOfDay(String[] times) {
        if (times.length < 3) {
            return null;
        }
        int[] result = new int[3];
        try {
            result[0] = Integer.parseInt(times[0]);
            result[1] = Integer.parseInt(times[1]);
            result[2] = Integer.parseInt(times[2]);
        } catch (Exception e) {
            log.error("时间解析格式错误", e);
            return null;
        }
        return result;
    }

    private boolean validate(int[] times) {
        if (times[0] < 0 || times[0] > 23) {
            return false;
        }
        if (times[1] < 0 || times[1] > 59) {
            return false;
        }
        return times[2] >= 0 && times[2] <= 59;
    }

}
