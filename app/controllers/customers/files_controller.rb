class Customers::FilesController < ApplicationController
  include Authentication
  include Title

  before_action :set_customer

  def show
    render pdf: "solicitud_de_ingreso_#{@customer.identification}",
      margin: { top: 30, bottom: 10 },
      header: { html: { template: 'customers/files/pdf-header.pdf.erb' }, spacing: 10 },
      footer: { html: { template: 'customers/files/pdf-footer.html' } },
      template: 'customers/files/show.pdf.erb'
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end
end
