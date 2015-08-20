Facter.add('gitversion') do
  setcode do
    Facter::Core::Execution.exec('git --version | tr -d "[:alpha:]|[:space:]"')
  end
end

