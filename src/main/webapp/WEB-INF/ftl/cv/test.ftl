<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<body>
<div id="tab-cab" class="parts-tab">
    <ul>
        <li>驾驶室</li>
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
    tabCabScript.select(1);

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
                dataType: "json",
                data:{typeId:1}
            }
        },
        page: 1,
        pageSize: 10
    });

    var args = {
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
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="createTime">'+
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

    $(function () {
        $('#content-cab-add').dataGrid(args); //调用jQuery对象方法
    });

</script>
</body>
