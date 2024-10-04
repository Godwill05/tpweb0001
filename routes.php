<?php
    $controller = isset($_GET['controller'])?$_GET['controller']:'Auth';
    $filecontroller = "controller/{$controller}Controller.php";
    if(file_exists($filecontroller)){
        require_once $filecontroller; 
        $controllerClass = ucfirst($controller)."Controller";
        $controllerObjet = new $controllerClass();

        if($controller == 'Auth'){
            if($action == 'connect'){
                $controllerObject ->login();
            }
        }

    }else {
        echo "Le controleur n'existe pas";
    }
?>