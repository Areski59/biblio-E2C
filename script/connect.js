let navButtons = document.querySelectorAll(".nav-button");
let connectBox = document.querySelector("#connect-box");

function showConnectBox() {
    connectBox.style.display = "flex";
}

function hideConnectBox() {
    connectBox.style.display = "none";
}

navButtons.forEach((button)=>{
    if(button.innerHTML == "Connecter") {
        button.addEventListener("click", showConnectBox);
    }
});