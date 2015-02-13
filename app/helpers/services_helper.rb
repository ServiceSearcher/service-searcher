module ServicesHelper

  def truncate_text(text)
    cap = 144
    return text if !text || text.length < cap + 3 || text.include?('<script')
    "#{text[0..cap]}<span class='hidden'>#{text[cap+1..-1]}</span><span class='text-expand'>...</span>".html_safe
  end

  def html_break(text)
    text.gsub("\n", '<br>').html_safe
  end

  def search_query(service)
    name = service.name.gsub(/[?.,&#!\[\]\{\}]/,'').gsub(/[ \/-]/,'+') if service.name
    address = service.address.gsub(/[?.,&#!\[\]\{\}]/,'').gsub(/[ \/-]/,'+') if service.address
    "#{name}+#{address}"
  end

  def api_key
    ENV['GOOGLE_API_KEY']
  end
end
