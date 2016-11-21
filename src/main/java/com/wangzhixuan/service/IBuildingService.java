package com.wangzhixuan.service;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.wangzhixuan.commons.result.Tree;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Building;


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
	 
	 List<Tree> selectTree();
}
