package com.onlythinking.shop.mgt.system.web;

import com.onlythinking.commons.config.annotation.ApiRest;
import com.onlythinking.commons.exception.RespondedBody;
import com.onlythinking.shop.core.constant.AppSystem;
import com.onlythinking.shop.core.page.PageEntity;
import com.onlythinking.shop.mgt.system.dto.JobInstanceDto;
import com.onlythinking.shop.mgt.system.service.SysJobService;
import com.onlythinking.shop.model.OtSysJobDetails;
import com.onlythinking.shop.model.OtSysJobInstance;
import com.onlythinking.shop.model.OtSysJobTrigger;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

import static com.onlythinking.shop.mgt.core.constant.PermissionsConstant.*;

/**
 * <p> 附件API </p>
 *
 * @author Li Xingping
 */
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "系统任务")
@ApiRest(serviceId = AppSystem.SERVER_SYS, value = "/jobs")
public class SysJobController {
    private final SysJobService sysJobService;

    @ApiOperation("任务列表")
    @RequiresPermissions(value = SYS_QUARTZJOB_LIST)
    @PostMapping(value = "/details/list")
    public PageEntity<?> jobDetailsList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysJobService.getSysJobDetailsList(page.getParams()));
        return page;
    }

    @ApiOperation(value = "任务创建更新")
    @RequiresPermissions(value = SYS_QUARTZJOB_SAVE)
    @PostMapping("/details/save")
    public OtSysJobDetails saveOrUpdateJobDetails(@Valid @RequestBody OtSysJobDetails dto) {
        return sysJobService.saveOrUpdateJobDetails(dto);
    }

    @ApiOperation(value = "删除任务")
    @DeleteMapping(value = {"/details/remove/{id}"})
    @RequiresPermissions(value = SYS_QUARTZJOB_REMOVE)
    public RespondedBody removeJobDetails(@PathVariable("id") String id) {
        sysJobService.removeJobDetails(id);
        return RespondedBody.successful();
    }

    @ApiOperation("任务列表")
    @RequiresPermissions(value = SYS_QUARTZJOB_LIST)
    @PostMapping(value = "/trigger/list")
    public List<OtSysJobTrigger> jobDetailsList(@RequestParam Map<String, Object> params) {
        return sysJobService.getSysJobTriggerList(params);
    }

    @ApiOperation(value = "任务创建更新")
    @RequiresPermissions(value = SYS_QUARTZJOB_SAVE)
    @PostMapping("/trigger/save")
    public OtSysJobTrigger saveOrUpdateJobTrigger(@Valid @RequestBody OtSysJobTrigger dto) {
        return sysJobService.saveOrUpdateJobTrigger(dto);
    }

    @ApiOperation(value = "删除任务")
    @DeleteMapping(value = {"/trigger/remove/{id}"})
    @RequiresPermissions(value = SYS_QUARTZJOB_REMOVE)
    public RespondedBody removeJobTrigger(@PathVariable("id") String id) {
        sysJobService.removeJobTrigger(id);
        return RespondedBody.successful();
    }

    @ApiOperation("任务实例列表")
    @RequiresPermissions(value = SYS_QUARTZJOB_LIST)
    @PostMapping(value = "/instance/list")
    public List<OtSysJobInstance> jobInstanceList(@RequestParam Map<String, Object> params) {
        return sysJobService.getSysJobInstanceList(params);
    }

    @ApiOperation(value = "任务实例创建")
    @RequiresPermissions(value = SYS_QUARTZJOB_SAVE)
    @PostMapping("/instance/save")
    public RespondedBody saveOrUpdateJobInstance(@Valid @RequestBody JobInstanceDto dto) {
        sysJobService.saveJobInstance(dto);
        return RespondedBody.successful();
    }

    @ApiOperation(value = "启动任务")
    @RequiresPermissions(value = SYS_QUARTZJOB_OPT)
    @PostMapping("/instance/start/{instanceId}")
    public RespondedBody startJobInstance(@PathVariable("instanceId") String instanceId) {
        sysJobService.startJobInstance(instanceId);
        return RespondedBody.successful();
    }

    @ApiOperation(value = "暂停任务")
    @RequiresPermissions(value = SYS_QUARTZJOB_OPT)
    @PostMapping("/instance/pause/{instanceId}")
    public RespondedBody pauseJobInstance(@PathVariable("instanceId") String instanceId) {
        sysJobService.pauseJobInstance(instanceId);
        return RespondedBody.successful();
    }

    @ApiOperation(value = "删除任务")
    @RequiresPermissions(value = SYS_QUARTZJOB_REMOVE)
    @PostMapping("/instance/remove/{instanceId}")
    public RespondedBody removeJobInstance(@PathVariable("instanceId") String instanceId) {
        sysJobService.removeJobInstance(instanceId);
        return RespondedBody.successful();
    }

    @ApiOperation("实例日志列表")
    @RequiresPermissions(value = SYS_QUARTZJOB_LIST)
    @PostMapping(value = "/instance/logs/list")
    public PageEntity<?> jobRunLogList(PageEntity<?> page) {
        page.startPage();
        page.setList(sysJobService.getSysJobRunLogList(page.getParams()));
        return page;
    }

    @ApiOperation(value = "实例日志统计")
    @RequiresPermissions(value = SYS_QUARTZJOB_LIST)
    @PostMapping("/instance/logs/statistics")
    public Map<String, Object> pauseJobInstance(@RequestParam Map<String, Object> params) {
        return sysJobService.jobRunLogStatistics(params);
    }
}
