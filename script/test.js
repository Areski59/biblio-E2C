let targetNumber = 45231;

let userNumber = prompt("Devinez un nombre entre 0 et 50000 .");

while(userNumber != targetNumber) {
        if(userNumber > targetNumber) {
        alert(`Trop grand`);
    } else {
        alert(`Trop petit`);
    }

    userNumber = prompt("Devinez un nombre entre 0 et 50000 .");
}

alert("Tié un tigre.");








/*let firstname = prompt("Quel est votre prénom ?");
let lastname = prompt("Quel est votre nom ?");

alert(`Bonjour ${firstname} ${lastname}!`);
*/
