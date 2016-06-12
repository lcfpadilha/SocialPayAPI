var ready, simplifyResponseHandler;

ready = function() {
  return $('#simplify-payment-form').on('submit', function() {
    $('#process-payment-btn').attr({
      disabled: 'disabled'
    });
    SimplifyCommerce.generateToken({
      key: 'sbpb_OTBjNGM1MmItYzljMC00MTA0LTk1OTktZTUyMWJlOTEyYWVl',
      card: {
        number: $('#cc-number').val(),
        cvc: $('#cc-cvc').val(),
        expMonth: $('#cc-exp-month').val(),
        expYear: $('#cc-exp-year').val().slice(-2)
      }
    }, simplifyResponseHandler);
    return false;
  });
};

$(document).ready(ready);

simplifyResponseHandler = function(data) {
  var errorList, f, i, len, paymentForm, ref, token;
  paymentForm = $('#simplify-payment-form');
  $('.error').remove();
  if (data.error) {
    if (data.error.code === 'validation') {
      errorList = '';
      $("#error").show();
      ref = data.error.fieldErrors;
      for (i = 0, len = ref.length; i < len; i++) {
        f = ref[i];
        errorList += "Field " + f.field + " is invalid – " + f.message+"<br>";
      }
      $("#error").html(errorList);
    }
    $('#process-payment-btn').removeAttr('disabled');
  } else {
    console.log(data);
    token = data.card.id;
    paymentForm.append("");
    $('.form-control').val("");
    $('#ckey').val(token);
    console.log(token);
    //paymentForm.get(0).submit();
  }
};
