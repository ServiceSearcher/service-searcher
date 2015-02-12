module ServicesHelper
  def truncate_text(text)
    cap = 144
    return text if !text || text.length < cap + 3
    raw "#{text[0..cap]}<span class='hidden'>#{text[cap+1..-1]}</span><span class='text-expand'>...</span>"
  end
end
