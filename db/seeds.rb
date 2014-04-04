# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'Criando pap�is iniciais'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'Criando usu�rio padr�o'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

perm = Permission.find_or_create_by_action_and_subject_class :action => 'manage', :subject_class => 'all'
Permission.find_or_create_by_action_and_subject_class_and_subject_id :action => 'show', :subject_class => 'user', :subject_id => 'current_user.id'
PermissionRole.find_or_create_by_permission_id_and_role_id :permission_id => perm.id, :role_id => user.roles.first



puts 'Criando categoria "SEM CATEGORIA"'
categoria = Categoria.find_or_create_by_descricao :descricao => "SEM CATEGORIA"
puts "Categoria '#{categoria.descricao}' criada com sucesso."
