<nav>

        <img id="logo" src="../src/logo2.png" alt="logo E2C">
        <div id="nav-bar">
            <?php
                foreach($navList as $navButton) {
                ?>
                <a class="nav-button" href=<?= $navButton["path"]?>><?=$navButton["path"]?></a>
            <?php
            }
            ?>
        </div>

    </nav>