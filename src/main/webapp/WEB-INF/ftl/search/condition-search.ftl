<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/search.css">
<body>
<div id="search-result"></div>
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
                    <span class="retailPrice-span">~</span>
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


            <div class="condition-btn">
                <button class="btn btn-default btn-search" type="button">搜索</button>
                <button class="btn btn-primary btn-reset" type="button">重置</button>
            </div>
    </div>

    <div id="search-history">

        <div id="history-search">

        </div>

        <div id="hot-search">

        </div>

    </div>


</div>

<script>
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

        $('#condition-search-btn').click(function () {
            var internalModels = $('#internal-models').val();
            if(internalModels!==''){
                $searchResult.refresh({
                    url: "/search/result?internalModels="+internalModels
                });
                $searchResult.open();
            }
        });
    });
</script>

</body>
