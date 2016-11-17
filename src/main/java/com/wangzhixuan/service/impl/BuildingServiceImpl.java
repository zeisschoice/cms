package com.wangzhixuan.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.BuildingMapper;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Role;
import com.wangzhixuan.service.IBuildingService;


/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class BuildingServiceImpl extends SuperServiceImpl<BuildingMapper, Building> implements IBuildingService {

	private BuildingMapper buildingMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		    Page<Building> page = new Page<Building>(pageInfo.getNowpage(), pageInfo.getSize());
	        List<Building> list = buildingMapper.selectBuildingList(page, pageInfo.getSort(), pageInfo.getOrder());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
		
	}

	
	
	
}
