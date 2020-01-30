# frozen_string_literal: true

class Blog < ApplicationRecord
  # We want the steps to be ordered by step number, and not the internal id of
  # the record.
  default_scope { order('initial_posting DESC') }

  after_find :fmt

  private

    def fmt
      @formatter = get_formatter(:markdown)
      self.post = @formatter.render(self.post)
    end

    def get_formatter(type)
      case type
        when :markdown
          @formatter = MarkdownFormatter.new
        else
          @formatter = MarkdownFormatter.new
      end
    end
end
