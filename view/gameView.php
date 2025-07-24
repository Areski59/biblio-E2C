<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliothèque E2C</title>
    <link rel="stylesheet" href="../style/style.css">
    <link rel="icon" href="../src/logo.png">
</head>
<body>
    <!-- Zone du menu, en hau de la page-->    
    <nav>

        <img id="logo" src="../src/logo2.png" alt="logo E2C">
        <div id="nav-bar">
        <a class="nav-button" href="../index.htm">Accueil</a>
        <a class="nav-button" href="../pages/library.htm">Bibliothèque</a>
        <a class="nav-button" href="../pages/game.htm">Détente</a>
        </div>

    </nav>  

    <?php
        require_once("../view/partials/_header.php")
    ?>
    <!-- En tête stylée-->  
     
     <div id="main-game">
        <div id="user-interface">
            <div>
                <label for="user-number">Entrez un nombre entre 1 et 100</label>
                <input id="user-number" type="number" name="user-number" placeholder="Ecrivez votre nombre ici." min="1" max="100">
            </div>
            <input id="send-button" type="submit" value="Proposer">


        </div>
        <div id="game-display">


        </div>
     </div>

</body>
<script src="../script/test.js"></script>
</html>