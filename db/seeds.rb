User.create!(
  email: "admin@admin.com",
  username: "adminA",
  password: "testpass123",
  admin: true
)

User.create!(
  email: "guest@guest.com",
  username: "guestA",
  password: "guestpass123",
  admin: false
)