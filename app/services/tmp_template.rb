class TmpTemplate

  def initialize templatable, custom_template
    @renderer = ApplicationController.renderer
    @templatable = templatable
    @custom_template = custom_template
    @options = { margin: { top: 20 } }

    create_tmps
  end

  def body_string
    @body_string
  end

  def render_options
    @options
  end

  private

    def create_tmps
      set_tmp_body
      set_tmp_header
      set_tmp_footer
    end

    def set_tmp_body
      body_template = case @custom_template.kind
        when 'Customer' then CustomerTemplate.new(@templatable, @custom_template.content).render
        when 'CashMemberPayment' then CashMemberPaymentTemplate.new(@templatable, @custom_template.content).render
      end
      tmp = create_tmp 'body_tmp_template', body_template
      @body_string = @renderer.render(file: tmp.path, layout: 'pdf.html.erb')
      tmp.unlink
    end

    def set_tmp_header
      if ht = @custom_template.header_template
        @options[:header] = {
          content: @renderer.render('header_templates/header_template', layout: 'pdf.html.erb', locals: { ht: ht })
        }
      end
    end

    def set_tmp_footer
      if ft = @custom_template.footer_template
        tmp = create_tmp 'footer_tmp_template', ft.content
        @options[:footer] = { content: @renderer.render(file: tmp.path, layout: 'pdf.html.erb') }
        tmp.unlink
      end
    end

    def create_tmp filename, content
      tmp_template = Tempfile.new [filename, '.html']
      tmp_template.binmode
      tmp_template.write content
      tmp_template.close
      tmp_template
    end
end
