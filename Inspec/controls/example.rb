control 'nginx-01' do
  impact 1.0
  title 'Verificar que nginx esté instalado y en ejecución'
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    its('processes') { should include 'nginx' }
  end
end

control 'proftpd-01' do
  impact 1.0
  title 'Verificar que proftpd esté instalado y en ejecución'
  describe package('proftpd-basic') do
    it { should be_installed }
  end

  describe service('proftpd') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(21) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    its('processes') { should include 'proftpd' }
  end
end
