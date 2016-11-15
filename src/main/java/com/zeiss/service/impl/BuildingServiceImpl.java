package com.zeiss.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.zeiss.entity.Building;
import com.zeiss.mapper.BuildingMapper;
import com.zeiss.service.IBuildingService;

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

	@Override
	public void insertBuilding(Building building) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBuildingById(Long id) {
		// TODO Auto-generated method stub
		
	}
	
}
