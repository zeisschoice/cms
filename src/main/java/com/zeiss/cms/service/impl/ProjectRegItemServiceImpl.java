package com.zeiss.cms.service.impl;

import com.zeiss.cms.model.ProjectRegItem;
import com.zeiss.cms.mapper.ProjectRegItemMapper;
import com.zeiss.cms.service.IProjectRegItemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * <p>
 *   服务实现类
 * </p>
 * @author zeiss
 * @since 2017-03-08
 */
@Service
public class ProjectRegItemServiceImpl extends ServiceImpl<ProjectRegItemMapper, ProjectRegItem> implements IProjectRegItemService {
    @Autowired private ProjectRegItemMapper projectRegItemMapper;
    
    
}
