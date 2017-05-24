<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${base}/resources/css/login.css">
    <link rel="stylesheet" href="${base}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${base}/lib/fontawesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${base}/lib/jquery/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${base}/resources/js/login.js"></script>
</head>
<body>
<div class="back-ground">
    <div class="container">
        <div class="center-block login-div">
            <div class="center-block logo" style="background: url('${sysSet.sysLogo}') no-repeat;"></div>

            <form role="form" method="post" id="login-form">
                <div class="form-group">
                    <label class="control-label">用户名</label>
                    <div class="col-sm-12 input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </span>
                        <input type="text" class="form-control" placeholder="" name="userName">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">密码</label>
                    <div class="col-sm-12 input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        <input type="password" class="form-control" placeholder="" name="password">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">验证码</label>
                    <div class="form-group form-inline">
                        <div class="col-sm-6 input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                            <input id="verifyCode" type="text" class="form-control" placeholder="">
                        </div>
                        <div class="input-group verify-code-div">
                            <img class="verify-code-img" src="/verifyCodeImg">
                            <div class="btn btn-default verify-code-btn">
                                <i class="fa fa-refresh" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group login-btn">
                    <div class="col-sm-12 input-group">
                        <input id="login-btn" type="button" class="btn btn-primary col-sm-12" value="登&nbsp;&nbsp;&nbsp;&nbsp;录">
                    </div>
                </div>

            </form>

        </div>

        <div id="sys-info">
            <span>${sysSet.companyName}</span>
            <span>©</span>
            <span>${sysSet.sysMc}</span>
            <span>${sysSet.sysOc}</span>
        </div>
    </div>
</div>
</body>
</html>