<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/sort-cv.css">
<body>
<div class="sort-cv">

    <div class="sort-left">
        <div class="sort-container">
            <div class="sort-title">车辆类型</div>
            <div class="sort-content">
                <div class="cv-type"></div>
            </div>
        </div>
    </div>

    <div class="sort-right">
        <div class="sort-container">
            <div class="sort-title">车辆系列</div>
            <div class="sort-content">
                <div class="cv-type-series"></div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">

    var typeDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/sort/type/create",
                dataType: "json"
            },
            destroy :{
                url:"/sort/type/destroy",
                dataType: "json"
            },
            update: {
                url:"/sort/type/update",
                dataType: "json"
            },
            read :{
                url:"/sort/type/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var typeSeriesDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/sort/series/create",
                dataType: "json"
            },
            destroy :{
                url:"/sort/series/destroy",
                dataType: "json"
            },
            update: {
                url:"/sort/series/update",
                dataType: "json"
            },
            read :{
                url:"/sort/series/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var typeArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'typeName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="typeName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'40%',
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
        dataSource:typeDataSource,
        dataId: 'typeId'
    };

    var typeSeriesArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'seriesName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="seriesName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'typeId',
                title:'所属类型',
                type:'lov',
                lovOptions:{
                    columns:[
                        {field:'typeId',name:'类型编号'},
                        {field:'typeName',name:'类型名称'}
                    ],
                    url:'sort/type/read',
                    param:{

                    }
                },
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group lov-div">'+
                '<input class="form-control" type="hidden" placeholder="" name="typeId">'+
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
                        'width':'40%',
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
        dataSource:typeSeriesDataSource,
        dataId: 'seriesId'
    };

    $('.cv-type').dataGrid(typeArgs); //调用jQuery对象方法
    $('.cv-type-series').dataGrid(typeSeriesArgs);

</script>
</body>
