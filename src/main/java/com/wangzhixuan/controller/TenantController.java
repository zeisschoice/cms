package com.wangzhixuan.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Building;
import com.wangzhixuan.model.Room;
import com.wangzhixuan.model.Tenant;
import com.wangzhixuan.service.IBuildingService;
import com.wangzhixuan.service.IRoomService;
import com.wangzhixuan.service.ITenantService;

/**
 * <p>
 * tenant  前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/tenant")
public class TenantController extends BaseController{
	
	
	@Autowired
	private ITenantService iTenantService;
	
	@Autowired
	private IBuildingService iBuildingService;
	
	
	@RequestMapping(value = "/tenantPage", method = RequestMethod.GET)
	public String building() {
		return "tenement/tenant";
	}
	
	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public String addRoomPage() {
		return "tenement/addRoom";
	}

	@RequestMapping(value = "/tree", method = RequestMethod.POST)
	@ResponseBody
	public Object tree() {
		
		return iBuildingService.selectBuildRoomTree();
		
	}

	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(Room room, Integer page, Integer rows, String sort, String order,Model model) {
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<String, Object>();

		if (room.getId() != null) {
			condition.put("roomId", room.getId());
			
		     
		}

		pageInfo.setCondition(condition);
		iTenantService.selectDataGrid(pageInfo);
		
		if(pageInfo.getRows()!=null && pageInfo.getRows().size()>0){
			
			model.addAttribute("tenant", pageInfo.getRows().get(0));
		}
		
		
		
		
		return pageInfo;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(Tenant tenant) {
		// User u = userService.selectByLoginName(userVo.getLoginName());
		// if (u != null) {
		// return renderError("用户名已存在!");
		// }
		// userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
	//	Room room = new Room();
	//	room.setRoomName("测试用的");
		iTenantService.insert(tenant);
		return renderSuccess("添加成功");
	}

	 @RequestMapping("/edit")
	 @ResponseBody
	 public Object edit(Tenant tenant) {
		 iTenantService.updateSelectiveById(tenant);
	    return renderSuccess("编辑成功！");
	 }
	
	 @RequestMapping("/delete")
	 @ResponseBody
	 public Object delete(Long id) {
		 iTenantService.deleteById(id);
		 return renderSuccess("删除成功！");
	 }
	 
	 @RequestMapping(value = "/editPage", method = RequestMethod.GET)
		public String roomEdit(Model model,Long id) {	
			
		     Tenant tenant = iTenantService.selectById(id);
		     model.addAttribute("tenant", tenant);
		      
			
			return "tenement/editTenant";
	 }
	
}
