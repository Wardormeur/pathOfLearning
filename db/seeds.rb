# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ScrapRpfProjectsJob.perform_now

step1 = Step.create(:resource => Resource.find(1))
step1.children.create(:resource => Resource.find(2))
step1.children[0].children.create(:resource => Resource.find(3))

unity_track = Track.create :step => step1, :name => "Unity Beginner" # tags: fps, unity...
