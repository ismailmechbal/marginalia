module ApplicationHelper
  def is_guest?
    ! session[:guest_user_id].nil?
  end

  def is_admin?
    current_or_guest_user.is_admin
  end

  def markdown
    text = capture do
      yield
    end
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(text).html_safe
  end

end
