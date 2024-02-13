function mode() {
    var body = document.body;
    var currentTheme = body.getAttribute('data-bs-theme');

    var newTheme = currentTheme === 'light' ? 'dark' : 'light';

    body.setAttribute('data-bs-theme', newTheme);

    console.log(body.getAttribute('data-bs-theme'));
}

$(function () {
    $("form").on("change", ".file-upload-field", function () {
        $(this).parent(".file-upload-wrapper").attr("data-text", $(this).val().replace(/.*(\/|\\)/, ''));
    });
    $("form").submit(function () {
        var full_number = phoneInput.getNumber(intlTelInputUtils.numberFormat.E164);
        $("input[name='PhoneNumber']").val(full_number);

    });
});


const phoneInputField = document.querySelector("#phone");
const phoneInput = window.intlTelInput(phoneInputField, {
    separateDialCode: true,
    hiddenInput: "full",
    preferredCountries: ["us", "co", "in", "de"],
    utilsScript:
        "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
});
const phoneInputField1 = document.querySelector("#phone1");
const phoneInput1 = window.intlTelInput(phoneInputField1, {
    separateDialCode: true,
    hiddenInput: "full",
    preferredCountries: ["us", "co", "in", "de"],
    utilsScript:
        "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
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
