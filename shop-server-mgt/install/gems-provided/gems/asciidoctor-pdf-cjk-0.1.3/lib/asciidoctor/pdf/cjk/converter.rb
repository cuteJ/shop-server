module Asciidoctor
  module Pdf
    class Converter
      def typeset_text_with_break_words(string, line_metrics, opts = {})
        typeset_text_without_break_words ::Asciidoctor::Pdf::Cjk.break_words(string), line_metrics, opts
      end
      alias_method :typeset_text_without_break_words, :typeset_text
      alias_method :typeset_text, :typeset_text_with_break_words
    end
  end
end
