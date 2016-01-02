user1 = User.create!(
  name: 'João da Silva',
  email: 'usuario1@rails_forum.com.br',
  password: 'user1234',
  is_admin: true
)

30.times.each_with_index do |index|
  Post.create!(
    title_pt: "Título PT #{index}",
    title_es: "Título ES #{index}",
    text_pt:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tincidunt metus non imperdiet dictum. Cras in sagittis risus, a mollis massa. Donec commodo quis urna eu ornare. Nunc vestibulum ipsum sit amet venenatis molestie. Sed at augue id risus iaculis eleifend. Proin auctor ornare augue, sit amet finibus lectus accumsan malesuada. Ut tempor lectus sed nulla tristique vestibulum. Nullam et dapibus ante, in hendrerit orci.
    Morbi et dapibus ligula. Quisque turpis metus, eleifend at urna vel, iaculis laoreet lacus. Suspendisse blandit posuere mauris, id blandit mi ullamcorper vel. Cras gravida egestas tortor vitae luctus. Vivamus facilisis nisl in sem aliquam, sit amet malesuada leo faucibus. In condimentum, est eget accumsan imperdiet, dui metus porta elit, ac placerat nisl arcu vel leo. Sed ultrices venenatis magna, eu commodo lorem viverra non. Suspendisse molestie, turpis sit amet posuere dapibus, leo diam aliquet neque, ac interdum justo neque non ipsum. Sed luctus eleifend risus semper eleifend. Morbi iaculis orci ipsum, sit amet viverra urna lacinia at. Donec est felis, lacinia quis semper placerat, placerat nec nunc. Cras sed massa eu lorem feugiat convallis. Praesent consectetur tincidunt libero eu malesuada. Pellentesque a semper sapien.",
    text_es: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tincidunt metus non imperdiet dictum. Cras in sagittis risus, a mollis massa. Donec commodo quis urna eu ornare. Nunc vestibulum ipsum sit amet venenatis molestie. Sed at augue id risus iaculis eleifend. Proin auctor ornare augue, sit amet finibus lectus accumsan malesuada. Ut tempor lectus sed nulla tristique vestibulum. Nullam et dapibus ante, in hendrerit orci.
    Morbi et dapibus ligula. Quisque turpis metus, eleifend at urna vel, iaculis laoreet lacus. Suspendisse blandit posuere mauris, id blandit mi ullamcorper vel. Cras gravida egestas tortor vitae luctus. Vivamus facilisis nisl in sem aliquam, sit amet malesuada leo faucibus. In condimentum, est eget accumsan imperdiet, dui metus porta elit, ac placerat nisl arcu vel leo. Sed ultrices venenatis magna, eu commodo lorem viverra non. Suspendisse molestie, turpis sit amet posuere dapibus, leo diam aliquet neque, ac interdum justo neque non ipsum. Sed luctus eleifend risus semper eleifend. Morbi iaculis orci ipsum, sit amet viverra urna lacinia at. Donec est felis, lacinia quis semper placerat, placerat nec nunc. Cras sed massa eu lorem feugiat convallis. Praesent consectetur tincidunt libero eu malesuada. Pellentesque a semper sapien.",
    tags_pt: "tag_pt; tag_pt_#{index}",
    tags_es: "tag_es; tag_es_#{index}",
    user_id: user1.id
  )

  Video.create!(
    title_pt: "Título PT #{index}",
    title_es: "Título ES #{index}",
    url: "https://www.youtube.com/watch?v=pAgnJDJN4VA",
    tags_pt: "tag_pt; tag_pt_#{index}",
    tags_es: "tag_es; tag_es_#{index}",
    user_id: user1.id
  )
end
