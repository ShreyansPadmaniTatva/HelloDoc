function mode() {
  var body = document.body;
  var currentTheme = body.getAttribute('data-bs-theme');

  var newTheme = currentTheme === 'light' ? 'dark' : 'light';

  body.setAttribute('data-bs-theme', newTheme);

  console.log(body.getAttribute('data-bs-theme'));
}
window.onload = () => {
  // mode();
  getContent();
}
$("form").on("change", ".file-upload-field", function () {
  $(this).parent(".file-upload-wrapper").attr("data-text", $(this).val().replace(/.*(\/|\\)/, ''));
});

const phoneInputField = document.querySelector("#phone");
const phoneInput = window.intlTelInput(phoneInputField, {
  preferredCountries: ["us", "co", "in", "de"],
  utilsScript:
    "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
});

$(document).ready(function () {
  $('#staticBackdrop').modal('show');
});

async function getContent() {
  try {

    // _footer
    const response = await fetch('C_panel/_footer.html');
    if (!response.ok) {
      throw new Error('Failed to fetch content');
    }
    const data = await response.text();
    document.getElementById('_footer').innerHTML = data;

    // _header
    const response1 = await fetch('C_panel/_header.html');
    if (!response1.ok) {
      throw new Error('Failed to fetch content');
    }
    const data1 = await response1.text();
    document.getElementById('_header').innerHTML = data1;

  } catch (error) {
    console.error('Error fetching content:', error);
  }
}

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