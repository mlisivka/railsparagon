module ApplicationHelper
  
  def locale_swither(languages)
    languages.map do |element|
      country = if element == "en"
        "English"
      elsif element == "uk"
        "Українська"
      elsif element == "ru"
        "Русский"
      end
      "<li>"+(link_to "#{country}", "?locale=#{element}")+"</li>"
    end.join.html_safe
  end
  
end
