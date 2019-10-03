defmodule Pdelivery.Repo.Migrations.Orders do
  use Ecto.Migration

  def change do
      create table(:orders) do
        add :title, :string
        add :patient_name, :string
        add :patient_address,:text
        add :order_datetime, :naive_datetime, default: fragment("now()") 
      end
  end
end
