<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<body>
<div id="tab-cab" class="parts-tab">
    <ul>
        <li>原装</li>
        <li>可加装</li>
        <li>可换装</li>
    </ul>
    <div id="content-cab"></div>
    <div id="content-cab-add"></div>
    <div id="content-cab-replace"></div>
</div>
<script type="text/javascript">
    var tabCabScript = $('#tab-cab').kendoTabStrip({
        animation: {
            close: {
                duration: 100,
                effects: "fadeOut"
            },
            open: {
                duration: 100,
                effects: "fadeIn"
            },scrollable: false

        }
    }).data("kendoTabStrip");
    tabCabScript.select(0);

    var cabDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/update",
                dataType: "json"
            },
            read :{
                url:"/parts/read",
                dataType: "json"
            },
            param:{
                typeId:1
            }
        },
        page: 1,
        pageSize: 10
    });

    var cabAddDataSource = new grid.dataSource({
        transport: {
            create: {
                url: "/parts/add/create",
                dataType: "json"
            },
            destroy :{
                url:"/parts/add/destroy",
                dataType: "json"
            },
            update: {
                url:"/parts/add/update",
                dataType: "json"
            },
            read :{
                url:"/parts/add/read",
                dataType: "json"
            },
            param:{
                typeId:1
            }
        },
        page: 1,
        pageSize: 10
    });

    var cabArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'partsName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                        }
                    },
                template:
                '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="partsName">'+
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
        dataSource:cabDataSource,
        dataId: 'partsId'
    };

    var cabAddArgs = {
        toolBar:true,
        editable:true,
        columns:[
            {
                field:'addName',
                title:'名称',
                attributes:{
                    style:{
                        'width':'15%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="addName">'+
                '<span></span>'+
                '</div>'
            },{
                field:'unit',
                title:'单位',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="unit">'+
                '<span></span>'+
                '</div>'
            },{
                field:'taxPrice',
                title:'税前价',
                attributes:{
                    style:{
                        'width':'10%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="taxPrice">'+
                '<span></span>'+
                '</div>'
            },{
                field:'remarks',
                title:'备注',
                attributes:{
                    style:{
                        'width':'25%',
                        'text-align': 'center'
                    }
                },
                template:
                '<div class="input-group grid-input">'+
                '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="remarks">'+
                '<span></span>'+
                '</div>'
            },{
                field:'createTime',
                title:'创建时间',
                attributes:{
                    style:{
                        'width':'20%',
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
        dataSource:cabAddDataSource,
        dataId: 'partsId'
    };

    $(function () {
        $('#content-cab').dataGrid(cabArgs); //调用jQuery对象方法
        $('#content-cab-add').dataGrid(cabAddArgs);

    });

</script>
</body>
