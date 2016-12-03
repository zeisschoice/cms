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
import com.wangzhixuan.mapper.RoomMapper;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Role;
import com.wangzhixuan.model.Room;
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
	
	@Autowired
	private RoomMapper roomMapper;
	
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

	//查询楼房房间树
	@Override
	public List<Tree> selectBuildRoomTree() {
		// TODO Auto-generated method stub
		List<Tree> trees = new ArrayList<Tree>();
		
		List<Building> list = buildingMapper.selectAll();
		
		if(list !=null && list.size()>0){
			
			for(int i = 0;i<list.size();i++){
				
				 Tree treeOne = new Tree();

	             treeOne.setId(list.get(i).getId().longValue());
	             treeOne.setText(list.get(i).getBuildingName());
	             treeOne.setIconCls("icon-company");
	             
	             List<Room> rooms = roomMapper.selectRoombyBuildId(list.get(i).getId().longValue());
	             
	             System.out.println("房间数："+rooms.size());
	             
	             if(rooms!=null && rooms.size()>0){
	            	 List<Tree> tree = new ArrayList<Tree>();
	            	 for(int j=0;j<rooms.size();j++){
	            		 
	            		 Tree treeTwo = new Tree(); 
	            		 treeTwo.setId(rooms.get(j).getId().longValue());
	            		
	            		 if(rooms.get(j).getStatus()==0){
	            			 treeTwo.setText(rooms.get(j).getRoomName()+"(空闲)");
	            			 treeTwo.setIconCls("icon-home");
	            		 }else{
	            			 
	            			 treeTwo.setText(rooms.get(j).getRoomName()+"(已租)");
	            			 treeTwo.setIconCls("icon-man");
	            		 }
	            		
	            		 tree.add(treeTwo);
	            	
	            	 }
	            	 
	            	 treeOne.setChildren(tree);
	            	 treeOne.setState("closed");
	            	 
	             }else{
	                 treeOne.setState("closed");
	             } 
	             
	             trees.add(treeOne) ;
			}
			
			
		}
		
		
		return trees;
	}

	
	
	
}
