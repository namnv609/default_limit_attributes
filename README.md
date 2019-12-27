# Default Limit Attributes

## Giới thiệu

Thông thường, chúng ta thường chỉ quan tâm đến một số validates nhất định cho các attributes như `presence`, `uniqueness`, ... Hay đơn giản chỉ là xác định max length cho một số attributes như Số điện thoại kiểu:

```ruby
validates :phone_number, length: {in: 10..11}
```

Không ít lần trong chúng ta không để ý tới việc viết validate max length cho các attributes như name, email, ... Điều này dẫn đến việc khi tester nhập quá số lượng ký tự mà MySQL (hoặc RDMS nào đó) cho phép trên 1 trường. Sẽ xuất hiện lỗi 500 (Internal server error - ảnh hưởng đến trải nghiệm của người dùng và làm rối log khi chúng ta muốn điều tra). Mà việc viết toàn bộ các validate này cho tất các attributes của project cũng không mấy vui vẻ gì cả :D! Do đó mình mới viết một gem đơn giản này.

Mục đích của gem này rất đơn giản. Là trước khi model thực hiện validate, nó sẽ lấy toàn bộ attributes mà model này có. Rồi kiểm tra xem attribute nào có kiểu dữ liệu là string (trong MySQL) và không có một trong các validates sau: `maximum`, `in`, `is`, `within` (tức là các attributes bị bỏ quên, dễ dẫn đến quả lỗi nhập quá ký tự) thì thực hiện thêm validate `maximum` bằng đúng giới hạn của field type đó trong MySQL.

## Cài đặt và sử dụng

Bạn thêm đoạn sau vào `Gemfile`

```ruby
gem 'default_limit_attributes'
```

Rồi thực hiện lệnh

```
bundle install
```

Để thực hiện cài đặt gem. Sau khi cài đặt hoàn thành, bạn có thể sử dụng theo hai cách dưới đây:

### Cho toàn bộ models trong project

Bạn thêm dòng sau vào file `app/models/application_record.rb`

```ruby
class ApplicationRecord < ActiveRecord::Base
  # ...
  default_limit_attributes
  # ...
end

```

### Cho từng model mà bạn muốn

Bạn thêm dòng sau vào các models mà bạn muốn:

```ruby
# app/models/model_name.rb
class ModelName < ApplicationRecord
  # ...
  default_limit_attributes
  # ...
end
```

## Báo lỗi và Đóng góp

Trong quá trình sử dụng gem có phát sinh bug hay có ý tưởng đóng góp thêm hoặc để cải thiện gem thì mọi người vui lòng tạo [Issue](https://github.com/namnv609/default_limit_attributes/issues) giúp mình nhé :smiley:!
