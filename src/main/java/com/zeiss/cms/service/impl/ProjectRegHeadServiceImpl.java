package com.zeiss.cms.service.impl;

import com.zeiss.cms.model.ProjectRegHead;
import com.zeiss.cms.mapper.ProjectRegHeadMapper;
import com.zeiss.cms.service.IProjectRegHeadService;
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
public class ProjectRegHeadServiceImpl extends ServiceImpl<ProjectRegHeadMapper, ProjectRegHead> implements IProjectRegHeadService {
    @Autowired private ProjectRegHeadMapper projectRegHeadMapper;
    
    
}
