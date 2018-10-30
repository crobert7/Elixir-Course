defmodule ApiUser.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field(:name, :string)
    field(:age, :integer)
    field(:company)
    field(:city)
    timestamps()
  end

  def create_changeset(user = %ApiUser.User{}, params) do
    user 
    |>cast(params, [:name, :age, :company])
    |>validate_required([:name, :age])
  end

  def search(user_id) do
    query =
      from u in ApiUser.User,
            where: u.id == ^user_id,
            select: u

    ApiUser.Repo.one(query)
  end
end
