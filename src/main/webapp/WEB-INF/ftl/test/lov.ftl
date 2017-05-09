<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<link rel="stylesheet" href="${base}/resources/css/lov.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<script src="${base}/resources/js/lov.js"></script>
<body>
<div class="container lov">
    <form class="form-horizontal lov-form" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">配件编号</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">配件名称</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" placeholder="">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </div>
    </form>

    <div class="lov-header">
        <table class="table table-bordered table-condensed">
            <tr class="active">
                <th>配件编号</th>
                <th>配件名称</th>
            </tr>
        </table>
    </div>

    <div class="lov-content">
        <table class="table table-bordered table-condensed table-hover">
            <tr>
                <td>测试</td>
                <td>测试</td>
            </tr>
            <tr>
                <td>测试</td>
                <td>测试</td>
            </tr>
            <tr>
                <td>测试</td>
                <td>测试</td>
            </tr>
        </table>
    </div>

    <div class="lov-footer">
        <div class="lov-footer-border">
            <div class="btn-group">
                <div class="btn-group lov-btn">
                    <button type="button" class="btn prevPage">
                        <i class="fa fa-angle-double-left" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btn prev lov-angle-btn">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="btn-group lov-sly">
                    <ul class="lov-footer-nav">
                        <li class="active">1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                    </ul>
                </div>
                <div class="btn-group lov-btn">
                    <button type="button" class="btn next lov-angle-btn">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btn nextPage">
                        <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>