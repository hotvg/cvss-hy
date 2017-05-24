<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/all.css">
<body>
<div class="all-container">
    <form class="all-condition">
        <div class="col-lg-3">
            <label class="control-label">车辆类别</label>
            <div class="input-group lov-div">
                <input id="condition-typeId" class="form-control" type="hidden" placeholder="" name="typeId">
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
        <div class="col-lg-3">
            <label class="control-label">车辆系列</label>
            <div class="input-group lov-div">
                <input id="condition-seriesId" class="form-control" type="hidden" placeholder="" name="seriesId">
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
        <div class="col-lg-3">
            <label class="control-label">零售价</label>
            <div class="input-group">
                <input id="retailPrice-small" class="form-control" type="number" placeholder="" name="retailPriceSmall">
                <div class="retailPrice-span">~</div>
                <input id="retailPrice-large" class="form-control" type="number" placeholder="" name="retailPriceLarge">
            </div>
        </div>


        <div class="col-lg-3">
            <label class="control-label">驾驶室&emsp;</label>
            <div class="input-group lov-div">
                <input id="condition-cab" class="form-control" type="hidden" placeholder="" name="cab">
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
        <div class="col-lg-3">
            <label class="control-label">发动机&emsp;</label>
            <div class="input-group lov-div">
                <input id="condition-engine" class="form-control" type="hidden" placeholder="" name="engine">
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
        <div class="col-lg-3">
            <label class="control-label">变速箱</label>
            <div class="input-group lov-div">
                <input id="condition-gearbox" class="form-control" type="hidden" placeholder="" name="gearbox">
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

        <div class="col-lg-3">
            <label class="control-label">驱动桥&emsp;</label>
            <div class="input-group lov-div">
                <input id="condition-drive" class="form-control" type="hidden" placeholder="" name="drive">
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
        <div class="col-lg-3">
            <label class="control-label">状态&emsp;&emsp;</label>
            <div class="input-group">
                <select id="condition-status" name="status" title="状态" class="form-control">
                    <option value=""></option>
                    <option value="1">可用</option>
                    <option value="0">不可用</option>
                </select>
            </div>
        </div>


        <div class="col-lg-12 condition-btn">
            <button class="btn btn-default btn-search" type="button">查询</button>
            <button class="btn btn-primary btn-reset" type="button">重置</button>
        </div>
    </form>

    <div class="all-grid">
        <div id="cv-all">

        </div>
    </div>

    <script>

        var $allCondition = $('.all-condition');

        var lovSeriesOptions = {
            columns:[
                {field:'seriesId',name:'系列编号'},
                {field:'seriesName',name:'系列名称'}
            ],
            url:'/sort/series/read',
            param:{
                typeId:$('#condition-typeId').val()
            }
        };

        var $seriesLov = $allCondition.find('.lov-series').lov(lovSeriesOptions);

        var lovTypeOptions = {
            columns:[
                {field:'typeId',name:'类型编号'},
                {field:'typeName',name:'类型名称'}
            ],
            url:'/sort/type/read',
            linkage:$seriesLov
        };


        $allCondition.find('.lov-type').lov(lovTypeOptions);


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

        $allCondition.find('.lov-cab').lov(lovCabOptions);

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

        $allCondition.find('.lov-engine').lov(lovEngineOptions);

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

        $allCondition.find('.lov-gearbox').lov(lovGearboxOptions);

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

        $allCondition.find('.lov-drive').lov(lovDriveOptions);

        var cvDataSource = new grid.dataSource({
            transport: {
                create: {
                    url: "/cv/all/create",
                    dataType: "json"
                },
                destroy :{
                    url:"/cv/all/destroy",
                    dataType: "json"
                },
                update: {
                    url:"/cv/all/update",
                    dataType: "json"
                },
                read :{
                    url:"/cv/all/read",
                    dataType: "json"
                },
                param:{

                }
            },
            page: 1,
            pageSize: 10
        });

        var cvArgs = {
            toolBar:true,
            editable:true,
            columns:[
                {
                    field:'internalModels',
                    title:'内部型号',
                    attributes:{
                        style:{
                            'width':'8%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="internalModels">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'externalModels',
                    title:'公告型号',
                    attributes:{
                        style:{
                            'width':'8%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="externalModels">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'retailPrice',
                    title:'零售价',
                    attributes:{
                        style:{
                            'width':'3%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="number" class="form-control" placeholder="" value="" name="retailPrice">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'cvTypeSeries',
                    title:'所属车系',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'seriesId',name:'配件编号'},
                            {field:'seriesName',name:'配件名称'}
                        ],
                        url:'/sort/series/read'
                    },
                    attributes:{
                        style:{
                            'width':'6%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="seriesId">'+
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
                    field:'cab',
                    title:'驾驶室',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:1
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="cab">'+
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
                    field:'engine',
                    title:'发动机',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:3
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="engine">'+
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
                    field:'gearbox',
                    title:'变速箱',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:2
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="gearbox">'+
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
                    field:'drive',
                    title:'桥',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:6
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="drive">'+
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
                    field:'wheelBase',
                    title:'轴距',
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="wheelBase">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'tire',
                    title:'轮胎',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:4
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="tire">'+
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
                    field:'bunkers',
                    title:'油箱',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:5,
                            partsName:'油箱'
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="bunkers">'+
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
                    field:'flip',
                    title:'翻转',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:1,
                            partsName:'翻转'
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="flip">'+
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
                    field:'mount',
                    title:'悬置',
                    type:'lov',
                    lovOptions:{
                        columns:[
                            {field:'partsId',name:'配件编号'},
                            {field:'partsName',name:'配件名称'}
                        ],
                        url:'/parts/read',
                        param:{
                            typeId:1,
                            partsName:'悬置'
                        }
                    },
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group lov-div">'+
                    '<input class="form-control" type="hidden" placeholder="" name="mount">'+
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
                    field:'otherDescription',
                    title:'其他说明',
                    attributes:{
                        style:{
                            'width':'7%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="otherDescription">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'tractiveTonnage',
                    title:'准牵引质量',
                    attributes:{
                        style:{
                            'width':'5%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="tractiveTonnage">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'carSize',
                    title:'上装尺寸',
                    attributes:{
                        style:{
                            'width':'8%',
                            'text-align': 'center'
                        }
                    },
                    template:
                    '<div class="input-group grid-input">'+
                    '<input style="display: none;" type="text" class="form-control" placeholder="" value="" name="carSize">'+
                    '<span></span>'+
                    '</div>'
                },{
                    field:'createTime',
                    title:'创建时间',
                    attributes:{
                        style:{
                            'width':'7%',
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
            dataSource:cvDataSource,
            dataId: 'cvId'
        };
        var cvDataGrid = $('#cv-all').dataGrid(cvArgs);

        $(function () {

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

            $('.btn-search').click(function () {
                var param = getFormMap('.all-condition');
                param['page'] = 1;
                param['pageSize'] = 10;
                console.log(param);
                cvDataGrid.dataSource.transport.param = param;
                console.log('dataSource'+cvDataGrid.dataSource.transport.param);
                cvDataGrid.refreshBtn.trigger('click');
            });

            $('.btn-reset').click(function () {
                var $allCondition = $('.all-condition');
                $allCondition.find('input').val('');
                $allCondition.find('span').text('');
            });

        });

    </script>

</div>
</body>