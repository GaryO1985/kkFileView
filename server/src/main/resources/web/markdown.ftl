<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0">
    <title>markdown file preview</title>
    <script src="js/marked.min.js" type="text/javascript"></script>
    <#include "*/commonHeader.ftl">
</head>
<body>
<input hidden id="textData" value="${textData}"/>

<div class="container">
    <div class="panel panel-default">
        <div id="markdown_btn" class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    ${file.name}
                </a>
            </h4>
        </div>
        <div id="text_btn" class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    ${file.name}
                </a>
            </h4>
        </div>
        <div class="panel-body">
            <div id="markdown"></div>
        </div>
    </div>
</div>

<script>

    window.onload = function () {
        $("#markdown_btn").hide()
        initWaterMark();
        loadMarkdown();
    }

    function loadMarkdown() {
        var textData = Base64.decode($("#textData").val())
        window.textPreData = "<pre style='background-color: #FFFFFF;border:none'>" + textData + "</pre>";
        window.textMarkdownData = marked(textData);
        $("#markdown").html(window.textMarkdownData);
    }


    $(function () {
        $("#markdown_btn").click(function () {
            $("#markdown").html(window.textMarkdownData);
            $("#text_btn").show()
            $("#markdown_btn").hide()
        });

        $("#text_btn").click(function () {
            $("#markdown_btn").show()
            $("#text_btn").hide();
            $("#markdown").html(window.textPreData);
        });
    });

</script>
</body>

</html>
