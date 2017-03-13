package com.zeiss.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
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
    @TableField(value="project_reg_id")
    private Long projectRegId;
    /**
     * 
     */
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
    private java.util.Date deductDate;
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
    private java.util.Date costDate;
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
    private java.util.Date rewardsDate;
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

    public java.util.Date getDeductDate() {
        return deductDate;
    }

    public void setDeductDate(java.util.Date deductDate) {
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

    public java.util.Date getCostDate() {
        return costDate;
    }

    public void setCostDate(java.util.Date costDate) {
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

    public java.util.Date getRewardsDate() {
        return rewardsDate;
    }

    public void setRewardsDate(java.util.Date rewardsDate) {
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
