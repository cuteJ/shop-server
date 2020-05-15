package com.onlythinking.shop.mgt.system.dto;

import com.onlythinking.shop.core.constant.DicConstant;
import com.onlythinking.shop.model.OtSysJobTrigger;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;
import java.util.Map;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Data
@ApiModel("创建任务实例")
public class JobInstanceDto {

    /**
     * 任务ID
     */
    @NotBlank
    @ApiModelProperty(value = "任务ID", required = true)
    private String jobId;

    /**
     * 触发器ID
     */
    @NotBlank
    @ApiModelProperty(value = "触发器ID", required = true)
    private String triggerId;

    /**
     * 组名称
     */
    @ApiModelProperty(value = "组名称")
    private String groupName;

    /**
     * 任务实例参数
     */
    @ApiModelProperty(value = "任务实例参数")
    private Map<String, String> instanceParams;

    /**
     * 结束时间
     */
    @ApiModelProperty(value = "结束时间")
    private Date endTime;

    /**
     * 开始时间
     */
    @ApiModelProperty(value = "开始时间")
    private Date startTime;

    // 只记录错误日志
    private boolean onlyError;

    public String toTriggerRule(OtSysJobTrigger trigger) {
        if (DicConstant.VAL_1002_00.equals(trigger.getTriggerType())) {
            IntervalUnit unit = IntervalUnit.valueOf(trigger.getIntervalUnit());
            return String.format("固定周期：%s/%s", trigger.getInterval(), unit.getText());
        } else if (DicConstant.VAL_1002_01.equals(trigger.getTriggerType())) {
            IntervalUnit unit = IntervalUnit.valueOf(trigger.getIntervalUnit());
            return String.format("每日范围：%s - %s %s/%s", trigger.getStartTimeOfDay(), trigger.getEndTimeOfDay(), trigger.getInterval(), unit.getText());
        } else if (DicConstant.VAL_1002_02.equals(trigger.getTriggerType())) {
            return String.format("Cron：%s", trigger.getCron());
        }
        return null;
    }
}
