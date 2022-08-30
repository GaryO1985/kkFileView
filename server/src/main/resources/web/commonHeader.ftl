<#setting classic_compatible=true>
<link rel="icon" href="./favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<script src="js/jquery-3.0.0.min.js" type="text/javascript"></script>
<script src="js/jquery.form.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/bootbox.min.js" type="text/javascript"></script>
<script src="js/watermark.js" type="text/javascript"></script>
<script src="js/base64.min.js" type="text/javascript"></script>

<script>
    function initWaterMark() {
        let watermarkTxt = '${watermarkTxt}';
        if (watermarkTxt !== '') {
            watermark.init({
                watermark_txt: '${watermarkTxt}',
                watermark_x: 0,
                watermark_y: 0,
                watermark_rows: 0,
                watermark_cols: 0,
                watermark_x_space: ${watermarkXSpace},
                watermark_y_space: ${watermarkYSpace},
                watermark_font: '${watermarkFont}',
                watermark_fontsize: '${watermarkFontsize}',
                watermark_color: '${watermarkColor}',
                watermark_alpha: ${watermarkAlpha},
                watermark_width: ${watermarkWidth},
                watermark_height: ${watermarkHeight},
                watermark_angle: ${watermarkAngle},
            });
        }
    }

    function needFilePassword() {
        if ('${needFilePassword}' == 'true') {
            let promptTitle = "This file needs password to access";
            if ('${filePasswordError}' == 'true') {
                promptTitle = "Password incorrect, please input again.";
            }

            bootbox.prompt({
                title: promptTitle,
                inputType: 'password',
                centerVertical: true,
                callback: function (filePassword) {
                    if (filePassword != null) {
                        const locationHref = window.location.href;
                        const isInclude = locationHref.includes("filePassword=");
                        let redirectUrl = null;
                        if (isInclude) {
                            const url = new URL(locationHref);
                            url.searchParams.set("filePassword", filePassword);
                            redirectUrl = url.href;
                        } else {
                            redirectUrl = locationHref + '&filePassword=' + filePassword;
                        }

                        window.location.replace(redirectUrl);
                    } else {
                        location.reload();
                    }
                }
            });
        }
    }
</script>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    html, body {
        height: 100%;
        width: 100%;
    }
</style>
