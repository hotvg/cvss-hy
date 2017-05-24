<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/search.css">
<body>
<div class="search-grid">
    <div id="search-grid"></div>
</div>

<script>

    var searchDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/search/create",
                dataType: "json"
            },
            destroy :{
                url:"/search/destroy",
                dataType: "json"
            },
            update: {
                url:"/search/update",
                dataType: "json"
            },
            read :{
                url:"/search/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var searchArgs = {
        toolBar:true,
        editable:false,
        columns:[
            {
                field:'internalModels',
                title:'内部型号',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="internalModels">'+
                '<span></span>'+
                '</div>'
            },{
                field:'userName',
                title:'用户名',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="userName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'搜索时间',
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
            }
        ],
        dataSource:searchDataSource,
        dataId: 'searchId'
    };
    $('#search-grid').dataGrid(searchArgs);
</script>
</body>
