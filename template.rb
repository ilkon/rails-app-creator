application nil do
  <<-CONF
    config.eager_load_paths << Rails.root.join('lib')
    ##SHRINE##

  CONF
end

application nil, env: :development do
  <<-BULLET
    config.after_initialize do
      Bullet.enable              = true
      Bullet.alert               = false
      Bullet.console             = true
      Bullet.rails_logger        = true
      Bullet.add_footer          = true
      Bullet.skip_html_injection = false
    end

  BULLET
end
