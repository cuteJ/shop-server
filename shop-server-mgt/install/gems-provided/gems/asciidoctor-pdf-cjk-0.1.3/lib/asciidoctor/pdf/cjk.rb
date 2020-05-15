# encoding: utf-8

require "asciidoctor-pdf"
require "asciidoctor/pdf/cjk/version"
require "asciidoctor/pdf/cjk/converter"

module Asciidoctor
  module Pdf
    module Cjk
      def self.break_words(string)
        string.gsub(/(?<!^|\p{Space}|\p{Ps}|\p{Pi})[\p{Han}\p{Hiragana}\p{Katakana}\p{Ps}\p{Pi}]/) {|s| "#{::Prawn::Text::ZWSP}#{s}"}
      end
    end
  end
end
