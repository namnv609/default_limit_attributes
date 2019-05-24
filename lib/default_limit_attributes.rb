require "active_model"

module ActiveModel::Validations::HelperMethods
  def default_limit_attributes
    before_validation do
      validate_field_types = %i(string)
      except_length_opts = %i(maximum in is within)
      self_class = self.class

      self_class.columns_hash.each do |field, field_opts|
        next unless validate_field_types.include?(field_opts.type)

        is_need_limit = true
        self_class.validators_on(field).each do |validator|
          next unless validator.kind == :length

          if except_length_opts.any?{|len_opt| validator.options.key?(len_opt)}
            is_need_limit = false
            break
          end
        end

        self_class.validates_length_of field, maximum: field_opts.limit if is_need_limit
      end
    end
  end
end
