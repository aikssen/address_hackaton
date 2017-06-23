defmodule AddressValidatorApi.Repo.Migrations.AddAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :address, :string
      add :response, :string

      timestamps()
    end
  end
end
