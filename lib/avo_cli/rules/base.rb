class AvoCli::Rules::Base
  attr_reader :contents
  attr_reader :errors

  def initialize(contents:, **)
    @contents = contents
    @errors = []
  end

  def apply_rule
    apply

    self
  end

  def message = self.class::MESSAGE

  private

  def get_class_body
    parsed_contents.value.statements.body.first.body.body
  end

  def parsed_contents
    Prism.parse contents
  end

  def error_out(message)
    @errors << message
  end
end
