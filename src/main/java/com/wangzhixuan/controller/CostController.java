package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.CostMapper;
import com.wangzhixuan.model.Cost;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.Tenant;
import com.wangzhixuan.service.ICostService;

/**
 * <p>
 * cost  前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/cost")
public class CostController {
	
	@Autowired
	private CostMapper costMapper;
	
	@Autowired
	private ICostService iCostService;
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(Room room, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<String, Object>();

		if (room.getId() != null) {
			condition.put("roomId", room.getId());
			
		     
		}

		pageInfo.setCondition(condition);
		iCostService.selectDataGrid(pageInfo);
		
		
		
		return pageInfo;
	}
	
}
