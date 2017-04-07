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
//import com.gzcx.commons.base.BaseController;
//import com.gzcx.commons.utils.PageInfo;
import com.zeiss.cms.model.ProjectFinanceItem;
import com.zeiss.cms.service.IProjectFinanceItemService;

/**
 * <p>
 * 财物项目  前端控制器
 * </p>
 * @author zeiss
 * @since 2017-03-08
 */
@Controller
@RequestMapping("/projectFinanceItem")
public class ProjectFinanceItemController extends BaseController {
    
    @Autowired private IProjectFinanceItemService projectFinanceItemService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/projectFinanceItem/projectFinanceItem";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ProjectFinanceItem projectFinanceItem,Integer page, Integer rows, String sort,String order) {
        EntityWrapper<ProjectFinanceItem> ew = new EntityWrapper<ProjectFinanceItem>();
      
        ew.setEntity(projectFinanceItem);
        Page<ProjectFinanceItem> pages = getPage(page, rows, sort, order);
        pages = projectFinanceItemService.selectPage(pages,ew);
        return pageToPageInfo(pages);
    }
   
    @RequestMapping(value = "/getData", method = RequestMethod.POST)
    @ResponseBody
    public List<ProjectFinanceItem> getData(Long projectId) {
        EntityWrapper<ProjectFinanceItem> ew = new EntityWrapper<ProjectFinanceItem>();
      
        ProjectFinanceItem projectFinanceItem = new ProjectFinanceItem();
       // projectFinanceItem.setProjectId(projectId);
        ew.eq("project_id", projectId);
        ew.setEntity(projectFinanceItem);
        List<ProjectFinanceItem> projectFinanceItems= projectFinanceItemService.selectList(ew);
        return projectFinanceItems;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/projectFinanceItem/projectFinanceItemAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(ProjectFinanceItem projectFinanceItem) {

    	boolean b = projectFinanceItemService.insert(projectFinanceItem);
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
      //  ProjectFinanceItem projectFinanceItem = new ProjectFinanceItem();
     //   projectFinanceItem.setFinanceItemId(id);
        boolean b = projectFinanceItemService.deleteById(id);
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
        ProjectFinanceItem projectFinanceItem = projectFinanceItemService.selectById(id);
        model.addAttribute("projectFinanceItem", projectFinanceItem);
        return "admin/projectFinanceItem/projectFinanceItemEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(ProjectFinanceItem projectFinanceItem) {
        boolean b = projectFinanceItemService.updateById(projectFinanceItem);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}
