******************************
starting consumer
User.create("email"=>"judaro13@gmail.com", "encrypted_password"=>"$2a$10$sFAftirJHNoi7RpYw8MnbOnCX5ISxFaWxlt6Da39duFuHfC.64jS6", "confirmation_token"=>nil, "remember_token"=>"e26e1fa5e1a7a11229876e62889f3169462b1ec5")
Resource.create("name"=>"MongoDB", "resource_type"=>"store", "docker_image"=>"mongo", "internal_port"=>"27017")
Resource.create("name"=>"PostgreSQL", "resource_type"=>"store", "docker_image"=>"postgres", "internal_port"=>"5432")
Resource.create("name"=>"Kafka", "resource_type"=>"misc", "docker_image"=>"cloudtrackinc/kubernetes-kafka", "internal_port"=>"2181")
