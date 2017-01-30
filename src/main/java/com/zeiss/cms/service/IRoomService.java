package com.zeiss.cms.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.zeiss.cms.commons.result.Tree;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.Room;


/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
public interface IRoomService extends IService<Room> {
	
	void selectDataGrid(PageInfo pageInfo);
	
}
