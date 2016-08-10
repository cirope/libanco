module Customers::GeneratePdf
  extend ActiveSupport::Concern

  included do
    after_action :generate_pdf, only: [:create, :update]
  end

  private

    def generate_pdf
      if @customer.persisted? && !@customer.errors.any?
        render pdf: "solicitud_#{@customer.identification}",
          margin: { top: 20, bottom: 0 },
          header: { right: render_to_string(template: 'customers/pdf-header.pdf.erb') },
          template: 'customers/show.pdf.erb',
          save_to_file: CUSTOMERS_PDF_PATH.join("solicitud_#{@customer.identification}.pdf"),
          save_only: true
        end
    end
end
