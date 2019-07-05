$(".selectize").selectize({
  create: function(input, callback) {
    callback({ value: input, text: input });
  }
});
