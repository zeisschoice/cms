package com.zeiss.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
/**
 * <p>
 * 财物项目
 * </p>
 *
 * @author zeiss
 * @since 2017-03-08
 */
@TableName("project_finance_item")
public class ProjectFinanceItem extends Model<ProjectFinanceItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableField(value="finance_item_id")
    private Long financeItemId;
    /**
     * 
     */
    @TableField(value="project_id")
    private Long projectId;
    /**
     * 
     */
    @TableField(value="contract_plan")
    private String contractPlan;
    /**
     * 
     */
    @TableField(value="use_or_predict")
    private String useOrPredict;
    /**
     * 
     */
    @TableField(value="incoming_outgoings1")
    private java.math.BigDecimal incomingOutgoings1;
    /**
     * 
     */
    private java.util.Date date1;
    /**
     * 
     */
    @TableField(value="incoming_outgoings2")
    private java.math.BigDecimal incomingOutgoings2;
    /**
     * 
     */
    private java.util.Date date2;
    /**
     * 
     */
    @TableField(value="incoming_outgoings3")
    private java.math.BigDecimal incomingOutgoings3;
    /**
     * 
     */
    private java.util.Date date3;
    /**
     * 
     */
    @TableField(value="incoming_outgoings4")
    private java.math.BigDecimal incomingOutgoings4;
    /**
     * 
     */
    private java.util.Date date4;


    public Long getFinanceItemId() {
        return financeItemId;
    }

    public void setFinanceItemId(Long financeItemId) {
        this.financeItemId = financeItemId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getContractPlan() {
        return contractPlan;
    }

    public void setContractPlan(String contractPlan) {
        this.contractPlan = contractPlan;
    }

    public String getUseOrPredict() {
        return useOrPredict;
    }

    public void setUseOrPredict(String useOrPredict) {
        this.useOrPredict = useOrPredict;
    }

    public java.math.BigDecimal getIncomingOutgoings1() {
        return incomingOutgoings1;
    }

    public void setIncomingOutgoings1(java.math.BigDecimal incomingOutgoings1) {
        this.incomingOutgoings1 = incomingOutgoings1;
    }

    public java.util.Date getDate1() {
        return date1;
    }

    public void setDate1(java.util.Date date1) {
        this.date1 = date1;
    }

    public java.math.BigDecimal getIncomingOutgoings2() {
        return incomingOutgoings2;
    }

    public void setIncomingOutgoings2(java.math.BigDecimal incomingOutgoings2) {
        this.incomingOutgoings2 = incomingOutgoings2;
    }

    public java.util.Date getDate2() {
        return date2;
    }

    public void setDate2(java.util.Date date2) {
        this.date2 = date2;
    }

    public java.math.BigDecimal getIncomingOutgoings3() {
        return incomingOutgoings3;
    }

    public void setIncomingOutgoings3(java.math.BigDecimal incomingOutgoings3) {
        this.incomingOutgoings3 = incomingOutgoings3;
    }

    public java.util.Date getDate3() {
        return date3;
    }

    public void setDate3(java.util.Date date3) {
        this.date3 = date3;
    }

    public java.math.BigDecimal getIncomingOutgoings4() {
        return incomingOutgoings4;
    }

    public void setIncomingOutgoings4(java.math.BigDecimal incomingOutgoings4) {
        this.incomingOutgoings4 = incomingOutgoings4;
    }

    public java.util.Date getDate4() {
        return date4;
    }

    public void setDate4(java.util.Date date4) {
        this.date4 = date4;
    }

    @Override
    protected Serializable pkVal() {
    	return null;
    }

}
