<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/search.css">
<body>
<div id="search-result"></div>
<div id="condition-search-result"></div>
<div id="condition-search">
    <div id="auto-input">
        <h4>根据商用车内部型号搜索：</h4>
        <input id="internal-models" title="" />
        <button id="condition-search-btn" class="btn btn-default" type="button">搜索</button>
    </div>

    <div id="more-condition">
        <form class="condition-form">
            <div class="col-lg-12 condition-div">
                <label class="control-label">车辆类别</label>
                <div class="input-group lov-div">
                    <input id="form-typeId" class="form-control" type="hidden" placeholder="" name="typeId">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-type" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 condition-div">
                <label class="control-label">车辆系列</label>
                <div class="input-group lov-div">
                    <input id="form-seriesId" class="form-control" type="hidden" placeholder="" name="seriesId">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-series" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 condition-div">
                <label class="control-label">零售价&emsp;</label>
                <div class="input-group">
                    <input id="form-small" class="form-control" type="number" placeholder="" name="retailPriceSmall">
                    <div class="retailPrice-span">~</div>
                    <input id="form-large" class="form-control" type="number" placeholder="" name="retailPriceLarge">
                </div>
            </div>


            <div class="col-lg-12 condition-div">
                <label class="control-label">驾驶室&emsp;</label>
                <div class="input-group lov-div">
                    <input id="form-cab" class="form-control" type="hidden" placeholder="" name="cab">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-cab" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 condition-div">
                <label class="control-label">发动机&emsp;</label>
                <div class="input-group lov-div">
                    <input id="form-engine" class="form-control" type="hidden" placeholder="" name="engine">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-engine" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 condition-div">
                <label class="control-label">变速箱&emsp;</label>
                <div class="input-group lov-div">
                    <input id="form-gearbox" class="form-control" type="hidden" placeholder="" name="gearbox">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-gearbox" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 condition-div">
                <label class="control-label">驱动桥&emsp;</label>
                <div class="input-group lov-div">
                    <input id="form-drive" class="form-control" type="hidden" placeholder="" name="drive">
                    <div class="form-control lov-input" type="text">
                        <span class="lov-name"></span>
                        <button class="btn-clear-input" type="button">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <button class="btn btn-default lov-drive" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 condition-div">
                <label class="control-label">状态&emsp;&emsp;</label>
                <div class="input-group">
                    <select id="form-status" name="status" title="状态" class="form-control">
                        <option value=""></option>
                        <option value="1">可用</option>
                        <option value="0">不可用</option>
                    </select>
                </div>
            </div>

            <div class="condition-btn-search">
                <button class="btn btn-default btn-condition-search" type="button">搜索</button>
                <button class="btn btn-primary btn-condition-reset" type="button">重置</button>
            </div>
    </div>

    <div id="search-history">

        <div id="history-search">
            <h5>热门搜索</h5>
            <ul>
            <#list hotList as hot>
                <li>
                    <button class="btn btn-default condition-hot-btn" type="button"><span class="hot-content">${hot.internalModels}</span><span class="badge pull-right">${hot.num}</span></button>
                </li>
            </#list>
            </ul>
        </div>

        <div id="hot-search">
            <h5>历史搜索</h5>
            <ul>
            <#list latelyList as lately>
                <li>
                    <button class="btn btn-default condition-lately-btn" type="button">${lately.internalModels}</button>
                </li>
            </#list>
            </ul>
        </div>

    </div>


</div>

<script>

    var $moreCondition = $('#more-condition');

    var lovSeriesOptions = {
        columns:[
            {field:'seriesId',name:'系列编号'},
            {field:'seriesName',name:'系列名称'}
        ],
        url:'/sort/series/read',
        param:{
            typeId:$('#form-typeId').val()
        }
    };

    var $seriesLov = $moreCondition.find('.lov-series').lov(lovSeriesOptions);

    var lovTypeOptions = {
        columns:[
            {field:'typeId',name:'类型编号'},
            {field:'typeName',name:'类型名称'}
        ],
        url:'/sort/type/read',
        linkage:$seriesLov
    };


    $moreCondition.find('.lov-type').lov(lovTypeOptions);


    var lovCabOptions = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read',
        param:{
            typeId:1
        }
    };

    $moreCondition.find('.lov-cab').lov(lovCabOptions);

    var lovEngineOptions = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read',
        param:{
            typeId:3
        }
    };

    $moreCondition.find('.lov-engine').lov(lovEngineOptions);

    var lovGearboxOptions = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read',
        param:{
            typeId:2
        }
    };

    $moreCondition.find('.lov-gearbox').lov(lovGearboxOptions);

    var lovDriveOptions = {
        columns:[
            {field:'partsId',name:'配件编号'},
            {field:'partsName',name:'配件名称'}
        ],
        url:'/parts/read',
        param:{
            typeId:6
        }
    };

    $moreCondition.find('.lov-drive').lov(lovDriveOptions);


    var dataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/cv/all/read/internal-models",
                dataType: "json"
            }
        }
    });
    $("#internal-models").kendoAutoComplete({
        dataSource: dataSource,
        dataTextField: "internalModels"
    });

    $('#search-history').perfectScrollbar();

    $(function () {

        var $searchResult =  $('#search-result').kendoWindow({
            width: '81%',
            height: '79%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>搜索结果</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "json",
                iframe: true
            }
        }).data("kendoWindow");
        $searchResult.center();

        var $conditionSearchResult =  $('#condition-search-result').kendoWindow({
            width: '30%',
            height: '60%',
            modal: true,//最上面不能点其他地方
            draggable: false,//不能拖动
            resizable: false,
            title:'<strong>搜索结果</strong>',
            pinned: true,
            visible: false,
            scrollable: false,
            content: {
                dataType: "html",
                iframe: true
            }
        }).data("kendoWindow");
        $conditionSearchResult.center();


        $('#condition-search-btn').click(function () {
            var internalModels = $('#internal-models').val();
            if(internalModels!==''){
                $searchResult.refresh({
                    url: "/search/result?internalModels="+internalModels
                });
                $searchResult.open();
            }
        });

        $('.condition-lately-btn').click(function () {
            var internalModels = $(this).text();
            if(internalModels!==''){
                $searchResult.refresh({
                    url: "/search/result?internalModels="+internalModels
                });
                $searchResult.open();
            }
        });

        $('.condition-hot-btn').click(function () {
            var internalModels = $(this).find('.hot-content').text();
            if(internalModels!==''){
                $searchResult.refresh({
                    url: "/search/result?internalModels="+internalModels
                });
                $searchResult.open();
            }
        });

        function getFormMap(form) {
            var formMap = {};
            var formArray = $(form).serializeArray();
            for(var i = 0;i<formArray.length;i++){
                var name = formArray[i].name;
                var value = formArray[i].value;
                if(value!=='' && value!==null){
                    formMap[name] = value;
                }
            }
            return formMap;
        }

        $('.btn-condition-search').click(function () {
            var param = getFormMap('.condition-form');
            $.ajax({
                url: '/search/condition',
                type:'post',
                dataType:'html',
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(param),
                async:false,
                success:function (data) {
                    $conditionSearchResult.content(data);
                    $conditionSearchResult.open();
                },
                error:function () {
                    alert('发生未知错误，请稍后再试');
                }
            });
        });

        $('.btn-condition-reset').click(function () {
            var $allCondition = $('.condition-form');
            $allCondition.find('input').val('');
            $allCondition.find('span').text('');
        });
    });
</script>

</body>
