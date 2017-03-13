<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
<script type="text/javascript">
    $(function() {
        $('#projectRegHeadEditForm').form({
            url : '${path}/project/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
     //   $("#editStatus").val('${projectRegHead.projectId}'); 
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="projectRegHeadEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>项目名称</td>
                    <td><input name="projectId" type="hidden"  value="${projectRegHead.projectId}">
                    <input name="name" type="text" placeholder="请输入名称" class="easyui-validatebox" data-options="required:true" value="${projectRegHead.projectName}"></td>
                    <td>项目类型</td>
                    <td >
                        <select id="projectType" name="projectType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>联系人</td>
                    <td><input name="buildOrg"  value="${projectRegHead.buildOrg}">
                    <td>联系地址</td>
                    <td><input name="contactsAddress"  value="${projectRegHead.contactsAddress}">
                </tr>
                 <tr>
                    <td>联系电话</td>
                    <td><input name="contactCall"  value="${projectRegHead.contactCall}">
                    <td>手机</td>
                    <td><input name="contactTel"  value="${projectRegHead.contactTel}">
                </tr>
                 <tr>
                    <td>传真</td>
                    <td><input name="contactFax"  value="${projectRegHead.contactFax}">
                    <td>工作内容</td>
                    <td><input name="workDetail"  value="${projectRegHead.workDetail}">
                </tr>
                 <tr>
                    <td>业务类型</td>
                    <td><input name="businessType"  value="${projectRegHead.businessType}">
                    <td>审批部门</td>
                    <td><input name="aproveDepartment"  value="${projectRegHead.aproveDepartment}">
                </tr>
                 <tr>
                    <td>是否XX</td>
                    <td><input name="isContract"  value="${projectRegHead.isContract}">
                    <td>开始日期</td>
                    <td><input name="startDate"  value="${projectRegHead.startDate}">
                </tr>
                 <tr>
                    <td>结束日期</td>
                    <td><input name="endDate"  value="${projectRegHead.endDate}">
                    <td>项目发布率</td>
                    <td><input name="projectPunishRate"  value="${projectRegHead.projectPunishRate}">
                </tr>
                 <tr>
                    <td>xx原因</td>
                    <td><input name="punishReason"  value="${projectRegHead.punishReason}">
                    <td>业务室</td>
                    <td><input name="businessRoom"  value="${projectRegHead.businessRoom}">
                </tr>
                 <tr>
                    <td>经理</td>
                    <td><input name="manager"  value="${projectRegHead.manager}">
                    <td>记录室</td>
                    <td><input name="recordRoom"  value="${projectRegHead.recordRoom}">
                </tr>
                <tr>
                    <td>填表人</td>
                    <td><input name="fillPerson"  value="${projectRegHead.fillPerson}">
                    <td>记录室</td>
                    <td><input name="projectGroupLeader"  value="${projectRegHead.projectGroupLeader}">
                </tr>
                <tr>
                    <td>部门领导</td>
                    <td><input name="departmentCharger"  value="${projectRegHead.departmentCharger}">
                    <td>记录室</td>
                    <td><input name="chargeDean"  value="${projectRegHead.chargeDean}">
                </tr>
                 
            </table>
        </form>
    </div>
</div>