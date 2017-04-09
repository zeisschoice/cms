package com.zeiss.cms.controller;

import java.util.List;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.zeiss.cms.commons.base.BaseController;
import com.zeiss.cms.commons.utils.PageInfo;
import com.zeiss.cms.model.ProjectRegItem;
import com.zeiss.cms.service.IProjectRegItemService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author zeiss
 * @since 2017-03-08
 */
@Controller
@RequestMapping("/projectRegItem")
public class ProjectRegItemController extends BaseController {
    
    @Autowired private IProjectRegItemService projectRegItemService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/projectRegItem/projectRegItem";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ProjectRegItem projectRegItem, Integer page, Integer rows, String sort,String order) {
        EntityWrapper<ProjectRegItem> ew = new EntityWrapper<ProjectRegItem>();
        ew.setEntity(projectRegItem);
        
        
        Page<ProjectRegItem> pages = getPage(page, rows, sort, order);
        pages = projectRegItemService.selectPage(pages,ew);
        return pageToPageInfo(pages);
    }
   
    @RequestMapping(value = "/getData", method = RequestMethod.POST)
    @ResponseBody
    public List<ProjectRegItem> getData(Long projectId) {
        EntityWrapper<ProjectRegItem> ew = new EntityWrapper<ProjectRegItem>();
      
        ProjectRegItem projectRegItem = new ProjectRegItem();
        
       // projectRegItem.setProjectId(projectRegId);
        ew.eq("project_id", projectId);
        ew.setEntity(projectRegItem);
     
        System.out.println("------->>"+projectId);
              
        List<ProjectRegItem> regItems = projectRegItemService.selectList(ew);
        
        return regItems;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/projectRegItem/projectRegItemAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(ProjectRegItem projectRegItem) {
        boolean b = projectRegItemService.insert(projectRegItem);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
       // ProjectRegItem projectRegItem = new ProjectRegItem();
     //   projectRegItem.setProjectRegId(id);
        boolean b = projectRegItemService.deleteById(id);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }

    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/editPage")
    public String editPage(Model model, Long id) {
        ProjectRegItem projectRegItem = projectRegItemService.selectById(id);
        model.addAttribute("projectRegItem", projectRegItem);
        return "admin/projectRegItem/projectRegItemEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(ProjectRegItem projectRegItem) {
        boolean b = projectRegItemService.updateById(projectRegItem);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}
