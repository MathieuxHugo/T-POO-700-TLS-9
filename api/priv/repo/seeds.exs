# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todolist.Repo.insert!(%Todolist.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Todolist.Repo
alias Todolist.Repo.Directory.User

Repo.insert! %User{username: "Sebastien", email: "sebastien.begue@epitech.eu"}
