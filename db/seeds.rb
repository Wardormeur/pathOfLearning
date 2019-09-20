# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# TODO: enforce URL
unity_ch1 = Resource.create :url => "https://wireframe.rpf.io/1", :type_of => "pdf", :name => "Create a FPS - Part 1"
unity_ch2 = Resource.create :url => "https://wireframe.rpf.io/2", :type_of => "pdf", :name => "Create a FPS - Part 2"
unity_ch3 = Resource.create :url => "https://wireframe.rpf.io/3", :type_of => "pdf", :name => "Create a FPS - Part 3"

step1 = Step.create(:resource => unity_ch1)
step1.children.create(:resource => unity_ch2, :name => "Fps part 2: jetpack")
step1.children.create(:resource => unity_ch3)

unity_track = Track.create :step => step1, :name => "Unity Beginner" # tags: fps, unity...
