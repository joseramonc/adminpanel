class CreateAdminpanelTables < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    if direction == :up && Rails.env.development?
      role = Adminpanel::Role.new(name: 'Admin')
      role.save
      Adminpanel::User.new(email: 'webmaster@codn.mx', name: 'Webmaster', password: 'password', password_confirmation: 'password', role_id: role.id).save
      puts "The password for webmaster@codn.mx is: password"
    end
  end

  def change
    create_roles
    create_users
    create_permissions
    create_auths
    create_sections
    create_sectionfiles
    create_pages
    create_pages_sections
  end

  private
  def create_users
    create_table :adminpanel_users do |t|
      t.string  :name
      t.string  :email, index: true
      t.references :role
      t.string  :password_digest
      t.string  :remember_token, index: true
      t.timestamps
    end
    add_foreign_key :adminpanel_users, :adminpanel_roles, column: :role_id
  end

  def create_sectionfiles
    create_table :adminpanel_sectionfiles do |t|
      t.string  :file
      t.references :section
      t.timestamps
    end
    add_foreign_key :adminpanel_sectionfiles, :adminpanel_sections, column: :section_id
  end

  def create_roles
    create_table :adminpanel_roles do |t|
      t.string :name
      t.timestamps
    end
  end

  def create_permissions
    create_table :adminpanel_permissions do |t|
        t.references  :role
        t.integer  :action
        t.string   :resource
        t.timestamps
    end
    add_foreign_key :adminpanel_permissions, :adminpanel_roles, column: :role_id
  end

  def create_auths
    create_table :adminpanel_auths do |t|
      t.string   :name
      t.string   :key, index: true
      t.string   :value
      t.timestamps
    end
  end

  def create_sections
    create_table :adminpanel_sections do |t|
      t.text    :description
      t.string  :key, index: true
      t.integer :max_files, default: 0
      t.string :type
      t.timestamps
    end
  end

  def create_pages
    create_table :adminpanel_pages do |t|
      t.string :name
      t.string :key, index: true
    end
  end

  def create_pages_sections
    create_table :adminpanel_components, id: false do |t|
      t.references :section
      t.references :page
      t.integer :position
    end
    add_foreign_key :adminpanel_components, :adminpanel_sections, column: :section_id
    add_foreign_key :adminpanel_components, :adminpanel_pages, column: :page_id
  end
end
