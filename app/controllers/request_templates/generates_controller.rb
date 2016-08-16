class RequestTemplates::GeneratesController < ApplicationController

  before_action :set_customer, :set_request_template, :set_customer_template, :set_options

  def show
    pdf = WickedPdf.new.pdf_from_string(@customer_template.render, @options)
    pdf_file_name = "#{@request_template.name}_#{@customer.identification}"

    send_data pdf, filename: pdf_file_name, disposition: 'inline', type: 'application/pdf'
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end

    def set_request_template
      @request_template = RequestTemplate.find params[:request_template_id]
    end

		def set_customer_template
      @customer_template = CustomerTemplate.new @customer, @request_template
    end

    def set_options
      @options = { encoding: 'UTF-8' }

      if @request_template
        @options[:footer] = {
          content: @request_template.footer_template.content
        }
      end
    end
end
