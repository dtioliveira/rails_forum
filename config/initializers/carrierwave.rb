CarrierWave.configure do |config|

  config.storage = Rails.env.production? ? :fog : :file

  config.fog_credentials = {
      :provider               => 'AWS',                                         # required
      :aws_access_key_id      => 'AKIAJDE5HQKMUCEQEWLQ',                        # required
      :aws_secret_access_key  => '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'    # required
  }
  config.fog_directory  = "cursify-test"
end
