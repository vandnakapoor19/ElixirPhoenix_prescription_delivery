defmodule Pdelivery.Order do
use Pdelivery.Web, :model
  schema "orders" do
    field :title, :string
    field :patient_name, :string
    field :patient_address, :string
  end

  def changeset(struct,params \\ %{}) do
    struct
    |> cast(params, [:title,:patient_name,:patient_address])
    |> validate_required(:title)
  end
end
