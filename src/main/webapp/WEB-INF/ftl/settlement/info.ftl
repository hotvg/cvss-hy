
<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/settlement.css">
<body>
<div id="info-container">
    <div id="info-original-data">
        <h4>结算前参数</h4>
    <#if cvSettlementPojo.cvPojo.internalModels!=''>
        <div>
            &emsp;内部型号：${cvSettlementPojo.cvPojo.internalModels}
            <input type="hidden" id="cv-internal-models" value="${cvSettlementPojo.cvPojo.internalModels}">
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.externalModels!=''>
        <div>
            &emsp;公告型号：${cvSettlementPojo.cvPojo.externalModels}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.retailPrice!=''>
        <div>
            &emsp;&emsp;零售价：${cvSettlementPojo.cvPojo.retailPrice}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.cvTypeSeries!=''>
        <div>
            &emsp;所属车系：${cvSettlementPojo.cvPojo.cvTypeSeries.seriesName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.cab!=''>
        <div>
            &emsp;&emsp;驾驶室：${cvSettlementPojo.cvPojo.cab.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.engine!=''>
        <div>
            &emsp;&emsp;发动机：${cvSettlementPojo.cvPojo.engine.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.gearbox!=''>
        <div>
            &emsp;&emsp;变速箱：${cvSettlementPojo.cvPojo.gearbox.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.drive!=''>
        <div>
            &emsp;&emsp;驱动桥：${cvSettlementPojo.cvPojo.drive.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.wheelBase!=''>
        <div>
            &emsp;&emsp;&emsp;轴距：${cvSettlementPojo.cvPojo.wheelBase}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.tire!=''>
        <div>
            &emsp;&emsp;&emsp;轮胎：${cvSettlementPojo.cvPojo.tire.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.bunkers!=''>
        <div>
            &emsp;&emsp;&emsp;油箱：${cvSettlementPojo.cvPojo.bunkers.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.flip!=''>
        <div>
            &emsp;&emsp;&emsp;翻转：${cvSettlementPojo.cvPojo.flip.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.mount!=''>
        <div>
            &emsp;&emsp;&emsp;悬置：${cvSettlementPojo.cvPojo.mount.partsName}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.otherDescription!=''>
        <div>
            &emsp;其他说明：${cvSettlementPojo.cvPojo.otherDescription}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.tractiveTonnage!=''>
        <div>
            准牵引质量：${cvSettlementPojo.cvPojo.tractiveTonnage}
        </div>
    </#if>

    <#if cvSettlementPojo.cvPojo.carSize!=''>
        <div>
            &emsp;上装尺寸：${cvSettlementPojo.cvPojo.carSize}
        </div>
    </#if>
    </div>


    <div id="info-settlement-parts">
        <h4>结算后</h4>
        <div id="info-parts-all">
            <div id="info-parts-container">

            </div>
        </div>
        <div class="info-total-price">
            <span class="info-tp-name">总计：</span>
            <span class="info-tp-price">${cvSettlementPojo.totalPrice}</span>
        </div>
    </div>
</div>


<script>
    $(function () {

        var parseJsonArray = {
            infoParts:function (ele) {
                ele.append('<div class="info-parts"></div>');
                return ele.find('.info-parts:last-child');
            },
            partsOriginal:function (ele,str1,str2) {
                ele.append('<div class="info-parts-original">'+
                                '<span class="info-parts-name">'+str1+'</span>'+
                                '<span class="info-original-parts">'+str2+'</span>'+
                            '</div>');
            },
            changeParts:function (ele) {
                ele.append('<ul class="info-change-parts"></ul>');
                return ele.find('.info-change-parts');
            },
            partsLi:function (ele,array) {
                for(var i = 0;i<array.length;i++){
                    var object = array[i];
                    ele.append('<li>'+
                            '<span class="info-change-name">'+object.partsName+'</span>'+
                            '<span class="info-change-price">'+object.taxPrice+'</span>'+
                            '</li>')
                }
            },
            partsPrice:function (ele,str) {
                ele.append('<div class="info-parts-price">'+
                                '<span class="info-tp-name">小计：</span>'+
                                '<span class="info-tp-price">'+str+'</span>'+
                            '</div>')
            }
        };
        
        var partsJson = '${cvSettlementPojo.partsJson}';
        var partsObject = JSON.parse(partsJson);
        $.each(partsObject,function (index,object) {
            var partsName = object.partsName;
            var originalParts = object.originalParts;
            var price = object.price;
            var addArray = object.addArray;
            var removeArray = object.removeArray;
            var replaceArray = object.replaceArray;
            var infoParts = parseJsonArray.infoParts($('#info-parts-container'));
            parseJsonArray.partsOriginal(infoParts,partsName,originalParts);
            var partsUl = parseJsonArray.changeParts(infoParts);
            if(addArray!==''){
                parseJsonArray.partsLi(partsUl,addArray);
            }
            if(removeArray!==''){
                parseJsonArray.partsLi(partsUl,removeArray);
            }
            if(replaceArray!==''){
                parseJsonArray.partsLi(partsUl,replaceArray);
            }
            parseJsonArray.partsPrice(infoParts,price);

        });

        console.log(partsObject)
    });
</script>

<script>
    $('#info-original-data').perfectScrollbar();
    $('#info-parts-all').perfectScrollbar();

</script>

</body>