package com.zeiss.cms.service.impl;

import com.zeiss.cms.model.ProjectFinanceItem;
import com.zeiss.cms.mapper.ProjectFinanceItemMapper;
import com.zeiss.cms.service.IProjectFinanceItemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * <p>
 * 财物项目  服务实现类
 * </p>
 * @author zeiss
 * @since 2017-03-08
 */
@Service
public class ProjectFinanceItemServiceImpl extends ServiceImpl<ProjectFinanceItemMapper, ProjectFinanceItem> implements IProjectFinanceItemService {
    @Autowired private ProjectFinanceItemMapper projectFinanceItemMapper;
    
    
}
