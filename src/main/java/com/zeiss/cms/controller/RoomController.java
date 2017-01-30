package com.zeiss.cms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.zeiss.cms.commons.base.BaseController;
import com.zeiss.cms.commons.utils.DigestUtils;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.commons.utils.StringUtils;
import com.zeiss.cms.model.Building;
import com.zeiss.cms.model.Room;
import com.zeiss.cms.model.User;
import com.zeiss.cms.model.vo.UserVo;
import com.zeiss.cms.service.IBuildingService;
import com.zeiss.cms.service.IRoomService;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zeiss
 * @since 2016-11-15
 */
@Controller
@RequestMapping("/room")
public class RoomController extends BaseController {

	@Autowired
	private IBuildingService iBuildingService;

	@Autowired
	private IRoomService iRoomService;

	@RequestMapping(value = "/roomPage", method = RequestMethod.GET)
	public String building() {
		return "tenement/room";
	}

	@RequestMapping(value = "/addPage", method = RequestMethod.GET)
	public String addRoomPage() {
		return "tenement/addRoom";
	}

	@RequestMapping(value = "/tree", method = RequestMethod.POST)
	@ResponseBody
	public Object tree() {
		return iBuildingService.selectTree();
	}

	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	@ResponseBody
	public Object dataGrid(Room room, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<String, Object>();

		if (room.getBuildingId() != null) {
			condition.put("buildingId", room.getBuildingId());
		}

		pageInfo.setCondition(condition);
		iRoomService.selectDataGrid(pageInfo);
		return pageInfo;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Object add(Room room) {
		// User u = userService.selectByLoginName(userVo.getLoginName());
		// if (u != null) {
		// return renderError("用户名已存在!");
		// }
		// userVo.setPassword(DigestUtils.md5Hex(userVo.getPassword()));
	//	Room room = new Room();
	//	room.setRoomName("测试用的");
		iRoomService.insert(room);
		return renderSuccess("添加成功");
	}

	 @RequestMapping("/edit")
	 @ResponseBody
	 public Object edit(Room room) {
		// iRoomService.updateSelectiveById(room);
		 iRoomService.updateById(room);
	    return renderSuccess("编辑成功！");
	 }
	
	 @RequestMapping("/delete")
	 @ResponseBody
	 public Object delete(Long id) {
		 iRoomService.deleteById(id);
		 return renderSuccess("删除成功！");
	 }
	 
	 @RequestMapping(value = "/editPage", method = RequestMethod.GET)
		public String roomEdit(Model model,Long id) {	
			
			 Room room = iRoomService.selectById(id);
		     model.addAttribute("room", room);
		      
			
			return "tenement/editRoom";
		}
	 
	    @RequestMapping(value = "/getRentingRate", method = RequestMethod.GET)
	    @ResponseBody
		public Object getRentingRate() {	
			
	    	 HashMap<String,Integer> map = new HashMap<String,Integer>();
	    	 
	    	// Room entity = new Room();
	    	
	    	 //entity.setStatus(1);
	    	 
		//	 int renting = iRoomService.selectCount(entity);
	    	 
	    	 EntityWrapper<Room> ew = new EntityWrapper<Room>();
	    	 EntityWrapper<Room> ew1 = new EntityWrapper<Room>();
	    	 
	    	
	    	 ew.eq("status", 1);
	    	 
			 int renting = iRoomService.selectCount(ew);
			 
		//	 entity.setStatus(0);
			 ew1.eq("status", 0);
			 
			 int unused = iRoomService.selectCount(ew1);
		  //   model.addAttribute("room", room);
		     
			 map.put("renting", renting);
			 map.put("unused", unused);
			
			return map;
	 } 
	 
	
}
