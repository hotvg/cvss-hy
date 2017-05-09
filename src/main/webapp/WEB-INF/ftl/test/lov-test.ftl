<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<link rel="stylesheet" href="${base}/resources/css/lov.css">
<script src="${base}/resources/js/parts.js"></script>
<script src="${base}/resources/js/dataGrid.js"></script>
<script src="${base}/resources/js/lov.js"></script>
<style>

    #main{
        width: 100%;
        height: 100%;
        position: fixed;
    }
    #nav {
        background-color: #85d989;
        width: 100%;
        height: 50px;
    }
    #content {
        background-color: #cc85d9;
        width: 100%;
        height: auto;
        position: absolute;
        top: 50px;
        bottom: 0;
        left: 0;
    }
</style>
<body>
<div id="main">
    <div id="nav">nav</div>
    <div id="content">content</div>
</div>
</body>