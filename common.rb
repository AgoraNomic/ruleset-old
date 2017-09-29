def word_wrap(text, options = {})
  line_width = options.fetch(:line_width, 70)
  indent = options.fetch(:indent, 0)

  text.split("\n").collect! do |line|
    line.length > line_width ? line.gsub(/((^.{0,#{indent}})?.{1,#{line_width - indent}})(\s+|$)/, "\\1\n"+" "*indent).strip : line
  end * "\n"
end

# TODO: Remove this fully.
def get_history(rule)
	rule.history
end

def get_rev(rule)
	rule.rev
end
