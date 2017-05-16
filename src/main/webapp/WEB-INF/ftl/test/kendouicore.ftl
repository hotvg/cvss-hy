<#include "include/header.ftl"/>
<link rel="stylesheet" href="${base}/resources/css/kendoui.css">
<link rel="stylesheet" href="${base}/resources/css/parts.css">
<link rel="stylesheet" href="${base}/resources/css/dataGrid.css">
<script src="${base}/resources/js/dataGrid.js"></script>
<body>
<input id="orders" style="width: 400px" />
<script>
    $(document).ready(function() {
        $("#orders").kendoAutoComplete({
            dataTextField: "ShipName",
            virtual: true,
            height: 100,
            dataSource: {
                type: "odata",
                transport: {
                    read: "http://demos.telerik.com/kendo-ui/service/Northwind.svc/Orders"
                },
                pageSize: 10,
                serverPaging: true,
                serverFiltering: true
            }
        });
    });
</script>
</body>