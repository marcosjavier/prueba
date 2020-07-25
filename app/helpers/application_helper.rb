module ApplicationHelper
  def modal_bootstrap(content, opts = {})
    o = {
      title: nil
    }.merge(opts)

    #Contenido para el Encabezado del Modal con titulo y boton Cerrar
    content_header = content_tag :h5, o[:title], class: 'modal-title' if o[:title]
    content_header += content_tag :button, type: 'button', class: 'close', "data-dismiss" =>"modal", "aria-label" => "Close" do
      "X"
    end

    content_body = content_tag :div, class: 'modal-body' do
      content
    end

    #Contenido para el footer con un boton
    content_footer =  content_tag :button, class: 'btn-btn-secondary', "data-dismiss" => "modal" do
      o[:cancel] || t('cancel')
    end

    content_div = content_tag :div, class: 'modal-header' do
      content_header
    end

    content_div += content_body

    content_div += content_tag :div, class: 'modal-footer' do
      content_footer
      
    end

    content_tag :div, class: 'modal fade', role: 'dialog' do
      content_tag :div, class: 'modal-dialog' do
        content_tag :div, class: 'modal-content' do
          content_div
        end
      end
    end

  end

  def modal_bootstrap_service_order(content, opts = {})
    o = {
      title: nil
    }.merge(opts)

    #Contenido para el Encabezado del Modal con titulo y boton Cerrar
    content_header = content_tag :h5, o[:title], class: 'modal-title' if o[:title]
    content_header += content_tag :button, type: 'button', class: 'close', "data-dismiss" =>"modal", "aria-label" => "Close" do
      "X"
    end

    content_body = content_tag :div, class: 'modal-body' do
      content
    end

    #Contenido para el footer con un boton
    #content_footer =  content_tag :button, class: 'btn-btn-secondary', "data-dismiss" => "modal" do
    #  o[:cancel] || t('cancel')
    #end

    content_div = content_tag :div, class: 'modal-header' do
      content_header
    end

    content_div += content_body

    #content_div += content_tag :div, class: 'modal-footer' do
    #  content_footer
    #end

    content_tag :div, class: 'modal fade modal-lg', role: 'dialog' do
      content_tag :div, class: 'modal-dialog modal-lg' do
        content_tag :div, class: 'modal-content' do
          content_div
        end
      end
    end

  end

  def full_title(page_title = '')
    base_title = 'Ruby on Rails Prueba'
    if page_title.empty?
      base_title      
    else
      "#{page_title} | #{base_title}"
    end
    
  end
end
