Room.destroy_all

room = Room.create()

User.create(name: 'Ian', room: room)
User.create(name: 'Sarah', room: room)