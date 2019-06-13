require'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
      sql = <<-SQL
      SELECT * FROM pokemon WHERE pokemon.id = ?
      SQL
      record = db.execute(sql, id)

      bob = Pokemon.new(db)
      bob.id = id
      bob.name = record[0][1]
      bob.type = record[0][2]

      bob
    end

end
