package com.wangzhixuan.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.Cost;



/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface CostMapper extends AutoMapper<Cost> {

	 List<Cost> selectCostPage(Pagination page, Map<String, Object> params);
	
}