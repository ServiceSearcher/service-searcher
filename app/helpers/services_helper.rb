module ServicesHelper

  def truncate_text(text)
    cap = 144
    return text if !text || text.length < cap + 3 || text.include?('<script>')
    raw "#{text[0..cap]}<span class='hidden'>#{text[cap+1..-1]}</span><span class='text-expand'>...</span>"
  end

  def html_break(text)
    raw text.gsub("\n", '<br>')
  end
end
