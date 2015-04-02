/*
**Author:tianling
**createTime:15/4/2 下午12:35
*/
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Xenon Boostrap Admin Panel" />
    <meta name="author" content="" />

    <title>新样本添加</title>

    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/xenon-core.css">
    <link rel="stylesheet" href="assets/css/xenon-forms.css">
    <link rel="stylesheet" href="assets/css/xenon-components.css">
    <link rel="stylesheet" href="assets/css/xenon-skins.css">
    <link rel="stylesheet" href="assets/css/custom.css">


    <script src="assets/js/jquery-1.11.1.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body class="page-body">

<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

    <!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
    <!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
    <!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
    <div class="sidebar-menu toggle-others fixed">

        <div class="sidebar-menu-inner">

            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href="<?php echo url('/');?>" class="logo-expanded">
                        <img src="assets/images/logo@2x.png" width="80" alt="" />
                    </a>

                    <a href="<?php echo url('/');?>" class="logo-collapsed">
                        <img src="assets/images/logo-collapsed@2x.png" width="40" alt="" />
                    </a>
                </div>

                <!-- This will toggle the mobile menu and will be visible only on mobile devices -->
                <div class="mobile-menu-toggle visible-xs">
                    <a href="#" data-toggle="user-info-menu">
                        <i class="fa-bell-o"></i>
                        <span class="badge badge-success">7</span>
                    </a>

                    <a href="#" data-toggle="mobile-menu">
                        <i class="fa-bars"></i>
                    </a>
                </div>

                <!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->



            </header>



            <ul id="main-menu" class="main-menu">
                <!-- add class "multiple-expanded" to allow multiple submenus to open -->
                <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
                <li>
                    <a href="dashboard-1.html">
                        <i class="linecons-cog"></i>
                        <span class="title">管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="<?php echo url('diaSet');?>">
                                <span class="title">添加新训练对象</span>
                            </a>
                        </li>

                    </ul>
                </li>


                <li>
                    <a href="tables-basic.html">
                        <i class="linecons-database"></i>
                        <span class="title">列表</span>
                    </a>
                    <ul>
                        <li>
                            <a href="<?php echo url('/');?>">
                                <span class="title">训练历史</span>
                            </a>
                        </li>
                    </ul>
                </li>


            </ul>

        </div>

    </div>

    <div class="main-content">


        <div class="page-title">

            <div class="title-env">
                <h1 class="title">样本集管理</h1>
                <p class="description">指定样本对应科室</p>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="dashboard-1.html"><i class="fa-home"></i>Home</a>
                    </li>
                    <li>

                        <a href="tables-basic.html">Tables</a>
                    </li>
                    <li class="active">

                        <strong>Basic Tables</strong>
                    </li>
                </ol>

            </div>

        </div>
        <!-- Table Styles -->
        <div class="panel-body panel-border">

            <div class="row">
                <div class="col-sm-12">

                    <!-- Table Model 2 -->
                    <strong>样本信息</strong>

                    <table class="table table-model-2 table-hover">
                        <thead>
                        <tr>
                            <th>原始输入</th>
                            <th>关键字</th>
                            <th>匹配结果</th>
                            <th>labels</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td><?php echo $data['content'];?></td>
                            <td><?php echo $data['words'];?></td>
                            <td><?php echo $data['target'];?></td>
                            <td><?php echo $data['label'];?></td>
                        </tr>

                        </tbody>
                    </table>

                </div>
            </div>

            <strong>选择科室</strong>

            <script type="text/javascript">
                jQuery(document).ready(function($)
                {
                    $("#s2example-1").select2({
                        placeholder: 'Select your country...',
                        allowClear: true
                    }).on('select2-open', function()
                    {
                        // Adding Custom Scrollbar
                        $(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
                    });

                });
            </script>

            <form action = '<?php echo url('officeSet')?>?id=<?php echo $data['id'];?>' method = 'post'>
                <select class="form-control" id="s2example-1" name = 'office'>
                    <?php foreach($data['office'] as $data){?>
                        <option value="<?php echo $data->office_id?>"><?php echo $data->office_name;?></option>
                    <?php }?>
                </select>

                <input type="submit" class="btn btn-info btn-single pull-right" value="提交"/>
            </form>

        </div>







        <!-- Main Footer -->
        <!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
        <!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
        <!-- Or class "fixed" to  always fix the footer to the end of page -->
        <footer class="main-footer sticky footer-type-1">

            <div class="footer-inner">

                <!-- Add your copyright text here -->
                <div class="footer-text">
                    &copy; 2014
                    <strong>智能分诊系统</strong>
                    design by -  <a href="https://github.com/tianling" title="tianling's git" target="_blank">tianling</a>
                </div>


                <!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
                <div class="go-up">

                    <a href="#" rel="go-top">
                        <i class="fa-angle-up"></i>
                    </a>

                </div>

            </div>

        </footer>
    </div>



    <!-- JavaScripts initializations and stuff -->
    <script src="assets/js/xenon-custom.js"></script>

<link rel="stylesheet" href="assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="assets/js/select2/select2.css">
<link rel="stylesheet" href="assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="assets/js/multiselect/css/multi-select.css">

<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>
<script src="assets/js/moment.min.js"></script>


<!-- Imported scripts on this page -->
<script src="assets/js/daterangepicker/daterangepicker.js"></script>
<script src="assets/js/datepicker/bootstrap-datepicker.js"></script>
<script src="assets/js/timepicker/bootstrap-timepicker.min.js"></script>
<script src="assets/js/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="assets/js/select2/select2.min.js"></script>
<script src="assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
<script src="assets/js/tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="assets/js/typeahead.bundle.js"></script>
<script src="assets/js/handlebars.min.js"></script>
<script src="assets/js/multiselect/js/jquery.multi-select.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
