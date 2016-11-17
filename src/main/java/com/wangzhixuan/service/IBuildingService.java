package com.wangzhixuan.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.framework.service.ISuperService;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Role;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface IBuildingService extends ISuperService<Building> {
	
	 void selectDataGrid(PageInfo pageInfo);
	 
	
}
