package com.zeiss.cms.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.zeiss.cms.commons.result.Tree;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.mapper.RoomMapper;
import com.zeiss.cms.model.Building;
import com.zeiss.cms.model.Room;
import com.zeiss.cms.service.IRoomService;


/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Service
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room> implements IRoomService {

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		
		Page<Room> page = new Page<Room>(pageInfo.getNowpage(), pageInfo.getSize());
		   
	    List<Room> list = roomMapper.selectRoomPage(page, pageInfo.getCondition());
	   
	    pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	

	
	
}
