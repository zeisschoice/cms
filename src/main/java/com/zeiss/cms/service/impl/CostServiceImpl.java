package com.zeiss.cms.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.mapper.CostMapper;
import com.zeiss.cms.model.Cost;
import com.zeiss.cms.model.MonCost;
import com.zeiss.cms.model.Tenant;
import com.zeiss.cms.service.ICostService;


/**
 * <p>
 * cost  服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class CostServiceImpl extends ServiceImpl<CostMapper, Cost> implements ICostService {
	
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
