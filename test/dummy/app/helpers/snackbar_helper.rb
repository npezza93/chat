# frozen_string_literal: true

module SnackbarHelper
  def snackbar_notice(message, opts = nil)
    return if message.blank?

    content_tag(
      :div, snackbar_text(message),
      class: "mdc-snackbar #{opts}",
      aria: { live: :assertive, atomic: "", hidden: "" }
    )
  end

  def snackbar_text(message)
    content_tag(:div, message, class: "mdc-snackbar__text") + snackbar_button
  end

  def snackbar_button
    content_tag(:div, class: "mdc-snackbar__action-wrapper") do
      content_tag(
        :button, nil,
        class: "mdc-button mdc-snackbar__action-button", type: :button
      )
    end.html_safe
  end
end
