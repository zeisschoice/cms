package com.zeiss.service;

import com.baomidou.framework.service.ISuperService;
import com.zeiss.entity.Building;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface IBuildingService extends ISuperService<Building> {
	
	public void insertBuilding(Building building);
	
	public Building selectById(Long id);
	
	public void deleteBuildingById(Long id);
	
	
	
}
