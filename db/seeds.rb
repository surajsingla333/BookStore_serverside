book = [
    {
        title: 'On the Road',
        author: 'Jack Kerouac',
        read: 1
    },
    {
        title: 'Harry Potter and the Philosopher\'s Stone',
        author: 'J. K. Rowling',
        read: 0
    },
    {
        title: 'Green Eggs and Ham',
        author: 'Dr. Seuss',
        read: 1
    }
]

book.each do |b|
    Book.create(b)
end