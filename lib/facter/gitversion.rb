#use git binary
Facter.add('gitversion') do
  setcode do
    gitverstring = Facter::Core::Execution.exec('git --version')
	if gitverstring.empty?
		nil
	else
		gitver=gitverstring.match(/\d+\.\d+\.\d+/)
		gitver[0] if gitver
	end
  end
end
