<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/sys.css">
<body>
<div class="sys-grid">
    <div id="user-grid"></div>
</div>

<script>

    var userDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/user/create",
                dataType: "json"
            },
            destroy :{
                url:"/user/destroy",
                dataType: "json"
            },
            update: {
                url:"/user/update",
                dataType: "json"
            },
            read :{
                url:"/user/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var userArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'userName',
                title:'用户名',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="userName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'password',
                title:'密码',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="password">'+
                '<span></span>'+
                '</div>'
            },{
                field:'userEmail',
                title:'邮箱',
                attributes:{
                    style:{
                        'width':'16%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="userEmail">'+
                '<span></span>'+
                '</div>'
            },{
                field:'userTel',
                title:'电话',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="userTel">'+
                '<span></span>'+
                '</div>'
            },{
                field:'sysRole',
                title:'角色代码',
                type:'lov',
                lovOptions:{
                    columns:[
                        {field:'roleCode',name:'角色代码'},
                        {field:'roleName',name:'角色名称'}
                    ],
                    url:'/role/read'
                },
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group lov-div">'+
                '<input class="form-control" type="hidden" placeholder="" name="roleCode">'+
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
                field:'validTime',
                title:'开始时间',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="validTime">'+
                '<span></span>'+
                '</div>'
            },{
                field:'deadTime',
                title:'失效时间',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" placeholder="" value="" name="deadTime">'+
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
        dataSource:userDataSource,
        dataId: 'userId'
    };
    $('#user-grid').dataGrid(userArgs);
</script>
</body>