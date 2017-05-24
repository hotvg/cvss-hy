<#assign base=request.contextPath />
<link rel="stylesheet" href="${base}/resources/css/sys.css">
<body>
<div class="set-container">
    <div class="input-group">
        <label>系统LOGO：(80px*60px)</label>
        <div class="set-logo" style="background: url(${sysSet.sysLogo}) no-repeat center;"></div>
        <form id="uploadForm" enctype="multipart/form-data">
            <input id="up-logo" type="file" name="file">
        </form>
        <button type="button" class="btn btn-default set-btn-up" >上传</button>
    </div>
    <form id="set-form">
    <div class="input-group">
        <label>系统名称：</label>
        <input class="form-control" value="${sysSet.sysTitle}" title="" name="sysTitle">
    </div>
    <div class="input-group">
        <label>系统英文名：</label>
        <input class="form-control" value="${sysSet.sysMc}" title="" name="sysMc">
    </div>
    <div class="input-group">
        <label>系统版权：</label>
        <input class="form-control" value="${sysSet.sysOc}" title="" name="sysOc">
    </div>
    <div class="input-group">
        <label>公司名称：</label>
        <input class="form-control" value="${sysSet.companyName}" title="" name="companyName">
    </div>
    <div class="set-btn">
        <button type="button" class="btn btn-success set-btn-save">保存</button>
        <button type="reset" class="btn btn-primary set-btn-reset">重置</button>
    </div>
    </form>
</div>
<script>
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

        $('.set-btn-save').click(function () {
            var array = getFormMap('#set-form');
            $.ajax({
                url: '/sys/set/update',
                type:'post',
                dataType:'json',
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(array),
                success:function (data) {
                    if(Number(data) === 1){
                        alert('修改成功');
                    }
                },
                error:function () {
                    alert('发生未知错误，请稍后再试');
                }
            });

        });
        $('.set-btn-reset').click(function () {
            $('.set-container').find('input').val('');
        });
        $('.set-btn-up').click(function () {
            $.ajax({
                url: '/sys/set/upload',
                type:'post',
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,
                data:new FormData($('#uploadForm')[0]),
                success:function (data) {
                    if(data){
                        alert('上传成功');
                    }
                },
                error:function () {
                    alert('发生未知错误，请稍后再试');
                }
            });
        });

        function preview1(file) {
            var img = new Image(), url = img.src = URL.createObjectURL(file);
            img.width = 80;
            img.height = 60;
            var $img = $(img);
            img.onload = function() {
                URL.revokeObjectURL(url);
                $('.set-logo').empty().append($img);
            }
        }

        $('#up-logo').change(function (e) {
            var file = e.target.files[0];
            preview1(file);
        });
    });
</script>
</body>