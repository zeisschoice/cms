<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<script type="text/javascript">
    var index_layout;
    var index_tabs;
    var layout_west_tree;

    $(function() {
        index_layout = $('#index_layout').layout({
            fit : true
        });
        index_tabs = $('#index_tabs').tabs({
            fit : true,
            border : false,
            tools : [{
                iconCls : 'icon-home',
                handler : function() {
                    index_tabs.tabs('select', 0);
                }
            }, {
                iconCls : 'icon-refresh',
                handler : function() {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                    index_tabs.tabs('getTab', index).panel('open').panel('refresh');
                }
            }, {
                iconCls : 'icon-del',
                handler : function() {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                    var tab = index_tabs.tabs('getTab', index);
                    if (tab.panel('options').closable) {
                        index_tabs.tabs('close', index);
                    }
                }
            } ]
        });
        
        layout_west_tree = $('#layout_west_tree').tree({
            url : '${path }/resource/tree',
            parentField : 'pid',
            lines : true,
            onClick : function(node) {
                if (node.attributes.indexOf("http") >= 0) {
                    var url = node.attributes;
                    addTab({
                        title : node.text,
                        url : url,
                        iconCls : node.iconCls
                    });
                } else if (node.attributes) {
                    var url = '${path }' + node.attributes;
                    addTab({
                        title : node.text,
                        url : url,
                        iconCls : node.iconCls
                    });
                }
            }
        });
    });

    function addTab(params) {
        var iframe = '<iframe src="' + params.url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
        var t = $('#index_tabs');
        var opts = {
            title : params.title,
            closable : true,
            iconCls : params.iconCls,
            content : iframe,
            border : false,
            fit : true
        };
        if (t.tabs('exists', opts.title)) {
            t.tabs('select', opts.title);
        } else {
            t.tabs('add', opts);
        }
    }

    function logout(){
        $.messager.confirm('提示','确定要退出?',function(r){
            if (r){
                progressLoad();
                $.post('${path }/logout', function(result) {
                    if(result.success){
                        progressClose();
                        window.location.href='${path }';
                    }
                }, 'json');
            }
        });
    }

    function editUserPwd() {
        parent.$.modalDialog({
            title : '修改密码',
            width : 300,
            height : 250,
            href : '${path }/user/editPwdPage',
            buttons : [ {
                text : '确定',
                handler : function() {
                    var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
                    f.submit();
                }
            } ]
        });
    }

     
    
</script>

  <script type="text/javascript">
        $(document).ready(function () {
        /*     $("#metroaqui").AddMetroSimpleButton('bt3', 'metro-vermelho', 'static/metroaqui/Style/Imagem/carta.png', 'Vermelho', 'alert("Vermelho");');
            $("#metroaqui").AddMetroSingleLabeledButton('bt6', 'metro-roxo', 'static/metroaqui/Style/Imagem/admin.png', '30', 'alert("Vermelho");');
            $("#metroaqui").AddMetroSingleLabeledButton('bt6', 'metro-roxo', 'static/metroaqui/Style/Imagem/admin.png', '30', 'alert("Vermelho");');
            $("#metroaqui").AddMetroSingleLabeledButton('bt6', 'metro-roxo', 'static/metroaqui/Style/Imagem/admin.png', '30', 'alert("Vermelho");'); */
		  /*   $("#metroaqui").AddMetroDoubleButton('bt4', 'metro-azul', 'static/metroaqui/Style/Imagem/appbar.home.people.png', '房间管理', 'alert("Azul");'); 
            $("#metroaqui").AddMetroDoubleButton('bt4', 'metro-verde', 'static/metroaqui/Style/Imagem/appbar.people.multiple.png', '住户管理', 'alert("Azul");'); 
            $("#metroaqui").AddMetroDoubleButton('bt4', 'metro-laranja', 'static/metroaqui/Style/Imagem/appbar.settings.png', '设置', 'alert("Azul");'); 
          */

        /*     $("#metroaqui_novo").AddMetroDoubleWithTrailer('bt6', 'metro-azul', 'Style/Imagem/admin.png', 'Button with Status Text', 'alert("Text");', 'metro-info');
			$("#metroaqui_novo").AddMetroDoubleWithTrailerWithBG('bt6', 'Style/Imagem/fundo_metro.png', 'Button with Status Text', 'alert("Text");', 'metro-azul'); */
			
			$("#metroaqui_novo").AddMetroDoubleButton('bt4', 'metro-azul', 'static/metroaqui/Style/Imagem/appbar.home.people.png', '楼房管理', 'alert("Azul");');
			$("#metroaqui_novo").AddMetroDoubleButton('bt4', 'metro-laranja', 'static/metroaqui/Style/Imagem/appbar.people.multiple.png','住户管理', 'alert("Azul");');
		    $("#metroaqui_novo").AddMetroDoubleButton('bt4', 'metro-azul', 'static/metroaqui/Style/Imagem/appbar.settings.png', '系统设置', 'alert("Azul")');
			 /*$("#metroaqui_novo").AddMetroSimpleButton('bt1', 'metro-verde', 'Style/Imagem/carta.png', 'Teste Roger', 'alert("feito b1");'); 
            $("#metroaqui_novo").AddMetroSimpleButton('bt2', 'metro-laranja', 'Style/Imagem/carta.png', 'Laranja', 'alert("Laranja");');
             $("#metroaqui_novo").AddMetroDoubleButton('bt4', 'metro-azul', 'Style/Imagem/carta.png', 'Azul', 'alert("Azul");');
           /*  $("#metroaqui_novo").AddMetroSimpleButton('bt5', 'metro-laranja', 'Style/Imagem/carta.png', 'Laranja', 'alert("Laranja");'); */
		//	$("#metroaqui_novo").AddMetroSimpleButton('bt1', 'metro-verde', 'Style/Imagem/admin.png', 'Teste Roger', '');
       //     $("#metroaqui_novo").AddMetroSimpleButton('bt2', 'metro-laranja', 'Style/Imagem/carta.png', 'Laranja', '');
		//	$("#metroaqui_novo").AddMetroSimpleButton('bt1', 'metro-verde', 'Style/Imagem/carta.png', 'Teste Roger', ''); 
        });
  </script>

</head>
<body>
    <div id="loading" style="position: fixed;top: -50%;left: -50%;width: 200%;height: 200%;background: #fff;z-index: 100;overflow: hidden;">
        <img src="${staticPath }/static/style/images/ajax-loader.gif" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;margin: auto;"/>
    </div>
    <div id="index_layout">
        <div data-options="region:'north',border:false" style=" overflow: hidden; ">
            <div>
                <span style="float: right; padding-right: 20px; margin-top: 15px; color: #333">欢迎 
	                <b><shiro:principal></shiro:principal></b>&nbsp;&nbsp; 
	                <shiro:hasPermission name="/user/editPwdPage">
	                    <a href="javascript:void(0)" onclick="editUserPwd()" class="easyui-linkbutton" plain="true" icon="icon-edit" >修改密码</a>
	                </shiro:hasPermission>&nbsp;&nbsp;
	                <a href="javascript:void(0)" onclick="logout()" class="easyui-linkbutton" plain="true" icon="icon-clear">安全退出</a>
                </span>
                <span class="header"></span>
            </div>
        </div>
        <div data-options="region:'west',split:true" title="菜单" style="width: 160px; overflow: hidden;overflow-y:auto; padding:0px">
            <div class="well well-small" style="padding: 5px 5px 5px 5px;">
                <ul id="layout_west_tree"></ul>
            </div>
        </div>
        <div data-options="region:'center'" style="overflow: hidden;">
            <div id="index_tabs" style="overflow: hidden;">
                <div title="首页" data-options="border:false" style="overflow: hidden;">
                    <script src=''></script>
                    <style>
                        .pro_name a{color: #4183c4;}
                        .osc_git_title{background-color: #d8e5f1;}
                        .osc_git_box{background-color: #fafafa;}
                        .osc_git_box{border-color: #ddd;}
                        .osc_git_info{color: #666;}
                        .osc_git_main a{color: #4183c4;}
                    </style>
                    <!-- ///////////////// -->
                    <div class="easyui-layout" style="width:100%;height:100%;">
				        <div id="p" data-options="region:'east'"  style="width:20%;padding:10px">
				            
				             <div class="easyui-calendar" style="width:100%;height:250px;"></div>
				             <br>
				             <div  style="width:100%;height:400px;">
                                <table id="dataGrid" data-options="fit:true,border:true" title="最近操作"></table>
                             </div>
                             
                             
				        </div>
				        <div data-options="region:'center'" >
				          
				           <div class="easyui-layout" style="width:100%;height:100%;">
				              <div id="p" data-options="region:'north'" border="false" style="width:100%;height:100%;padding:10px;text-aling:center">
				               <%--  <div style="display:inline;align:center;margin:80px">
				                   <div style="float:left;width:25%"><img style="width:100px;height:100px;" src="${staticPath }/static/style/images/network.png"></div>   
				                   <div style="float:left;width:25%"><img style="width:100px;height:100px;" src="${staticPath }/static/style/images/business.png"></div>
				                   <div style="float:left;width:25%"><img style="width:100px;height:100px;" src="${staticPath }/static/style/images/school.png"></div>
				                   <div style="float:left;width:25%"><img style="width:100px;height:100px;" src="${staticPath }/static/style/images/wall_calendar.png"></div>  
				                 </div>    --%>                                         
				               
				               <!--  <div id="metroaqui" sytle="text-align:center" class="metro-panel"></div> -->
				                <div id="metroaqui_novo"></div> 
				                
				                <div id="main" style="width: 600px;height:400px;"></div>
				              </div>
				              
				           
				              
				           </div>
				        </div>
                   </div>
                    <!-- ////////////////// -->
                </div>
            </div>
        </div>
        <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >Copyright © 2017 power by 租房系统</div>
    </div>

    <!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->

    <style>
        /*ie6提示*/
        #ie6-warning{width:100%;position:absolute;top:0;left:0;background:#fae692;padding:5px 0;font-size:12px}
        #ie6-warning p{width:960px;margin:0 auto;}
    </style>
</body>
<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
  </script>
  
      <script type="text/javascript">
        var dataGrid;
        $(function () {
            dataGrid = $('#dataGrid').datagrid({
                url: '${path }/sysLog/loginlog',
                fit: true,
                pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
                columns: [[{
                    width: '80',
                    title: '登录名',
                    field: 'loginName'
                 
                }, {
                    width: '80',
                    title: '用户名',
                    field: 'roleName'
                }, {
                    width: '80',
                    title: '操作时间',
                    field: 'createTime'
                }]]
            });
        });
    </script>
  
  
  
</html>