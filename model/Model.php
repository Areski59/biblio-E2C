<?php

class Model {
    //définir propriété
    private PDO $bdd; 
    //constructeur
    public function __construct()
    {
        try{$this->bdd = new PDO('mysql:host=localhost;dbname=pn_livres;charset=utf8','zongoledozo@localhost','Ijhgfdrfgh656562_');

        }catch(Exception $e) {
            $message = "Connexion impossible - réessayez ultérieurement";
            header("location: ../controller/homeController.php?message=$message");
        }
        
    }
    
    public function getAllBooks() {
        //on écrit la requête SQL dans une variable
        $sql = "SELECT * FROM book_vw";
        //on applique cette requête sql dans une variable aussi (cette ligne ne change jamais)
        $query = $this->bdd->prepare($sql);
        //on exécute la requête
        $query->execute([]);
        //on récupère les résultats dans une variable : 2 options fetch ou fetchAll
        $result = $query->fetchAll();
        //retournant le résultat
        return $result;
    }

    public function getUserByEmail($email) {
         //on écrit la requête SQL dans une variable
        $sql = "SELECT id, mail, mdp, user_name FROM user WHERE mail = :email";
        //on applique cette requête sql dans une variable aussi (cette ligne ne change jamais)
        $query = $this->bdd->prepare($sql);
        //on exécute la requête
        $query->execute([
            "email" => $email
        ]);
        //on récupère les résultats dans une variable : 2 options fetch ou fetchAll
        $result = $query->fetch();
        //retournant le résultat
        return $result;

    }
    //Définir méthodes
}