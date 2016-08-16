class CustomTemplates::GeneratesController < ApplicationController
  include Authentication
  include Title

  before_action :set_customer, :set_custom_template, :set_tmp_template

  def show
    pdf = WickedPdf.new.pdf_from_string(
      @tmp_template.body_string, @tmp_template.render_options
    )

    send_data pdf, filename: "#{@custom_template.name}_#{@customer.identification}",
      disposition: 'inline', type: 'application/pdf'
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end

    def set_custom_template
      @custom_template = CustomTemplate.find params[:custom_template_id]
    end

    def set_tmp_template
      @tmp_template = TmpTemplate.new @customer, @custom_template
    end
end
