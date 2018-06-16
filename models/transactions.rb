require_relative('../db/sqlrunner.rb')

class Transaction

  attr_reader(:merchant_id, :tag_id, :amount, :id)

  def initialize(options)
    @id = options['id']to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@merchant_id, @tag_id, @amount]
    transaction_data = SqlRunner.run(sql, values)
    @id = transaction_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end





end