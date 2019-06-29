FactoryBot.create(:admin, email: "admin@example.com")
FactoryBot.create(:user, email: "user@example.com")

FactoryBot.create_list(:post, 6)
