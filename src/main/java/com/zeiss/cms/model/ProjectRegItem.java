package com.zeiss.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2017-03-08
 */
@TableName("project_reg_item")
public class ProjectRegItem extends Model<ProjectRegItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value="project_reg_id",type = IdType.AUTO)
    @TableField(value="project_reg_id")
    private Long projectRegId;
    /**
     * 
     */
    
    @TableField(value="project_id")
    private Long projectId;
    
    @TableField(value="project_no")
    private String projectNo;
    /**
     * 
     */
    @TableField(value="project_name")
    private String projectName;
    /**
     * 
     */
    @TableField(value="deduct_date")
    private String deductDate;
    /**
     * 
     */
    @TableField(value="deduct_person")
    private String deductPerson;
    /**
     * 
     */
    private Double deduct;
    /**
     * 
     */
    @TableField(value="cost_date")
    private String costDate;
    /**
     * 
     */
    @TableField(value="cost_person")
    private String costPerson;
    /**
     * 
     */
    private Double cost;
    /**
     * 
     */
    @TableField(value="rewards_date")
    private String rewardsDate;
    /**
     * 
     */
    private Double rewards;
    /**
     * 
     */
    @TableField(value="rewards_person")
    private String rewardsPerson;


    public Long getProjectRegId() {
        return projectRegId;
    }

    public void setProjectRegId(Long projectRegId) {
        this.projectRegId = projectRegId;
    }

    public String getProjectNo() {
        return projectNo;
    }

    public void setProjectNo(String projectNo) {
        this.projectNo = projectNo;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDeductDate() {
        return deductDate;
    }

    public void setDeductDate(String deductDate) {
        this.deductDate = deductDate;
    }

    public String getDeductPerson() {
        return deductPerson;
    }

    public void setDeductPerson(String deductPerson) {
        this.deductPerson = deductPerson;
    }

    public Double getDeduct() {
        return deduct;
    }

    public void setDeduct(Double deduct) {
        this.deduct = deduct;
    }

    public String getCostDate() {
        return costDate;
    }

    public void setCostDate(String costDate) {
        this.costDate = costDate;
    }

    public String getCostPerson() {
        return costPerson;
    }

    public void setCostPerson(String costPerson) {
        this.costPerson = costPerson;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getRewardsDate() {
        return rewardsDate;
    }

    public void setRewardsDate(String rewardsDate) {
        this.rewardsDate = rewardsDate;
    }

    public Double getRewards() {
        return rewards;
    }

    public void setRewards(Double rewards) {
        this.rewards = rewards;
    }

    public String getRewardsPerson() {
        return rewardsPerson;
    }

    public void setRewardsPerson(String rewardsPerson) {
        this.rewardsPerson = rewardsPerson;
    }

    @Override
    protected Serializable pkVal() {
    	return null;
    }

}
