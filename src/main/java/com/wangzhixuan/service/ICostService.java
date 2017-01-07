package com.wangzhixuan.service;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.MonCost;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface ICostService extends ISuperService<Cost> {
	
	void selectDataGrid(PageInfo pageInfo);
	
	List<MonCost> selectMonCost();
}
