class Dog

  def initialize(id, name, breed)
    @id = id
    @name = name
    @breed = breed
  end

def self.create_table
  sql = <<-SQL
  CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY
    name TEXT
    breed TEXT
  )
  SQL
DB[:conn].execute(sql)
end

def self.drop_table
  sql = "DROP TABLE IF EXISTS dogs"
  DB[:conn].execute(sql)
end

def self.new_from_db(row)
  self.id = row[0]
  self.name = row[1]
  self.breed = row[2]
  self.new(id: id, name: name, breed: breed)
end

def self.find_by_name(name)
  sql = <<- SQL
  SELECT *
  FROM dogs
  WHERE name = ?
  LIMIT  1
end

def update
  sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
  DB[:conn].execute(sql, self.name, self.breed, self.id)
  end
end

end
