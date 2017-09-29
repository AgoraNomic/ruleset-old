require 'yaml'

def lint_all_rules_indexed
  rule_names = Dir.entries('data/rules').reject { |x| x.include? '.' }.sort
  indexed_names = YAML.load_file('data/index').values.flatten.sort
  rule_names == indexed_names
end

def lint_no_placeholders
  `ag _HERE data` == ''
end

LINTS = [
  :lint_all_rules_indexed,
  :lint_no_placeholders
]

LINTS.each do |lint|
  success = self.send(lint)
  unless success
    puts "LINT FAILED: #{lint}"
    exit 1
  end
end
