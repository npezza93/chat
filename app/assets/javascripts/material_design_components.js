/*global mdc $:true*/

$(document).on("turbolinks:load", function() {
  initialize_mdc();
});

function initialize_mdc() {
  mdc.autoInit();

  $.each($(".mdc-textfield"), function(index, element) {
    mdc.textfield.MDCTextfield.attachTo(element);
  });
  $.each($(".mdc-fab, .mdc-button, .mdc-ripple-surface, .mdc-list-item.with-ripple"), function(index, element) {
    mdc.ripple.MDCRipple.attachTo(element);
  });
  $.each($(".mdc-select"), function(index, element) {
    mdc.select.MDCSelect.attachTo(element).listen('MDCSelect:change', function(e) {
      $(this).find("input[type='hidden']").val(e.detail.value);
    });
  });
  $.each($(".mdc-simple-menu"), function(index, element) {
    var menu = mdc.menu.MDCSimpleMenu.attachTo(element);
    $(element).parent().find(".menu-toggle").click(function() {
      menu.open = !menu.open;
    });
  });

  if ($(".mdc-snackbar").length > 0) {
    var snackbar = mdc.snackbar.MDCSnackbar.attachTo($(".mdc-snackbar")[0]);
    snackbar.show({ message: $(".mdc-snackbar").find(".mdc-snackbar__text").text() });
  }
}
