<?php

class Model {
    /*définir propriété*/
    private PDO $bdd; 
    //constructeur
    public function __construct()
    {
        try{$this->bdd = new PDO('mysql:host=localhost;dbname=pn_livres;charset=utf8','zongoledozo@localhost','Ijhgfdrfgh656562_');

        }catch(Exception $e) {
            echo("connexion impossible =".$e->getMessage());
        }
        
    }
    //Définir méthodes
    
}