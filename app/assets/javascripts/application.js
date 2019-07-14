// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery2
//= require jquery-ujs
//= require current_user
//= require selectize
//= require turbolinks
//= require rails.validations
//= require rails.validations.simple_form
//= require rails.validations.simple_form.bootstrap4
//= require foundation
//= require_tree ../templates
//= require_tree .

$(document).foundation();

$(document).bind(("turbolinks:load"), function() {
  ClientSideValidations.disableValidators();
  return $(ClientSideValidations.selectors.forms).validate();
});
