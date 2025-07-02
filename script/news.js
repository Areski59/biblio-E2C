let trigger = document.querySelector("#news-trigger");
let aside = document.querySelector("aside");
let close = document.querySelector("#close");

function showNews() {
    aside.style.right = "20px";
    trigger.style.opacity = "0";
}

function hideNews() {
/* remettre éléments de style aux valeurs de départ*/
    aside.style.right = "-33%";
    trigger.style.opacity = "1";
}

trigger.addEventListener("click" , showNews);
/* croix detecte click et déclenche la fonction hideNews*/
close.addEventListener("click" , hideNews);