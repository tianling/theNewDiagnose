
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>

<body>
    <table border="0" cellpadding="3" cellspacing="0" style="width: 60%">
        <form action="<?php echo url('diaGet')?>" method="post" name="sentence">
            <tr>
                <td>请输入症状</td>
            </tr>
            <tr>
                <td>
                    <textarea rows="10" cols="40" name="sentence" id="sentence"></textarea>
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="提交"></td>
            </tr>
        </form>

    </table>
</body>
</html>