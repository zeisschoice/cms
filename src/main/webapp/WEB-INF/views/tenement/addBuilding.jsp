<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#buildingAddForm').form({
            url:'${path}/building/add',
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
                result = updateStr(result);
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
        
    
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="楼房信息" style="overflow: hidden;padding: 3px;">
        <form id="buildingAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>楼房名称</td>
                    <td><input name="id" type="hidden"  value="">
                    <input name="buildingName" type="text" placeholder="请输入楼房名称" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>楼房地址</td>
                    <td>
                    <input name="buildingAddress" type="text" placeholder="请输入楼房地址" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>房东</td>
                    <td >
                     <input name="buildingOwn" type="text" placeholder="请输入楼房地址" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""></td>
                </tr>
                 <tr>
                    <td>房东电话</td>
                    <td >
                     <input name="ownPhone" type="text" placeholder="请输入楼房地址" class="easyui-validatebox easyui-textbox" validType="mobile" data-options="required:true" value=""></td>
                </tr>
                 <tr>
                    <td>管理员</td>
                    <td >
                     <input name="buildingManager" type="text" placeholder="请输入楼房地址" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""></td>
                </tr>
                 <tr>
                    <td>管理员电话</td>
                    <td >
                     <input name="managerPhone" type="text" placeholder="请输入管理员电话" class="easyui-validatebox easyui-textbox" validType="mobile" data-options="required:true" value=""></td>
                </tr>
                 <tr>
                    <td>房间数</td>
                    <td >
                     <input name="roomCount" type="text" placeholder="请输入楼房房间数" class="easyui-validatebox easyui-textbox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="3"><textarea id="remark" name="remark" rows="" cols="" ></textarea></td>
                </tr>
            </table>
        </form>
    </div>
</div>