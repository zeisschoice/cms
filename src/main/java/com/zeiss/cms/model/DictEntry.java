package com.zeiss.cms.model;


import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableField;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zeiss
 * @since 2016-12-14
 */
@TableName("dict_entry")
public class DictEntry implements Serializable {

	@TableField(exist = false)
    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String dicttypeid;
	/**
	 * 
	 */
	@TableId(type = IdType.INPUT)
	private String dictid;
	/**
	 * 
	 */
	private String dictname;
	/**
	 * 
	 */
	private Integer status;
	/**
	 * 
	 */
	private Integer sortno;
	/**
	 * 
	 */
	private Integer rank;
	/**
	 * 
	 */
	private Double value;
	/**
	 * 
	 */
	private String dictlevel;
	/**
	 * 
	 */
	private String dictcode;


	public String getDicttypeid() {
		return dicttypeid;
	}

	public void setDicttypeid(String dicttypeid) {
		this.dicttypeid = dicttypeid;
	}

	public String getDictid() {
		return dictid;
	}

	public void setDictid(String dictid) {
		this.dictid = dictid;
	}

	public String getDictname() {
		return dictname;
	}

	public void setDictname(String dictname) {
		this.dictname = dictname;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSortno() {
		return sortno;
	}

	public void setSortno(Integer sortno) {
		this.sortno = sortno;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getDictlevel() {
		return dictlevel;
	}

	public void setDictlevel(String dictlevel) {
		this.dictlevel = dictlevel;
	}

	public String getDictcode() {
		return dictcode;
	}

	public void setDictcode(String dictcode) {
		this.dictcode = dictcode;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	

}
