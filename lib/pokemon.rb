class Pokemon
attr_accessor :name, :type, :id, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db) 
       db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
    
    def self.find(pokemon_id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id).flatten
        
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)

    end

end