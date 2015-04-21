<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Smart i-matching</title>
        <link rel="stylesheet" type="text/css" href="css/main.css" />
        <script src="assets/js/jquery-1.11.1.min.js"></script>
    </head>

    <body>
        <div id="Wrap">
            <div id="input">
                <textarea  name="diagnose" id="diag" cols="20" rows="5"></textarea>
            </div>

            <div id="submit">
                <button onclick="predict()">提交</button>
            </div>
        </div>
    </body>

    <script>
        function predict(){
            sentence = $('#diag').val();

            $.post("<?php echo url('predict')?>",{
                sentence:sentence
            },function(data,textStatus){
                var jsonList=eval("("+data+")");

                if(jsonList.status == 200){
                    alert("建议您去"+jsonList.data.office_name+"挂号");
                    window.location.href='register?id='+jsonList.data.office_id;
                }
            });
        }
    </script>


</html>