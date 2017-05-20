<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<body>
<div class="parts-grid">
    <div id="parts-grid"></div>
</div>

<script>

    var partsDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/type/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/type/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/type/update",
                dataType: "json"
            },
            read :{
                url:"/parts/type/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var partsArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'typeName',
                title:'类型名称',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="internalModels">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'搜索时间',
                attributes:{
                    style:{
                        'width':'35%',
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
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="createTime">'+
                '<span></span>'+
                '</div>'
            }
        ],
        dataSource:partsDataSource,
        dataId: 'partsId'
    };
    $('#parts-grid').dataGrid(partsArgs);
</script>
</body>
