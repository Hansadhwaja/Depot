class User < ApplicationRecord
  has_secure_password
end

after_destroy :ensure_an_admin_remains

class Error < StandardError

end

private
  def ensure_an_admin_remains
    if User.count.zero?
    raise Error.new "Can't delete last user"
  end