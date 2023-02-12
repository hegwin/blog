require 'baidu-netdisk'

namespace :scheduled do
  desc 'Backup DB and upload it to Baidu NetDisk'
  task db_backup: :environment do
    token = ExternalToken.find_by(key: 'baidu-netdisk')

    BaiduNetDisk.config do |c|
      c.app_id     = Rails.application.credentials.baidu[:app_id]
      c.app_key    = Rails.application.credentials.baidu[:app_key]
      c.secret_key = Rails.application.credentials.baidu[:secret_key]
      c.access_token  = token.value['access_token']
      c.refresh_token = token.value['refresh_token']
      c.after_token_refreshed = -> (access_token, refresh_token) {
        token.update value: { access_token: access_token, refresh_token: refresh_token }
      }
    end

    database = ActiveRecord::Base.connection_config[:database]
    #ActiveRecord::Base.connection.current_database

    dump_file_name = "blog_#{Rails.env}_backup_#{Date.today.to_s}.dmp"
    dump_path = Rails.root.join('tmp', dump_file_name)

    `pg_dump #{database} --exclude-table-data='external_tokens' > #{dump_path}`

    uploader = BaiduNetDisk::Uploader.new dump_path, "/apps/HegwinBlogBackup/#{dump_file_name}", verbose: true
    uploader.execute
  end
end
