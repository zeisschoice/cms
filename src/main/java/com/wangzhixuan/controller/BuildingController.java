package com.wangzhixuan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.result.Result;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.service.IBuildingService;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/building")
public class BuildingController {

	@Autowired
	private IBuildingService buildingService;

	@RequestMapping(value = "/BuildingPage", method = RequestMethod.GET)
	public String building(Building b) {

//		boolean is = buildingService.insert(b);
//
//		if (is) {
//			return renderSuccess("添加成功");
//		} else {
//
//			return renderError("添加失败");
//		}
		
		return "tenement/addBuilding";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addBuilding", method = RequestMethod.POST)
	public Object addBuilding(Building b) {

		boolean is = buildingService.insert(b);

		if (is) {
			return renderSuccess("添加成功");
		} else {

			return renderError("添加失败");
		}
		
		
	}
	
	public Object renderSuccess(String msg) {
		Result result = new Result();
		result.setSuccess(true);
		result.setMsg(msg);
		return result;
	}

	public Object renderError(String msg) {
		Result result = new Result();
		result.setMsg(msg);
		return result;
	}
}
