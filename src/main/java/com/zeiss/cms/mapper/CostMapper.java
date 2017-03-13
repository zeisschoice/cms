package com.zeiss.cms.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zeiss.cms.model.Cost;
import com.zeiss.cms.model.MonCost;



/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface CostMapper extends BaseMapper<Cost> {

	 List<Cost> selectCostPage(Pagination page, Map<String, Object> params);
	 
	 List<MonCost> countMonCost();
}