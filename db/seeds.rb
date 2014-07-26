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
puts 'Criando papeis iniciais'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

##ADMIN###
puts 'Criando usuario administrador'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
admin = user.add_role :admin

#Manage all para admin
puts "Criando manage all para admin"
perm = Permission.find_or_create_by_action_and_subject_class(:action => 'manage', :subject_class => 'all')
prole = PermissionRole.new :permission_id => perm.id, :role_id => admin.id if !PermissionRole.where(:permission_id => perm.id, :role_id => admin.id).any?
prole.save!
###FIM ADMIN###


#Noticia
puts "Criando permissions de Noticia"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'read', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'edit', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'create', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'new', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'update', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Noticia', :condition => 'NoticiaPermissao.select("noticia_id").where(:role_id => role.id).collect(&:noticia_id)')

#Curso
puts "Criando permissions de Curso"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'create', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'read', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'update', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'new', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'edit', :subject_class => 'Curso', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'download', :subject_class => 'Curso', :condition => nil)

#Custo
puts "Criando permissions de Custo"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'create', :subject_class => 'Custo', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'read', :subject_class => 'Custo', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'update', :subject_class => 'Custo', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Custo', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'new', :subject_class => 'Custo', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'edit', :subject_class => 'Custo', :condition => nil)

#Fase
puts "Criando permissions de Fase"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'create', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'read', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'update', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'new', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'edit', :subject_class => 'Fase', :condition => nil)
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'pesquisar', :subject_class => 'Fase', :condition => nil)


#Arquivo
puts "Criando permissions de Arquivo"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Arquivo', :condition => nil)

#Relatorio
puts "Criando permissions de Relatorio"
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'destroy', :subject_class => 'Arquivo', :condition => nil)



#Show de user -> O proprio usuario só poderá visualizar seu proprio usuario, exceto admin que é manage all
Permission.find_or_create_by_action_and_subject_class_and_subject_id(:action => 'show', :subject_class => 'user', :subject_id => 'current_user.id')


puts 'Criando categoria "SEM CATEGORIA"'
categoria = Categoria.find_or_create_by_descricao :descricao => "SEM CATEGORIA"
puts "Categoria '#{categoria.descricao}' criada com sucesso."
