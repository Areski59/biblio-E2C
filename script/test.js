/*let targetNumber = 45231;

let userNumber = prompt("Devinez un nombre entre 0 et 50000.");

while(userNumber != targetNumber) {
        if(userNumber > targetNumber) {
        alert(`Trop grand`);
    } else {
        alert(`Trop petit`);
    }

    userNumber = prompt("Devinez un nombre entre 0 et 50000 .");
}

alert("Tié un tigre.");




let firstname = prompt("Quel est votre prénom ?");
let lastname = prompt("Quel est votre nom ?");

alert(`Bonjour ${firstname} ${lastname}!`);
*/

let trigger = document.querySelector('#send-button');
let numberZone = document.querySelector('#user-number');
let displayZone = document.querySelector('#game-display');

let targetNumber = Math.floor(Math.random()*100)+1;

console.log(trigger, numberZone, displayZone, targetNumber);

function compareNumber() {
    //console.log("ça marche");
    let userNumber = numberZone.value;
    let result;
    //console.log(userNumber);
    if(userNumber == targetNumber) {
        result = "Gagné !"
    } else if(userNumber > targetNumber) {
        result = "Trop grand...";
    } else {
        result = "Trop petit...";
    }

    let resultZone = document.createElement('p');
    resultZone.innerHTML = result;
    resultZone.style.padding = "10px";
    resultZone.classList.add('result-line');
    //console.log(resultZone)
    displayZone.appendChild(resultZone);
}

trigger.addEventListener('click', compareNumber);