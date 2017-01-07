package com.wangzhixuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.CostMapper;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.MonCost;
import com.wangzhixuan.model.Tenant;
import com.wangzhixuan.service.ICostService;


/**
 * <p>
 * cost  服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class CostServiceImpl extends SuperServiceImpl<CostMapper, Cost> implements ICostService {
	
	@Autowired
	private CostMapper costMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		Page<Cost> page = new Page<Cost>(pageInfo.getNowpage(), pageInfo.getSize());
		   
	    List<Cost> list = costMapper.selectCostPage(page, pageInfo.getCondition());
	   
	    pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<MonCost> selectMonCost() {
		
		List<MonCost> rs = costMapper.countMonCost();
		
		
		return rs;
	}
}
