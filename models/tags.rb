require_relative('../db/sqlrunner.rb')

class Tag

  def initialize(options)
    @id = options['id']to_i if options['id']
    @name = options['name']
  end

end
