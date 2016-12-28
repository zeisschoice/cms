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
import com.wangzhixuan.commons.base.BaseController;
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
public class CostController extends BaseController{
		
	@Autowired
	private ICostService iCostService;
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(String roomId,String tenantId, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<String, Object>();

		if (roomId != null && tenantId !=null) {
			condition.put("roomId", roomId);
			condition.put("tenantId", tenantId);
			
		}

		pageInfo.setCondition(condition);
		iCostService.selectDataGrid(pageInfo);
		
		
		
		return pageInfo;
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public String addRoomPage(Model model,Long id) {
		
		 model.addAttribute("roomId", id);
		
		return "tenement/addCost";
	}
	
	 @RequestMapping(value = "/editPage", method = RequestMethod.GET)
		public String roomEdit(Model model,Long id) {	
			
			 Cost cost = iCostService.selectById(id);
		     model.addAttribute("cost", cost);
		  
			return "tenement/editCost";
		}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(Cost cost) {
		// User u = userService.selectByLoginName(userVo.getLoginName());
		// if (u != null) {
		// return renderError("用户名已存在!");
		// }
		// userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
	//	Room room = new Room();
	//	room.setRoomName("测试用的");
	
	   HashMap<String,Object> columnMap = new HashMap<String,Object>();
		
	   columnMap.put("year", cost.getYear());
	   columnMap.put("month", cost.getMonth());
	   columnMap.put("room_id", cost.getRoomId());
	 //  columnMap.put("tenant_id", cost.getTenantId);
	   
		List<Cost> list = iCostService.selectByMap(columnMap);
		
		if(list!=null && list.size()>0){
			return renderError("此房间已存在当前年月的记录,请勿重复添加！");
		}
		
		iCostService.insert(cost);
		return renderSuccess("添加成功");
	}

	 @RequestMapping("/edit")
	 @ResponseBody
	 public Object edit(Cost cost) {
		 iCostService.updateSelectiveById(cost);
	    return renderSuccess("编辑成功！");
	 }
	
	 @RequestMapping("/delete")
	 @ResponseBody
	 public Object delete(Long id) {
		 iCostService.deleteById(id);
		 return renderSuccess("删除成功！");
	 } 
	
	 @RequestMapping(value = "/getLastMon",method = RequestMethod.POST)
	 @ResponseBody
	 public Object selectLastMon(Cost cost) {
		 Cost rs = iCostService.selectOne(cost);
		 
		 return rs;
	 } 
}
