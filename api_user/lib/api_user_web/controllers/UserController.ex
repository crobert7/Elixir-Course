defmodule ApiUserWeb.UserController do
    use ApiUserWeb, :controller

    def index(conn, _params) do #el router siempre recibira como primer parametro la conexion y después los demás parametros
      users = ApiUser.User.search_all()

      conn
      #|>put_status(401)
      #|>text("UnAuth")
      |>put_status(200)
      |>json(users)
    end

    #def show(conn, params) do #el router siempre recibira como primer parametro la conexion y después los demás parametros
    def show(conn, %{"id" => user_id}) do
      IO.inspect(self())
      #IO.inspect(params)
      #case ApiUser.User.search(1) do
      case ApiUser.User.search(user_id) do
        nil ->
          conn
        |> put_status(404)
        |> text("Error!!")

        _user ->
      conn
      |>put_status(200)
      |>text("Success!!")
      end
    end

    def create(conn, params) do #el router siempre recibira como primer parametro la conexion y después los demás parametros
      changeset = ApiUser.User.create_changeset(%ApiUser.User{}, params) #Mandamos a llamar la función
      IO.inspect(changeset)

      case changeset.valid? do
        true ->
          user = ApiUser.Repo.insert!(changeset)

          conn
          |>put_status(200)
          |>text("Element Insert!")
          |> json(%{user: %{name: user.name, user_id: user.id}})

          false ->
          conn
          |>put_status(400)
          |>text("Error with the data")

      end

      conn
      |>put_status(200)
      |>text("Create")
    end
end
