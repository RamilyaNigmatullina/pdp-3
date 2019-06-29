FactoryGirl.create(:super_admin, email: "super_admin@example.com")
FactoryBot.create(:admin, email: "admin@example.com")

user = FactoryGirl.create(:user, email: "user@example.com")
second_user = FactoryGirl.create(:user, email: "second_user@example.com")
third_user = FactoryGirl.create(:user, email: "third_user@example.com")

FactoryGirl.create_list(:post, 4, user: user)
FactoryGirl.create_list(:post, 6, :published, user: second_user)
FactoryGirl.create_list(:post, 2, :rejected, user: third_user)
