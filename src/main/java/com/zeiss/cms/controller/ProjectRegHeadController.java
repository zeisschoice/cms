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
import com.zeiss.cms.model.ProjectRegHead;
import com.zeiss.cms.service.IProjectRegHeadService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author zeiss
 * @since 2017-03-08
 */
@Controller
@RequestMapping("/project")
public class ProjectRegHeadController extends BaseController {
    
    @Autowired private IProjectRegHeadService projectRegHeadService;
    
    @GetMapping("/projectRegHead")
    public String manager() {
        return "project/projectRegHead";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ProjectRegHead projectRegHead, Integer page, Integer rows, String sort,String order) {
        EntityWrapper<ProjectRegHead> ew = new EntityWrapper<ProjectRegHead>();
        ew.setEntity(projectRegHead);
        Page<ProjectRegHead> pages = getPage(page, rows, sort, order);
        pages = projectRegHeadService.selectPage(pages,ew);
        return pageToPageInfo(pages);
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "project/projectRegHeadAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(ProjectRegHead projectRegHead) {
        boolean b = projectRegHeadService.insert(projectRegHead);
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
        ProjectRegHead projectRegHead = new ProjectRegHead();
        projectRegHead.setProjectId(id);
        projectRegHead.setBrancheDean("test");
        boolean b = projectRegHeadService.updateById(projectRegHead);
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
        ProjectRegHead projectRegHead = projectRegHeadService.selectById(id);
        model.addAttribute("projectRegHead", projectRegHead);
        return "project/projectRegHeadEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping(value = "/edit" , method = RequestMethod.POST)
    @ResponseBody
    public Object edit(ProjectRegHead projectRegHead) {
        boolean b = projectRegHeadService.updateById(projectRegHead);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}
