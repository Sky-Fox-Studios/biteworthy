# Upload files to Amazon S3
Paperclip::Attachment.default_options.update(
  storage: :s3,
  url: ":s3_domain_url",
  path: "/#{Rails.env}/photos/:attachment/:id_partition/:style/:filename",
  s3_credentials: {
    bucket: "biteworthy",
    access_key_id: ENV["aws_access_key_id"],
    secret_access_key: ENV["aws_secret_access_key"],
    s3_region: ENV["aws_region"],
  }
)
