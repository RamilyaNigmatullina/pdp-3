const SUBSCRIBER_FORM_SELECTOR = ".js-subscriber-form";
const SUBSCRIBER_EMAIL_INPUT_SELECTOR = "#subscriber_email";

class Subscriber {
  constructor(formSelector) {
    this.emailInput =  $(SUBSCRIBER_EMAIL_INPUT_SELECTOR, this.formSelector);
    $(formSelector).on ("ajax:success", this.clearInput.bind());
    $(formSelector).on ("ajax:error", this.clearInput.bind());
  }

  clearInput(event, data) {
    $("html, body").animate({ scrollTop: 0 }, "fast");
    this.emailInput.val("");
  };
}

new Subscriber(SUBSCRIBER_FORM_SELECTOR);
