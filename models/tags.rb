require_relative('../db/sqlrunner.rb')

class Tag

  attr_reader(:name, :id)

  def initialize(options)
    @id = options['id']to_i if options['id']
    @name = options['name']
  end

  def save()
  sql = "INSERT INTO tags
  (name)
  VALUES
  ($1)
  RETURNING *"
  values = [@name]
  tag_data = SqlRunner.run(sql, values)
  @id = tag_data.first()['id'].to_i
end

end
