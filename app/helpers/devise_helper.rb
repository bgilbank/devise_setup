module DeviseHelper
  
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="">
       <div class="alert alert-secondary alert-dismissible fade show" role="alert">
         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="alert-heading">#{sentence}</h4>#{sentence}
        <ul>#{messages}</ul>
      </div>
      </div>
    HTML

    html.html_safe
  end

    def devise_error_messages2!
      return "" if @user.errors.empty?

    messages = @user.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: @user.errors.count,
                      resource: @user.class.model_name.human.downcase)

    html = <<-HTML
    <div id="">
       <div class="alert alert-secondary alert-dismissible fade show" role="alert">
         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="alert-heading">#{sentence}</h4>#{sentence}
        <ul>#{messages}</ul>
      </div>
      </div>
    HTML

    html.html_safe
  end
end

