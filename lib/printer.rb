require 'terminal-table'

#the printer packages the formatting of tables using an estate

class Printer

  def print(date, estate_array)
    rows = []
    estates = estate_array.map  do |estate|
    check_for_existing_rows(date, estate, rows)
    end
    puts create_table(rows)
  end

  private

  def check_for_existing_rows(date, estate, rows)
    if rows.any?
      rows << ["", join_estate(estate)]
    else
      rows << [date, join_estate(estate)]
    end
  end

  def join_estate(estate)
    if estate[1].length > 1
      if estate[1].length == 12
        estate.join(" due date  ")
      else
        estate.join(" due date ")
      end
      else "(no reminders)"
    end
  end

  def size_of_estate(estate)

  end

  def create_table(rows)
    table = Terminal::Table.new do |t|
      t.rows = rows
      t.headings = ['Date', 'Reminders']
    end
    table
  end


end
