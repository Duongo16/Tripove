const departureResultsBox = document.querySelector(".departure-result-box");
const departureInputBox = document.getElementById("departure-input-box");
const departureBox = document.getElementById("departure-box");
const arrivalResultsBox = document.querySelector(".arrival-result-box");
const arrivalInputBox = document.getElementById("arrival-input-box");
const arrivalBox = document.getElementById("arrival-box");
const allLocationElements = document.querySelectorAll("#all-location li");
const allLocation = Array.from(allLocationElements).map(li => li.textContent);

function handleKeyUp(inputBox, resultsBox) {
    let result = [];
    let input = inputBox.value;
    if (input.length) {
        result = allLocation.filter((keyword) => {
            return keyword.toLowerCase().includes(input.toLowerCase());
        });
    }
    const content = result.map((list) => {
        return "<li onclick='selectInput(\"" + inputBox.id + "\", \"" + list + "\")'>" + list + "</li>";
    }).join("");

    resultsBox.innerHTML = "<ul>" + content + "</ul>";
}


function selectInput(inputBoxId, value) {
    document.getElementById(inputBoxId).value = value;
    document.getElementById(inputBoxId).nextElementSibling.innerHTML = '';
}

departureInputBox.onkeyup = function () {
    handleKeyUp(departureInputBox, departureResultsBox);
};

arrivalInputBox.onkeyup = function () {
    handleKeyUp(arrivalInputBox, arrivalResultsBox);
};

departureBox.addEventListener('blur', function () {
    departureResultsBox.innerHTML = '';
});

arrivalBox.addEventListener('blur', function () {
    arrivalResultsBox.innerHTML = '';
});

