class DatePickerInput < SimpleForm::Inputs::Base
  def input_html_classes
    super.push("datepicker")
  end

  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    @builder.text_field(attribute_name, merged_input_options).to_s.html_safe
  end
end
