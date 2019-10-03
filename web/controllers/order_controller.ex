defmodule Pdelivery.OrderController do
  use Pdelivery.Web, :controller

  alias Pdelivery.Order

  def index(conn, _params) do
    orders =  Repo.all(Order)
    render conn, "index.html", orders: orders
  end

  def new(conn, _params) do
    changeset = Order.changeset(%Order{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"order"=>order}) do
    changeset = Order.changeset(%Order{}, order)

    case  Repo.insert(changeset) do
      {:ok, _order}->
        conn
        |> put_flash(:info, "Order Created")
        |> redirect(to: order_path(conn, :index))
      {:error,changeset}->render conn,"new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => order_id}) do
    order =  Repo.get(Order, order_id)
    changeset  =  Order.changeset(order)
    render conn, "edit.html", changeset: changeset , order: order
  end

  def update(conn, %{"id"=>order_id, "order"=>order}) do
    old_order = Repo.get(Order, order_id)
    changeset = Order.changeset(old_order,order)

    case Repo.update(changeset) do
      {:ok,_order}->
      conn
      |> put_flash(:info, "Order Updated")
      |> redirect(to: order_path(conn, :index))
      {:error, changeset}->
        render conn, "edit.html", changeset: changeset, order:  old_order
    end
  end

  def delete(conn, %{"id" => order_id}) do
      Repo.get!(Order, order_id) |> Repo.delete!

      conn
      |> put_flash(:info,"Order Deleted")
      |> redirect(to: order_path(conn, :index))
  end

end
