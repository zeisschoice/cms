package com.wangzhixuan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.commons.result.Tree;
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

	@Autowired
	private BuildingMapper buildingMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		    Page<Building> page = new Page<Building>(pageInfo.getNowpage(), pageInfo.getSize());
	   
		    List<Building> list = buildingMapper.selectBuildingList(page, pageInfo.getSort(), pageInfo.getOrder());
		   
		    pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
	        
		
	}

	@Override
	public List<Tree> selectTree() {

		List<Tree> trees = new ArrayList<Tree>();
		
		List<Building> list = buildingMapper.selectAll();
		
		if(list !=null && list.size()>0){
			
			for(int i=0;i<list.size();i++){
				
				Tree tree  = new Tree();
				
				tree.setText(list.get(i).getBuildingName());
				tree.setIconCls("icon-company");
				tree.setId(list.get(i).getId().longValue());
				
				trees.add(tree);
				
			}
			
		}
		
		return trees;
	}

	
	
	
}
