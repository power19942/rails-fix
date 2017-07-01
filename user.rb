require 'json'

class User
  attr_accessor :name,:email,:perm
  def initialize(*args)
    @name = args[0]
    @email = args[1]
    @perm = User.perm_from_template
  end

  def self.perm_from_template
    file = File.read 'perm_template.json'
    JSON.load(file,nil,sympolize_names: true)
  end

  def save
    self_json = {email:@email,name:@name,perm:@perm}.to_json
    open('users.json','a') do |file|
      file.puts self_json
    end
  end

end