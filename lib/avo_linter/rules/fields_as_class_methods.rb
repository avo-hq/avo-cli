class AvoLinter::Rules::FieldsAsClassMethods < AvoLinter::Rules::Base
  MESSAGE = "You should not use the `field` method as a class method. Please add it in the `def fields` method or use composition in other methods."

  def apply
    get_class_body.each do |node|
      if node.instance_of?(Prism::CallNode) && node.name == :field
        error_out(
          message:,
          node:,
        )
      end
    end
  end
end
