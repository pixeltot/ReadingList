
Book.destroy_all
Genre.destroy_all

fiction = Genre.create!(name: 'Fiction')
non_fiction = Genre.create!(name: 'Non-Fiction')
apple = Genre.create!(name: 'Apple')


Book.create!([{
	title: "Hyperion",
	author: "Dan Simmons",
	description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
		amazon_id: "0553283685",
		rating: 5,
		finished_on: 10.days.ago,
		genres: [fiction]
},
{
	title: "Jony Ive: The Genius Behind Apple's Greatest Products",
	author: "Leander Kahney",
	description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
	amazon_id: "159184617X",
	rating: 4,
	finished_on: 1.day.ago,
	genres: [non_fiction, apple]
},
{
	title: "Mindstorms",
	author: "Stupid Mother",
	description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
	amazon_id: "0465046746",
	rating:3,
	finished_on: nil,
	genres: [apple, non_fiction]
}])

p "Created #{Book.count} books"