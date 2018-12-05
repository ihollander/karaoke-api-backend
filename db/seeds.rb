Room.destroy_all
Song.destroy_all

room = Room.create()

u1 = User.create(name: 'Ian', room: room)
u2 = User.create(name: 'Sarah', room: room)

s1 = Song.create(title: 'Oops I Did It Again', youtube_id: 'madeupID')
s2 = Song.create(title: 'Lets Dance', youtube_id: 'madeupID')


Playlist.create(user: u1, song: s1)
Playlist.create(user: u2, song: s2)