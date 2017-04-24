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
    <div id="content-cab">
        <div style="clear: both">

            <div class="grid-toolbar">
                <button class="btn btn-default btn-create">新建</button>
                <button class="btn btn-success btn-save">保存</button>
                <button class="btn btn-danger btn-delete">删除</button>
            </div>

            <div class="grid-header grid-header-toolbar">
                <table class="table table-bordered table-condensed">
                    <tr class="active">
                        <th style="width: 20px" class="all-select">
                            <input title="all-select" type="checkbox">
                        </th>
                        <th style="width: 10%" class="text-center">film_id</th>
                        <th style="width: 20%" class="text-center">title</th>
                        <th style="width: 40%" class="text-center">description</th>
                        <th style="width: 10%" class="text-center">language</th>
                        <th style="width: auto" class="text-center">operation</th>
                    </tr>
                </table>
            </div>

            <div class="grid-content grid-content-toolbar">
                <table class="table table-bordered table-condensed table-hover">
                    <tr>
                        <td style="width: 20px" class="one-select"><input title="one-select" type="checkbox"></td>
                        <td style="width: 10%">
                            <div class="input-group grid-input">
                                <input style="display: none;" type="text" class="form-control" placeholder="" value="test" name="userName">
                                <span>test</span>
                            </div>
                            <div class="grid-new-tag">

                            </div>
                        </td>
                        <td style="width: 20%">test</td>
                        <td style="width: 40%">test</td>
                        <td style="width: 10%">test</td>
                        <td style="width: auto">test</td>
                    </tr>
                </table>
            </div>

            <div class="grid-footer">
                <div class="input-group col-lg-1 page-rows">
                    <select title="page-rows" class="form-control">
                        <option>10</option>
                        <option>15</option>
                        <option>20</option>
                        <option>25</option>
                        <option>30</option>
                        <option>35</option>
                    </select>
                </div>

                <input id="page" type="hidden" value="">
                <div class="btn-group grid-nav-container">
                    <div class="btn-group btn-grid-left">
                        <button type="button" class="btn btn-grid-nav prevPage">
                            <i class="fa fa-angle-double-left" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-grid-nav btn-grid-angle prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="btn-group grid-nav">
                        <ul class="grid-nav-ul">
                            <li class="active">1</li>
                            <li>2</li><li>3</li><li>4</li><li>5</li><li>6</li><li>7</li><li>8</li><li>9</li>
                            <li>10</li><li>11</li><li>12</li><li>13</li><li>14</li><li>15</li><li>16</li><li>17</li><li>18</li>
                            <li>19</li><li>20</li><li>21</li><li>22</li><li>23</li><li>24</li><li>25</li><li>26</li><li>27</li>
                            <li>28</li><li>29</li>
                        </ul>
                    </div>
                    <div class="btn-group btn-grid-right">
                        <button type="button" class="btn btn-grid-nav btn-grid-angle next">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-grid-nav nextPage">
                            <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                        </button>
                    </div>


                </div>

                <div class="input-group col-lg-1 page-go">
                    <input title="page-num" type="text" class="form-control page-num">
                    <span class="input-group-btn">
				        <button class="btn btn-default page-btn-go" type="button">Go</button>
                    </span>
                </div>

                <div class="input-group grid-page">
                    <span class="current-page">1</span>
                    /
                    <span class="total-page">3</span>
                </div>

                <div class="input-group refresh-grid btn">
                    <i class="fa fa-refresh" aria-hidden="true"></i>
                </div>

            </div>

        </div>

    </div>
    <div id="content-cab-add">

    </div>
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


    var cabDataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: "parts/cab",
                dataType: "jsonp"
//            },
//            // make JSONP request to http://demos.telerik.com/kendo-ui/service/products/destroy
//            destroy: {
//                url: "http://demos.telerik.com/kendo-ui/service/products/destroy",
//                dataType: "jsonp" // "jsonp" is required for cross-domain requests; use "json" for same-domain requests
//            },
//            parameterMap: function (data, type) {
//                if (type == "destroy") {
//                    // send the destroyed data items as the "models" service parameter encoded in JSON
//                    return {models: kendo.stringify(data.models)}
//                }
            }
        }
    });
    console.log(cabDataSource);



    var args = {
        toolBar:true,
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
        dataSource:{
            pageSize:1,
            pageRows:10,
            data:[
                {partsName:'高顶',createTime:'2016-11-05 10:20:34',status:"1"},
                {partsName:'平顶',createTime:'2016-12-15 13:46:13',status:"1"},
                {partsName:'短体',createTime:'2017-10-25 15:27:56',status:"0"}
            ]
        }
    };

    $(function () {
        $('#content-cab-add').dataGrid(args); //调用jQuery对象方法
    });

</script>
</body>
</html>