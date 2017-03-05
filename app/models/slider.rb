
class Slider < ApplicationRecord
  has_attached_file :image,
                    #styles: { large: "1920x1080>" },
                    storage: :fog,
                    path: 'uploads/:filename',
                    fog_directory: 'uploads',
                    fog_credentials: {
                      provider:               'openstack',
                      openstack_auth_url:     ENV["auth_url"],
                      openstack_api_key:      ENV["password"],
                      openstack_project_id:   ENV["projectId"],
                      openstack_username:     ENV["username"],
                      openstack_domain_name:  ENV["domainName"],
                      openstack_region:       ENV["region"],
                      openstack_auth_omit_default_port: true
                    }

  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image
end
