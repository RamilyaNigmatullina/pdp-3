FactoryGirl.create(:admin, email: "admin@example.com")
FactoryGirl.create(:user, email: "user@example.com")

FactoryGirl.create_list(:post, 6)
