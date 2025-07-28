<?php
    $pageTitle = "Espace détente";
    $pageSubtitle = "Je kiff le JavaScript";
    $navList = [
        [
            "label" => "Accueil",
            "path" => "../controller/homeController.php"
        ],
        [
            "label" => "Bibliothèque",
            "path" => "../controller/libraryController.php"
        ]

        

    ];
        //var_dump(($navList));
    $navList[] = [
        "label" => "Connecter",
        "path" => "#"
    ];

    require_once("../view/gameView.php")
?>

