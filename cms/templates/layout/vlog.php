<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @since         0.10.0
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 * @var \App\View\AppView $this
 */

$cakeDescription = 'CakePHP: the rapid development php framework';
?>
<!DOCTYPE html>
<html>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Skydash Admin</title>
    <?= $this->Html->meta('icon') ?>

    <?= $this->Html->css(['normalize.min', 'milligram.min', 'fonts', 'cake','style']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/feather/feather.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/ti-icons/css/themify-icons.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/css/vendor.bundle.base.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/font-awesome/css/font-awesome.min.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/mdi/css/materialdesignicons.min.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/bootstrap-maxlength/bootstrap-maxlength.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/datatables.net-bs5/dataTables.bootstrap5.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/vendors/ti-icons/css/themify-icons.css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'stylesheet', 'href' => '/js/select.dataTables.min.css', 'type' => 'text/css']) ?>
    <?= $this->Html->tag('link', '', ['rel' => 'shortcut icon', 'href' => '/images/favicon.png']) ?>




    <?= $this->fetch('meta') ?>
    <?= $this->fetch('css') ?>
    <?= $this->fetch('script') ?>
</head>
<body>
<div class="container-scroller">

<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <!-- <a class="navbar-brand brand-logo me-5" href="index.html"><img src="assets/images/logo.svg" class="me-2" alt="logo" /></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg" alt="logo" /></a> -->
        <a class="navbar-brand brand-logo me-5" href="<?= $this->Url->build('/') ?>">
        <img src="<?= $this->Url->image('images/logo.svg') ?>" class="me-2" alt="logo" />
    </a>
    <a class="navbar-brand brand-logo-mini" href="<?= $this->Url->build('/') ?>">
        <img src="<?= $this->Url->image('images/logo-mini.svg') ?>" alt="logo" />
    </a>

    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
        <span class="icon-menu"></span>
        </button>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
        <span class="icon-menu"></span>
        </button>
    </div>
</nav>
<!-- partial -->
<div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="icon-grid menu-icon"></i>
            <span class="menu-title">Dashboard</span>
        </a>
        </li>

        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
            <i class="icon-columns menu-icon"></i>
            <span class="menu-title">Form elements</span>

        </a>

        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
            <i class="icon-bar-graph menu-icon"></i>
            <span class="menu-title">Charts</span>

        </a>

        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
            <i class="icon-grid-2 menu-icon"></i>
            <span class="menu-title">Tables</span>

        </a>

        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
            <i class="icon-contract menu-icon"></i>
            <span class="menu-title">Icons</span>

        </a>

        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
            <i class="icon-head menu-icon"></i>
            <span class="menu-title">User Pages</span>

        </a>
        </li>
        <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
            <i class="icon-ban menu-icon"></i>
            <span class="menu-title">Error pages</span>

        </a>

        </li>
        <li class="nav-item">
        <a class="nav-link" href="../../../docs/documentation.html">
            <i class="icon-paper menu-icon"></i>
            <span class="menu-title">Documentation</span>
        </a>
        </li>
    </ul>
</nav>

<!-- main panel -->
<div class="main-panel">
    <div class="content-wrapper">
    <div class="row">
        <div class="col-md-6 grid-margin stretch-card">
        <div class="card tale-bg">
            <div class="card-people mt-auto">
            <?= $this->Html->image('images/dashboard/people.svg', ['alt' => 'people']) ?>
            <div class="weather-info">
                <div class="d-flex">
                <div>
                    <h2 class="mb-0 font-weight-normal"><i class="icon-sun me-2"></i>31<sup>C</sup></h2>
                </div>
                <div class="ms-2">
                    <h4 class="location font-weight-normal">India</h4>
                    <h6 class="font-weight-normal">Illinois</h6>
                </div>
                </div>
            </div>
            </div>
        </div>
        </div>
        <div class="col-md-6 grid-margin transparent">
        <div class="row">
            <div class="col-md-6 mb-4 stretch-card transparent">
                <div class="card card-tale">
                    <div class="card-body">
                    <p class="mb-4">Today’s Bookings</p>
                    <p class="fs-30 mb-2">4006</p>
                    <p>10.00% (30 days)</p>
                    </div>
                </div>
                </div>
                <div class="col-md-6 mb-4 stretch-card transparent">
                <div class="card card-dark-blue">
                    <div class="card-body">
                    <p class="mb-4">Total Bookings</p>
                    <p class="fs-30 mb-2">61344</p>
                    <p>22.00% (30 days)</p>
                    </div>
                </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                <div class="card card-light-blue">
                    <div class="card-body">
                    <p class="mb-4">Number of Meetings</p>
                    <p class="fs-30 mb-2">34040</p>
                    <p>2.00% (30 days)</p>
                    </div>
                </div>
                </div>
                <div class="col-md-6 stretch-card transparent">
                <div class="card card-light-danger">
                    <div class="card-body">
                    <p class="mb-4">Number of Clients</p>
                    <p class="fs-30 mb-2">47033</p>
                    <p>0.22% (30 days)</p>
                    </div>
                </div>
                </div>
            </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                <p class="card-title mb-0">Top Products</p>
                <div class="table-responsive">
                    <table class="table table-striped table-borderless">
                    <thead>
                        <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Date</th>
                        <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <td>Search Engine Marketing</td>
                        <td class="font-weight-bold">$362</td>
                        <td>21 Sep 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-success">Completed</div>
                        </td>
                        </tr>
                        <tr>
                        <td>Search Engine Optimization</td>
                        <td class="font-weight-bold">$116</td>
                        <td>13 Jun 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-success">Completed</div>
                        </td>
                        </tr>
                        <tr>
                        <td>Display Advertising</td>
                        <td class="font-weight-bold">$551</td>
                        <td>28 Sep 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-warning">Pending</div>
                        </td>
                        </tr>
                        <tr>
                        <td>Pay Per Click Advertising</td>
                        <td class="font-weight-bold">$523</td>
                        <td>30 Jun 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-warning">Pending</div>
                        </td>
                        </tr>
                        <tr>
                        <td>E-Mail Marketing</td>
                        <td class="font-weight-bold">$781</td>
                        <td>01 Nov 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-danger">Cancelled</div>
                        </td>
                        </tr>
                        <tr>
                        <td>Referral Marketing</td>
                        <td class="font-weight-bold">$283</td>
                        <td>20 Mar 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-warning">Pending</div>
                        </td>
                        </tr>
                        <tr>
                        <td>Social media marketing</td>
                        <td class="font-weight-bold">$897</td>
                        <td>26 Oct 2018</td>
                        <td class="font-weight-medium">
                            <div class="badge badge-success">Completed</div>
                        </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                </div>
            </div>
            </div>
        </div>
        </div>
<!-- content-wrapper ends -->
<!-- partial:partials/_footer.html -->
<footer class="footer">
    <div class="d-sm-flex justify-content-center justify-content-sm-between">
    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2023. Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ms-1"></i></span>
    </div>
</footer>
<!-- partial -->
</div>
<!-- page-body-wrapper ends -->
    </div>



<!-- script -->
<?= $this->Html->script([
    'js/off-canvas',
    'js/template',
    'js/settings',
    'js/todolist',
    'js/jquery.cookie',
    'js/dashboard'
]) ?>
<?= $this->Html->tag('script', '', ['src' => '/vendors/js/vendor.bundle.base.js']) ?>
<?= $this->Html->tag('script', '', ['src' => '/vendors/chart.js/chart.umd.js']) ?>
<?= $this->Html->tag('script', '', ['src' => '/vendors/datatables.net/jquery.dataTables.js']) ?>
<?= $this->Html->tag('script', '', ['src' => '/vendors/datatables.net-bs5/dataTables.bootstrap5.js']) ?>
<?= $this->Html->tag('script', '', ['src' => '/js/dataTables.select.min.js']) ?>

</body>
</html>
