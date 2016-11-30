# # encoding: utf-8

# Inspec test for recipe simple_patcher::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe package('bind9-host') do
  it { should be_installed }
  its('version') { should eq '1:9.9.5.dfsg-3ubuntu0.10'}
end

describe package('apt') do
  it { should be_installed }
  its('version') { should eq '1.0.1ubuntu2.15'}
end
