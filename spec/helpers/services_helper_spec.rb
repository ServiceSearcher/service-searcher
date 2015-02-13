require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ServicesHelper. For example:
#
# describe ServicesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ServicesHelper, :type => :helper do

  describe '#truncate_text' do
    it 'should return a string unmodified if under 144 characters' do
      text = 'Short string'
      expect(helper.truncate_text(text)).to eq(text)
    end

    it 'should split a string and insert an expand span' do
      text = "I must not fear.
              Fear is the mind-killer.
              Fear is the little-death that brings total obliteration.
              I will face my fear.
              I will permit it to pass over me and through me.
              And when it has gone past I will turn the inner eye to see its path.
              Where the fear has gone there will be nothing....only I will remain"
      first_half = text[0..144]
      second_half = text[145..-1]

      expect(helper.truncate_text(text)).to eq(
        "#{first_half}<span class='hidden'>#{second_half}</span><span class='text-expand'>...</span>"
      )
    end
  end

  describe '#html_break' do
    it 'should turn newline characters into html tags' do
      text = "first line \n second line"
      expect(helper.html_break(text)).to eq('first line <br> second line')
    end

    # it 'should not return raw html containing script tags' do
    #   text = "innocuous html? <script> alert('muahaha, evil malicious script') </script>"
    #   expect(helper.html_break(text)).
    # end
  end
end
