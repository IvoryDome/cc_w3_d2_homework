require ('PG')

class Bounty

  attr_accessor :name, :species, :bounty_value, :danger_level
  attr_reader :id
  
  def initialize(options)
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @danger_level = options['danger_level']
    @id = options['id']
  end


  def Bounty.return_all_bounties
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql ="
    SELECT * FROM bounties ORDER BY id
    ;
    "

    db.prepare("display all", sql)
    bounties = db.exec_prepared("display all")

    db.close()

    list_of_all_bounties = bounties.map {|bounties| Bounty.new(bounties)}

    return list_of_all_bounties
  end


  def save
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    INSERT INTO bounties
    (name, species, bounty_value, danger_level)
    VALUES
    ($1,$2,$3,$4)
    ;
    "
    values = [@name, @species, @bounty_value, @danger_level]

    db.prepare("save it", sql)
    db.exec_prepared("save it", values)

    db.close()
  end

  def update
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    UPDATE bounties
    SET (name, species, bounty_value, danger_level)
    = ($1,$2,$3,$4)
    WHERE
    id = $5
    ;
    "
    values = [@name, @species, @bounty_value, @danger_level, @id]

    db.prepare("update", sql)
    db.exec_prepared("update", values)

    db.close()
  end



  def delete
    db = PG.connect({dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    DELETE FROM bounties
    WHERE id = ($1)
    ;
    "

    values = [@id]

    db.prepare("delete", sql)
    db.exec_prepared("delete", values)

    db.close()
  end


end
