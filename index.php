<?php
    require_once 'config/config.php';
    require_once 'databases/database.php';

    $session_duration = 100000;
    $session_set_cookie_params($session_duration);

    session_start();

    if(!isset($_SESSION['id'])){
        if( $_GET['controller'] != 'auth' && $_GET['action'] != 'login'){

        }
    }
?>