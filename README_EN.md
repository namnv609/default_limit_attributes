# Default Limit Attributes

## Introduce

Normally, we are only usually interested in some certain validation for attributes such as `presence`, `uniqueness`, ... Or simplier, there is only validation for the max length of some attributes such as phone number. Example:

```ruby
validates :phone_number, length: {in: 10..11}
```

Many times, we don't take care to writing validation of max length for attributes such as name, email, ... Leading to the fact that when the tester enters more than the number of characters of MySQL (or other RDMS) allows input on this field. There will be appeared HTTP error 500 (Internal server error - affecting to user experience and messing up the log when debuging). But writing all these validates for attributes in the project is so unhappy :D! Thus, I have written this simple gem.

The purpose of this gem is very simple. As before the model performs to validations, it will take all of attributes in this model and checking them. If the attribute has data type is string (in MySQL) and don't have one of the following validates: `maximum`,` in`, `is`,` within` (i.e. this attribute has been forgotten validation. Leading to over characters input error), they will be added the `maximum` validation equal to limit of this field in MySQL.


## Installation and Usage

Add this to your `Gemfile`

```ruby
gem 'default_limit_attributes'
```

and run the bundle install command.

```
bundle install
```


after installation is completed, you can use it following 2 ways below:

### Add for all models in Project

Add this line into the file `app/models/application_record.rb`

```ruby
class ApplicationRecord < ActiveRecord::Base
  # ...
  default_limit_attributes
  # ...
end

```

### Add for some certain models

Add this line into certain models

```ruby
# app/models/model_name.rb
class ModelName < ApplicationRecord
  # ...
  default_limit_attributes
  # ...
end
```

## Issues and Contributors

If you find a bug or have an idea for improve this gem, please add an [issue on GitHub](https://github.com/namnv609/default_limit_attributes/issues) or fork the project and send a pull request.
