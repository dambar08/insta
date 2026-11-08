# frozen_string_literal: true

raise "Demo feed seeds are only available in development" unless Rails.env.development?

demo_users = [
  {
    email: "demo@example.test",
    username: "demo",
    firstname: "Alex",
    lastname: "Morgan",
    posts: [
      ["A quiet start to the day.", "1.png"],
      ["Found a little sunshine on the walk home.", "2.png"],
      ["Weekend plans: slow down and look around.", "3.png"],
    ],
  },
  {
    email: "maya@example.test",
    username: "maya_makes",
    firstname: "Maya",
    lastname: "Chen",
    posts: [
      ["A small reminder to make room for fresh air.", "3.png"],
      ["Today's favorite corner of the neighborhood.", "1.png"],
      ["Collecting ordinary moments.", "2.png"],
    ],
  },
  {
    email: "sam@example.test",
    username: "sam_outside",
    firstname: "Sam",
    lastname: "Rivera",
    posts: [
      ["Taking the long way, as usual.", "2.png"],
      ["A good day to get outside.", "3.png"],
      ["A little pause between busy days.", "1.png"],
    ],
  },
  {
    email: "jules@example.test",
    username: "jules.jpg",
    firstname: "Jules",
    lastname: "Taylor",
    posts: [
      ["Trying to notice more of the little things.", "1.png"],
      ["An afternoon well spent.", "2.png"],
      ["Saving this moment for later.", "3.png"],
    ],
  },
]

demo_users.each_with_index do |attributes, user_index|
  user = User.find_or_initialize_by(email: attributes[:email])
  user.password = "password123"
  user.confirmed_at ||= Time.current
  user.save!

  account = user.account || user.create_account!
  account.update!(
    username: attributes[:username],
    firstname: attributes[:firstname],
    lastname: attributes[:lastname],
  )

  attributes[:posts].each_with_index do |(caption, image_name), post_index|
    post = account.posts.find_or_create_by!(caption: caption) do |new_post|
      new_post.created_at = (post_index * demo_users.length + user_index).minutes.ago
    end
    next if post.assets.any? { |asset| asset.attachment.attached? }

    image_path = Rails.root.join("app/assets/images", image_name)
    asset = post.assets.build
    File.open(image_path) do |image|
      asset.attachment.attach(io: image, filename: "demo-#{image_name}", content_type: "image/png")
      asset.save!
    end
  end
end
