<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#projectRegHeadAddForm').form({
            url : '${path}/project/add',
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
                    //之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;height:50%" >
        <form id="projectRegHeadAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>项目名称</td>
                    <td><input name="projectName" type="text" placeholder="请输入名称" class="easyui-validatebox" ></td>
                    <td>项目类型</td>
                    <td >
                        <select id="projectType" name="projectType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                    <td>联系人</td>
                    <td><input id="buildOrg" name="buildOrg" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="" >
                     <td>记录室</td>
                    <td><input name="chargeDean" id="chargeDean" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                <tr>
                   
                    <td>联系地址</td>
                    <td><input id="contactsAddress" name="contactsAddress" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="" >
                     <td>联系电话</td>
                    <td><input name="contactCall"  id="contactCall" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>手机</td>
                    <td><input name="contactTel" id="contactTel" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                 <tr>
                    <td>传真</td>
                    <td><input name="contactFax" id="contactFax" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value=""  >
                    <td>工作内容</td>
                    <td><input name="workDetail" id="workDetail" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                     <td>业务类型</td>
                    <td><input name="businessType" id="businessType" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                 <tr>
                    <td>审批部门</td>
                    <td><input name="aproveDepartment" id="aproveDepartment" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>是否XX</td>
                    <td><input name="isContract" id="isContract" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>开始日期</td>
                    <td><input name="startDate" id="startDate" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                 <tr>
                    <td>结束日期</td>
                    <td><input name="endDate" id="endDate" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>项目发布率</td>
                    <td><input name="projectPunishRate" id="projectPunishRate" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                     <td>xx原因</td>
                    <td><input name="punishReason" id="punishReason" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                 <tr>
                    <td>业务室</td>
                    <td><input name="businessRoom" id="businessRoom" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                     <td>经理</td>
                    <td><input name="manager" id="manager" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>记录室</td>
                    <td><input name="recordRoom" id="recordRoom" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
                <tr>
                    <td>填表人</td>
                    <td><input name="fillPerson" id="fillPerson" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="" >
                    <td>记录室</td>
                    <td><input name="projectGroupLeader" id="projectGroupLeader" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                    <td>部门领导</td>
                    <td><input name="departmentCharger" id="departmentCharger" type="text" placeholder="请输入字典ID" class="easyui-validatebox"  value="">
                </tr>
            </table>
        </form>
    </div>
     <!-- 明细 -->
     
     <div data-options="region:'south',border:false" style="overflow: hidden;padding: 3px;height:50%">
	     <div class="easyui-tabs" style="width:100%;height:250px">
	        <div title="财务安排" style="padding:10px">
	            <p>The tabs has a width of 100%.</p>
	        </div>
	        <div title="Title2">
	        
	        </div>
	    </div>
    </div> 
     
    
</div>