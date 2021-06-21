# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create username: "admin", email: "test@test.com", password: "123qwe", admin: true

adventure = Category.create title: "Adventure"
drama = Category.create title: "Drama"
comedy = Category.create title: "Comedy"
caberpunk = Category.create title: "Caberpunk"
musical = Category.create title: "Musical"
romance = Category.create title: "Romance"
crime = Category.create title: "Crime"
action = Category.create title: "Action"
thriller = Category.create title: "Thriller"
horror = Category.create title: "Horror"
animation = Category.create title: "Animation"
cartoon = Category.create title: "Cartoon"
disaster = Category.create title: "Disaster"
fantasy = Category.create title: "Fantasy"
western = Category.create title: "Western"
art_house = Category.create title: "Art-house"

Movie.create title: "Burlesque", category: [musical], description: "Burlesque is a 2010 American backstage musical film written and directed by Steven Antin and starring Cher and Christina Aguilera"
Movie.create title: "City of God", category: [crime], description: "City of God (Portuguese: Cidade de Deus) is a 2002 Brazilian crime film co-directed by Fernando Meirelles and Kátia Lund, released in its home country in 2002 and worldwide in 2003. Bráulio Mantovani adapted the story from the 1997 novel of the same name written by Paulo Lins, but the plot is loosely based on real events."
Movie.create title: "Forrest Gump", category: [drama, comedy, adventure], description: "Forrest Gump is a 1994 American drama film directed by Robert Zemeckis and written by Eric Roth with comedic aspects. It is based on the 1986 novel of the same name by Winston Groom"
Movie.create title: "Midnight in Paris", category: [art_house], description: "Midnight in Paris is a 2011 fantasy comedy film written and directed by Woody Allen. Set in Paris, the film follows Gil Pender, a screenwriter, who is forced to confront the shortcomings of his relationship with his materialistic fiancée and their divergent goals, which become increasingly exaggerated as he travels back in time each night at midnight."
Movie.create title: "Saw", category: [horror], description: "Saw is a 2004 American horror film directed by James Wan (in his feature directorial debut) and written by Leigh Whannell from a story by Wan and Whannell."
Movie.create title: "The Green Mile", category: [drama, fantasy], description: "The Green Mile is a 1999 American fantasy drama film written and directed by Frank Darabont and based on Stephen King's 1996 novel of the same name."
Movie.create title: "The Shawshank Redemption", category: [drama], description: "The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont, based on the 1982 Stephen King novella Rita Hayworth and Shawshank Redemption."
Movie.create title: "The beach", category: [adventure, drama], description: "The Beach is a 2000 adventure drama film directed by Danny Boyle and based on the 1996 novel of the same name by Alex Garland, which was adapted for the film by John Hodge."
