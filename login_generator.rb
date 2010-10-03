
class LoginGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      
      # Controller
      m.file "lib/login_system.rb", "lib/login_system.rb"
      m.file "controllers/users_controller.rb", "app/controllers/users_controller.rb" 
      m.file "controllers/roles_controller.rb", "app/controllers/roles_controller.rb"
      m.file "controllers/account_controller.rb", "app/controllers/account_controller.rb"
      
      # Models
      m.file "models/user.rb", "app/models/user.rb"
      m.file "models/role.rb", "app/models/role.rb"
      
      # Tests
      m.file "test/unit/user_test.rb", "test/unit/user_test.rb"
      m.file "test/unit/role_test.rb", "test/unit/role_test.rb"
      m.file "test/functional/account_controller_test.rb", "test/functional/account_controller_test.rb"
      m.file "test/functional/users_controller_test.rb", "test/functional/users_controller_test.rb"
      m.file "test/fixtures/users.yml", "test/fixtures/users.yml"
      m.file "test/fixtures/roles.yml", "test/fixtures/roles.yml"
      
      # Views. 
      m.directory "app/views/roles"
      m.directory "app/views/users"
      m.directory "app/views/account"
      m.file "views/users/create.rhtml", "app/views/users/create.rhtml"
      m.file "views/users/_user.rhtml", "app/views/users/_user.rhtml"
      m.file "views/users/destroy.rhtml", "app/views/users/destroy.rhtml"
      m.file "views/users/edit.rhtml", "app/views/users/edit.rhtml"
      m.file "views/users/enable.rhtml", "app/views/users/enable.rhtml"
      m.file "views/users/index.rhtml", "app/views/users/index.rhtml"
      m.file "views/users/new.rhtml", "app/views/users/new.rhtml"
      m.file "views/users/show.rhtml", "app/views/users/show.rhtml"
      m.file "views/users/update.rhtml", "app/views/users/update.rhtml"
      m.file "views/roles/_role.rhtml", "app/views/roles/_role.rhtml"
      m.file "views/roles/index.rhtml", "app/views/roles/index.rhtml"
      m.file "views/roles/show.rhtml", "app/views/roles/show.rhtml"
      m.file "views/roles/new.rhtml", "app/views/roles/new.rhtml"
      m.file "views/account/authenticate.rhtml", "app/views/account/authenticate.rhtml"
      m.file "views/account/login.rhtml", "app/views/account/login.rhtml"
      m.file "views/account/logout.rhtml", "app/views/account/logout.rhtml"
      
      m.file "lib/login_system.rb", "app/lib/login_system.rb"
      m.file "lib/smtp_tls.rb", "app/lib/smtp_tls.rb"
      
      m.route_resources :users
      m.route_resources :roles
      
      # Migrations
      m.migration_template "migrate/create_users.rb", "db/migrate", :migration_file_name => 'create_users'
      m.sleep 1
      m.migration_template "migrate/create_roles.rb", "db/migrate", :migration_file_name => 'create_roles'
      m.sleep 1
      m.migration_template "migrate/create_roles_users_join.rb", "db/migrate", :migration_file_name => 'create_roles_users_join'
      
      
      m.readme "INSTALL"
    end
  end
end
