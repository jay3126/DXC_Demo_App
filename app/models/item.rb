class Item < ApplicationRecord
  validates_presence_of :name

  def self.to_csv
    attributes = %w{id name quantity}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.find_each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end

  def self.to_xlsx
    wb = xlsx_package.workbook

    wb.styles do |style|
      project_heading = style.add_style(b: true, sz: 14)
      heading = style.add_style(b: true)

      wb.add_worksheet(name: "Items") do |sheet|
        # Add a title row
        sheet.add_row ["Inventory Items"], style: project_heading
        # Add the date this was downloaded
        sheet.add_row ["Downloaded at", Time.now.strftime("%b %-d, %Y")]
        # Add a blank row
        sheet.add_row []
        # Create the header row
        sheet.add_row ["ID", "Item Name", "Quantity"], style: heading
        # Create the database reference row
        sheet.add_row ["id", "name", "quantity"], style: heading
        # Create entries for each item
        @items.each do |item|
          sheet.add_row [item.id, item.name, item.quantity]
        end
      end
    end
  end
end