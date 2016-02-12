require_relative 'code_context'

module Reek
  module Context
    #
    # A context wrapper for attribute definitions found in a syntax tree.
    #
    # :reek:Attribute
    class AttributeContext < CodeContext
      attr_accessor :visibility

      def initialize(context, exp, send_expression)
        @visibility = :public
        @send_expression = send_expression
        super context, exp
      end

      def full_comment
        send_expression.full_comment || ''
      end

      def instance_method?
        true
      end

      def apply_current_visibility(current_visibility)
        self.visibility = current_visibility
      end

      private

      attr_reader :send_expression
    end
  end
end
