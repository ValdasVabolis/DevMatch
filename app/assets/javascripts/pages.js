/* global $ */

// Fade out alerts after 1 second
$(document).on('turbolinks:load', function() {
  $('.alert').delay(1000).fadeOut(4000);
})