package com.wangzhixuan.model.vo;

import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.annotations.TableField;
import com.wangzhixuan.model.DictEntry;


public class DictTypeVo implements Serializable{

	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String dicttypeid;
	/**
	 * 
	 */
	private String dicttypename;
	/**
	 * 
	 */
	private String rank;
	/**
	 * 
	 */
	
	/**
	 * 
	 */
	private Integer seqno;
	/**
	 * 
	 */
	@TableField(value = "business_id")
	private Integer businessId;
	/**
	 * 
	 */
	@TableField(value = "catalog_id")
	private Integer catalogId;
	/**
	 * 
	 */
	private String dicttypecode;
	/**
	 * 
	 */
	private Integer dictlevel;
	/**
	 * 
	 */
	private String dictcat;

	
	private List<DictEntry> dictEntry;
	
	
	public List<DictEntry> getDictEntry() {
		return dictEntry;
	}

	public void setDictEntry(List<DictEntry> dictEntry) {
		this.dictEntry = dictEntry;
	}

	public String getDicttypeid() {
		return dicttypeid;
	}

	public void setDicttypeid(String dicttypeid) {
		this.dicttypeid = dicttypeid;
	}

	public String getDicttypename() {
		return dicttypename;
	}

	public void setDicttypename(String dicttypename) {
		this.dicttypename = dicttypename;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	

	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public Integer getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Integer catalogId) {
		this.catalogId = catalogId;
	}

	public String getDicttypecode() {
		return dicttypecode;
	}

	public void setDicttypecode(String dicttypecode) {
		this.dicttypecode = dicttypecode;
	}

	public Integer getDictlevel() {
		return dictlevel;
	}

	public void setDictlevel(Integer dictlevel) {
		this.dictlevel = dictlevel;
	}

	public String getDictcat() {
		return dictcat;
	}

	public void setDictcat(String dictcat) {
		this.dictcat = dictcat;
	}

}
