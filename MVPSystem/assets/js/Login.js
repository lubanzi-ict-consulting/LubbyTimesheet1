// Add an event listener for form submission
document.getElementById('form1').addEventListener('submit', function (event) {
    // Add the 'was-validated' class to the form
    this.classList.add('was-validated');

    // Validate the form
    if (!this.checkValidity()) {
        // If the form is not valid, prevent submission
        event.preventDefault();
        event.stopPropagation();
    }
});
