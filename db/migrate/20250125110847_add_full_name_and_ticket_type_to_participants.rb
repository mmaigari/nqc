class AddFullNameAndTicketTypeToParticipants < ActiveRecord::Migration[8.0]
  def change
    add_column :participants, :full_name, :string
    add_column :participants, :ticket_type, :string
  end
end
