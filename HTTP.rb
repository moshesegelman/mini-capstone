require "http"
require"tty-table"

response = HTTP.get("http://localhost:3000/api/products")

response.parse[0][name:]
table = TTY::Table.new [response.parse[0][:name],response.parse[1][:name]], [[response.parse[0][:price], response.parse[1][:price]], [response.parse[0][:description], response.parse[1][:description]]]

table.render