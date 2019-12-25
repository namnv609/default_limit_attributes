# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = "default_limit_attributes"
  spec.version = "0.0.1"
  spec.authors = ["NamNV609"]
  spec.email = ["namnv609@gmail.com"]
  spec.description = "DefaultLimitAttributes class will add validation of max length for all ActiveRecord\
    model attributes automatically which base on size of fields in database"
  spec.summary = "Add validation of max length for all ActiveRecord attributes"
  spec.license = "MIT"
  spec.homepage = "https://github.com/namnv609/default_limit_attributes"

  spec.files = Dir["{lib}/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activemodel", ">= 3.0", "< 7.0"

  spec.required_ruby_version = ">= 1.9.3"
end
