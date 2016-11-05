require 'terminal-table'

#the printer packages the formatting of tables using an estate

class Printer


  def join_estate(estate)
    if estate[1].length == 12
      estate.join(" due date  ")
    else
      estate.join(" due date ")
    end
  end

  def print(date, estate_array)
    rows = []
    estates = estate_array.map  do |estate|
        if rows.any?
          rows << ["", join_estate(estate)]
        else
          rows << [date, join_estate(estate)]
        end
    end
    create_table(rows)
  end

  private

  def create_table(rows)
    table = Terminal::Table.new do |t|
      t.rows = rows
      t.headings = ['Date', 'Reminders']
    end
    puts table
  end


end
