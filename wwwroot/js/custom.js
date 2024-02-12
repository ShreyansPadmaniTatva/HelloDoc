function mode() {
    var body = document.body;
    var currentTheme = body.getAttribute('data-bs-theme');

    var newTheme = currentTheme === 'light' ? 'dark' : 'light';

    body.setAttribute('data-bs-theme', newTheme);

    console.log(body.getAttribute('data-bs-theme'));
}




$(document).ready(function () {
  $('#staticBackdrop').modal('show');
});


const x = document.getElementById("map");

function getLocation() {
  if (navigator.geolocation) {
    console.log(51);
    navigator.geolocation.watchPosition(showPosition);
    console.log(51545);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
}
