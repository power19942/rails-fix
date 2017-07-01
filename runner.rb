require 'pp'
require_relative 'user'

user = User.new('omar','o@o.com')

pp user

user.save