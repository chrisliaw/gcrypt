# frozen_string_literal: true

RSpec.describe Gcrypt do
  it "has a version number" do
    expect(Gcrypt::VERSION).not_to be nil
  end

  it 'create AES cipher' do
   
    aes = Gcrypt::AES.new(256, :gcm)
    expect(aes).not_to be_nil

    key = aes.random_key
    expect(aes.key == key).to be true

    iv = aes.random_iv
    expect(aes.iv == iv).to be true

    aes.encrypt_init do
      #eng.encrypt_update
    end

  end

  it 'creates random bytes' do
    srb = Gcrypt::SecureRandom.secure_random_bytes(32)
    expect(srb).not_to be_nil

    rb = Gcrypt::SecureRandom.random_bytes(32)
    expect(rb).not_to be_nil
  end

end
