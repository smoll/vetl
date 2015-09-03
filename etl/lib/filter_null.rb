class FilterNull
  def initialize(column:)
    # Columns are indexed as symbols not strings!
    @column = column.to_sym
  end

  def process(row)
    # Don't pass the row through the pipe if the value on the column is NULL
    row[@column].nil? ? nil : row
  end
end
