module ApplicationHelper
  def html_diff first, second
    Differ.format = :html
    Differ.diff_by_word(first, second).to_s.html_safe
  end

  def hide_passwords data
    data.gsub!(/(password|initial_password):.*\n/, '\1: ***' + "\n") unless data.nil?

    data
  end

  def apipie_include_javascripts
    %w[  bundled/prettify.js
          apipie.js ].map do |file|
      "<script type='text/javascript' src='#{Apipie.full_url("javascripts/#{file}")}'></script>"
    end.join("\n").html_safe
  end

  def apipie_include_stylesheets
    %w[
          bundled/prettify.css
          ].map do |file|
      "<link type='text/css' rel='stylesheet' href='#{Apipie.full_url("stylesheets/#{file}")}'/>"
    end.join("\n").html_safe
  end

  def link_to_submit(text, id='', alt='')
    link_to_function text, "$(this).closest('form').submit()", { :class=>'_tooltip', :id=>id, 'data-original-title'=>alt}
  end

  def icon_2x(name)
    if is_mobile_device?
      return "<i class='icon-#{name} icon-2-5x'></i>".html_safe
    else
      return "<i class='icon-#{name} icon-2x'></i>".html_safe
    end

  end
  def icon_1_5x(name)
    if is_mobile_device?
      return "<i class='icon-#{name} icon-2x'></i>".html_safe
    else
      return "<i class='icon-#{name} icon-1-5x'></i>".html_safe
    end
  end
  def icon(name)
    "<i class='icon-#{name}'></i>".html_safe
  end
  def icon_large(name)
    "<i class='icon-#{name} icon-large'></i>".html_safe
  end
end
