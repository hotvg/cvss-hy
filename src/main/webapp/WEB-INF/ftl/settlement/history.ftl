<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/search.css">
<body>
<div id="settlement-info"></div>
<div class="search-grid">
    <div id="settlement-grid"></div>
</div>

<script>

    var settlementDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/settlement/create",
                dataType: "json"
            },
            destroy :{
                url:"/settlement/destroy",
                dataType: "json"
            },
            update: {
                url:"/settlement/update",
                dataType: "json"
            },
            read :{
                url:"/settlement/read",
                dataType: "json"
            },
            param:{

            }
        },
        page: 1,
        pageSize: 10
    });

    var settlementArgs = {
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
                '<button class="btn btn-default settlement-info" style="padding-bottom: 2px;padding-top: 2px;"><span></span></button>'+
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
                title:'结算时间',
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
        dataSource:settlementDataSource,
        dataId: 'settlementId'
    };
    $('#settlement-grid').dataGrid(settlementArgs);
    $(function () {
        var $settlementInfo =  $('#settlement-info').kendoWindow({
            width: '81%',
            height: '79%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>结算详情</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "json",
                iframe: true
            }
        }).data("kendoWindow");

        $('.settlement-info').click(function () {
            var settlementId =  $(this).closest('tr').attr('id').split('-')[1];
            $settlementInfo.refresh({
                url: "/settlement/read/info?settlementId="+settlementId
            });
            $settlementInfo.open();
        });
    });

</script>
</body>
