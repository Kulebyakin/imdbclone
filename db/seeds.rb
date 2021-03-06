# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create username: 'admin', email: 'test@test.com', password: '123qwe', admin: true

adventure = Category.create title: 'Adventure'
drama = Category.create title: 'Drama'
comedy = Category.create title: 'Comedy'
cyberpunk = Category.create title: 'Cyberpunk'
musical = Category.create title: 'Musical'
romance = Category.create title: 'Romance'
crime = Category.create title: 'Crime'
action = Category.create title: 'Action'
thriller = Category.create title: 'Thriller'
horror = Category.create title: 'Horror'
animation = Category.create title: 'Animation'
cartoon = Category.create title: 'Cartoon'
disaster = Category.create title: 'Disaster'
fantasy = Category.create title: 'Fantasy'
western = Category.create title: 'Western'
art_house = Category.create title: 'Art-house'

Movie.create title: 'Burlesque', category: [musical], description: 'Burlesque is a 2010 American backstage musical film written and directed by Steven Antin and starring Cher and Christina Aguilera'
Movie.create title: 'City of God', category: [crime], description: 'City of God (Portuguese: Cidade de Deus) is a 2002 Brazilian crime film co-directed by Fernando Meirelles and Kátia Lund, released in its home country in 2002 and worldwide in 2003. Bráulio Mantovani adapted the story from the 1997 novel of the same name written by Paulo Lins, but the plot is loosely based on real events.'
Movie.create title: 'Forrest Gump', category: [drama, comedy, romance], description: 'Forrest Gump is a 1994 American drama film directed by Robert Zemeckis and written by Eric Roth with comedic aspects. It is based on the 1986 novel of the same name by Winston Groom'
Movie.create title: 'Midnight in Paris', category: [art_house], description: 'Midnight in Paris is a 2011 fantasy comedy film written and directed by Woody Allen. Set in Paris, the film follows Gil Pender, a screenwriter, who is forced to confront the shortcomings of his relationship with his materialistic fiancée and their divergent goals, which become increasingly exaggerated as he travels back in time each night at midnight.'
Movie.create title: 'Saw', category: [horror], description: 'Saw is a 2004 American horror film directed by James Wan (in his feature directorial debut) and written by Leigh Whannell from a story by Wan and Whannell.'
Movie.create title: 'The Green Mile', category: [drama, fantasy], description: 'The Green Mile is a 1999 American fantasy drama film written and directed by Frank Darabont and based on Stephen King\'s 1996 novel of the same name.'
Movie.create title: 'The Shawshank Redemption', category: [drama], description: 'The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont, based on the 1982 Stephen King novella Rita Hayworth and Shawshank Redemption.'
Movie.create title: 'The Beach', category: [adventure, drama], description: 'The Beach is a 2000 adventure drama film directed by Danny Boyle and based on the 1996 novel of the same name by Alex Garland, which was adapted for the film by John Hodge.'
Movie.create title: 'Pulp Fiction', category: [drama, crime], description: 'Pulp Fiction is a 1994 American neo-noir black comedy crime film written and directed by Quentin Tarantino, who conceived it with Roger Avary.[4] Starring John Travolta, Samuel L. Jackson, Bruce Willis, Tim Roth, Ving Rhames, and Uma Thurman, it tells several stories of criminal Los Angeles. The title refers to the pulp magazines and hardboiled crime novels popular during the mid-20th century, known for their graphic violence and punchy dialogue.'
Movie.create title: 'Inception', category: [action, adventure], description: 'Inception is a 2010 science fiction action film[4][5][6] written and directed by Christopher Nolan, who also produced the film with Emma Thomas, his wife. The film stars Leonardo DiCaprio as a professional thief who steals information by infiltrating the subconscious of his targets. He is offered a chance to have his criminal history erased as payment for the implantation of another person\'s idea into a target\'s subconscious.[7] The ensemble cast includes Ken Watanabe, Joseph Gordon-Levitt, Marion Cotillard, Elliot Page,[a] Tom Hardy, Dileep Rao, Cillian Murphy, Tom Berenger, and Michael Caine.'
Movie.create title: 'The Good, the Bad and the Ugly', category: [western], description: 'The Good, the Bad and the Ugly (Italian: Il buono, il brutto, il cattivo, literally The good, the ugly, the bad) is a 1966 Italian epic spaghetti Western film directed by Sergio Leone and starring Clint Eastwood as "the Good", Lee Van Cleef as "the Bad", and Eli Wallach as "the Ugly". Its screenplay was written by Age & Scarpelli, Luciano Vincenzoni, and Leone (with additional screenplay material and dialogue provided by an uncredited Sergio Donati),[11] based on a story by Vincenzoni and Leone. Director of photography Tonino Delli Colli was responsible for the film\'s sweeping widescreen cinematography, and Ennio Morricone composed the film\'s score, including its main theme. It is an Italian-led production with co-producers in Spain, West Germany, and the United States. Most of the filming took place in Spain.'
Movie.create title: 'Goodfellas', category: [crime, drama], description: 'Goodfellas (stylized GoodFellas) is a 1990 American biographical crime film directed by Martin Scorsese, written by Nicholas Pileggi and Scorsese, and produced by Irwin Winkler. It is a film adaptation of the 1985 nonfiction book Wiseguy by Pileggi. Starring Robert De Niro, Ray Liotta, Joe Pesci, Lorraine Bracco and Paul Sorvino, the film narrates the rise and fall of mob associate Henry Hill and his friends and family from 1955 to 1980.'
Movie.create title: 'Parasite', category: [comedy, drama, thriller], description: 'Parasite (Korean: 기생충; RR: Gisaengchung) is a 2019 South Korean black comedy thriller film directed by Bong Joon-ho, who co-wrote the screenplay with Han Jin-won. The film, starring Song Kang-ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-shik, Park So-dam, Jang Hye-jin, and Lee Jung-eun, follows a poor family who scheme to become employed by a wealthy family and infiltrate their household by posing as unrelated, highly qualified individuals.'
Movie.create title: 'Gladiator', category: [action, adventure, drama], description: 'Gladiator is a 2000 epic historical drama film directed by Ridley Scott and written by David Franzoni, John Logan, and William Nicholson. The film was co-produced and released by DreamWorks Pictures and Universal Pictures. DreamWorks Pictures distributed the film in North America while Universal Pictures released it internationally through United International Pictures. It stars Russell Crowe, Joaquin Phoenix, Connie Nielsen, Ralf Möller, Oliver Reed (in his final role), Djimon Hounsou, Derek Jacobi, John Shrapnel, Richard Harris, and Tommy Flanagan. Crowe portrays Roman general Maximus Decimus Meridius, who is betrayed when Commodus, the ambitious son of Emperor Marcus Aurelius, murders his father and seizes the throne. Reduced to slavery, Maximus becomes a gladiator and rises through the ranks of the arena to avenge the murders of his family and his emperor.'
Movie.create title: 'Back to the Future', category: [adventure, comedy, cyberpunk], description: 'Back to the Future is a 1985 American science fiction film directed by Robert Zemeckis. Written by Zemeckis and Bob Gale, it stars Michael J. Fox, Christopher Lloyd, Lea Thompson, Crispin Glover, and Thomas F. Wilson. Set in 1985, the story follows Marty McFly (Fox), a teenager accidentally sent back to 1955 in a time-traveling DeLorean automobile built by his eccentric scientist friend Doctor Emmett "Doc" Brown (Lloyd). Trapped in the past, Marty inadvertently prevents his future parents" meeting—threatening his very existence—and is forced to reconcile the pair and somehow get back to the future.'
Movie.create title: 'Django Unchained', category: [western, drama], description: 'Django Unchained (/\'dʒæŋɡoʊ/) is a 2012 American revisionist Western[4] film written and directed by Quentin Tarantino, starring Jamie Foxx, Christoph Waltz, Leonardo DiCaprio, Kerry Washington, and Samuel L. Jackson, with Walton Goggins, Dennis Christopher, James Remar, Michael Parks, and Don Johnson in supporting roles. Set in the Old West and Antebellum South, it is a highly-stylized, heavily-revisionist tribute to Spaghetti Westerns, in particular the 1966 Italian film Django by Sergio Corbucci, whose star Franco Nero has a cameo appearance.'
Movie.create title: 'The Shining', category: [drama, horror], description: 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.'
Movie.create title: 'The Holiday', category: [romance], description: 'Two women troubled with guy-problems swap homes in each other\'s countries, where they each meet a local guy and fall in love.'
Movie.create title: 'The Princess Diaries', category: [romance, comedy], description: 'Mia Thermopolis has just found out that she is the heir apparent to the throne of Genovia. With her friends Lilly and Michael Moscovitz in tow, she tries to navigate through the rest of her sixteenth year.'
Movie.create title: 'Pretty Woman', category: [romance, comedy], description: 'A man in a legal but hurtful business needs an escort for some social events, and hires a beautiful prostitute he meets... only to fall in love.'
Movie.create title: 'Soul', category: [animation, comedy, fantasy], description: 'Joe is a middle-school band teacher whose life hasn\'t quite gone the way he expected. His true passion is jazz -- and he\'s good. But when he travels to another realm to help someone find their passion, he soon discovers what it means to have soul.'
Movie.create title: 'Toy Story', category: [animation, adventure, comedy, fantasy], description: 'A little boy named Andy loves to be in his room, playing with his toys, especially his doll named "Woody". But, what do the toys do when Andy is not with them, they come to life. Woody believes that his life (as a toy) is good. However, he must worry about Andy\'s family moving, and what Woody does not know is about Andy\'s birthday party. Woody does not realize that Andy\'s mother gave him an action figure known as Buzz Lightyear, who does not believe that he is a toy, and quickly becomes Andy\'s new favorite toy. Woody, who is now consumed with jealousy, tries to get rid of Buzz. Then, both Woody and Buzz are now lost. They must find a way to get back to Andy before he moves without them, but they will have to pass through a ruthless toy killer, Sid Phillips.'
Movie.create title: 'Cars', category: [animation, comedy], description: 'While traveling to California for the dispute of the final race of the Piston Cup against The King and Chick Hicks, the famous Lightning McQueen accidentally damages the road of the small town Radiator Springs and is sentenced to repair it. Lightning McQueen has to work hard and finds friendship and love in the simple locals, changing its values during his stay in the small town and becoming a true winner.'

categories = [
  adventure, 
  drama, 
  comedy,
  cyberpunk,
  musical,
  romance,
  crime,
  action,
  thriller,
  horror,
  animation,
  cartoon,
  disaster,
  fantasy,
  western,
  art_house
]


(1..50).each do |id|
  Movie.create(
    title: Faker::Movie.unique.title, 
    category: categories.sample(rand(1..3)),
    description: Faker::Hipster.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
  )
end