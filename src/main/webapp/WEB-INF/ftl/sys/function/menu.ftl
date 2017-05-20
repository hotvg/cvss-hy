<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/sys.css">
<body>
<div class="sys-grid">
    <div id="menu-grid"></div>
</div>

<script>

    var menuDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "sys/function/menu/create",
                dataType: "json"
            },
            destroy :{
                url:"sys/function/menu/destroy",
                dataType: "json"
            },
            update: {
                url:"sys/function/menu/update",
                dataType: "json"
            },
            read :{
                url:"sys/function/menu/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var menuArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'menuName',
                title:'菜单名称',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="menuName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'menuDescribe',
                title:'菜单描述',
                attributes:{
                    style:{
                        'width':'20%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="menuDescribe">'+
                '<span></span>'+
                '</div>'
            },{
                field:'menuUrl',
                title:'页面地址',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="menuUrl">'+
                '<span></span>'+
                '</div>'
            },{
                field:'sysMenu',
                title:'父菜单',
                type:'lov',
                lovOptions:{
                    columns:[
                        {field:'menuId',name:'菜单编号'},
                        {field:'menuName',name:'菜单名称'}
                    ],
                    url:'sys/function/menu/read'
                },
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group lov-div">'+
                '<input class="form-control" type="hidden" placeholder="" name="menuParent">'+
                '<div class="form-control" type="text">'+
                '<span class="lov-name"></span>'+
                '<button class="btn-clear-input" type="button">'+
                '<i class="fa fa-times" aria-hidden="true"></i>'+
                '</button>'+
                '</div>'+
                '<div class="input-group-btn">'+
                '<button class="btn btn-default lov-btn" type="button">'+
                '<i class="fa fa-search" aria-hidden="true"></i>'+
                '</button>'+
                '</div>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="createTime">'+
                '<span></span>'+
                '</div>'
            },{
                field:'status',
                title:'状态',
                attributes:{
                    style:{
                        'width':'auto',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="status">'+
                '<span></span>'+
                '</div>'
            }
        ],
        dataSource:menuDataSource,
        dataId: 'menuId'
    };
    $('#menu-grid').dataGrid(menuArgs);
</script>
</body>