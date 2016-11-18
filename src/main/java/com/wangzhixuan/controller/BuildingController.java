package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.result.Result;
import com.wangzhixuan.commons.utils.PageInfo;
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
	public String building() {	
		return "tenement/building";
	}
	
	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public String buildingEdit(Model model,Long id) {	
		
		 Building building = buildingService.selectById(id);
	     model.addAttribute("building", building);
	      
		
		return "tenement/editBuiding";
	}
	
	 @RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	 @ResponseBody
	 public Object dataGrid(Integer page, Integer rows, String sort, String order) {
	        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
	        Map<String, Object> condition = new HashMap<String, Object>();
	        pageInfo.setCondition(condition);

	        buildingService.selectDataGrid(pageInfo);
	        return pageInfo;
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
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Long id) {
	   buildingService.deleteById(id);
	   return renderSuccess("删除成功！");
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
