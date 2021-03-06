/* global $, Stripe */
// Document ready
$(document).on('turbolinks:load', function() {
  var theForm = $('#pro_form');
  var submitBtn = $('#form-signup-btn');
  // Set stripe public key
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  // When user clicks form submit btn
  submitBtn.click(function() {
    console.log("CLICKY BOYE");
    // prevent default submission behavior
    event.preventDefault();
    submitBtn.val("Processing").prop('disabled', true);
    // Collect the credit card fields
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
    
    // Use Stripe JS library to check for card errors
    var error = false;
    // Validate card number
    if(!Stripe.card.validateCardNumber(ccNum)) {
      error = true;
      alert('Invalid credit card number');
    }
    // Validate CVC number
    if(!Stripe.card.validateCVC(cvcNum)) {
      error = true;
      alert('Invalid CVC number');
    }
    // Validate expiration date
    if(!Stripe.card.validateExpiry(expMonth, expYear)) {
      error = true;
      alert('Invalid expiration date');
    }
    if(error) {
      // If there are card errors, don't send to Stripe
      // Re-enable the button
      submitBtn.prop('disabled', false).val("Sign up");
    } else {
      // Send the card info to Stripe
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    }
    // Exit out of the function
    return false;
  });
  // Stripe will return a card token
  function stripeResponseHandler(status, response) {
    // Get the token from the response
    var token = response.id;
    // Inject card token as hidden field into form
    theForm.append($('<input type="hidden" name="user[stripe_card_token]">').val(token));
    // Submit form to our Rails app
    theForm.get(0).submit();
  }
  
  
});

