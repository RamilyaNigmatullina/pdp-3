FactoryBot.create(:admin, email: "admin@example.com")

user = FactoryBot.create(:user, email: "user@example.com")
second_user = FactoryBot.create(:user, email: "second_user@example.com")
third_user = FactoryBot.create(:user, email: "third_user@example.com")

FactoryBot.create_list(:post, 4, user: user)
FactoryBot.create_list(:post, 6, :published, user: second_user)
FactoryBot.create_list(:post, 2, :rejected, user: third_user)
