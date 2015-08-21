#use git binary
Facter.add('gitversion') do
  has_weight 150
  setcode do
    Facter::Core::Execution.exec('git --version | tr -d "[:alpha:]|[:space:]"')
  end
end

#use puppet resource tool if git binary doesn't work(eg.Windows)
Facter.add('gitversion') do
  has_weight 100
  setcode do
    gitver = Facter::Core::Execution.exec('puppet resource package git | grep version')
	if gitver
		gitver.match(/\d+\.\d+\.\d+/)[0]
	end
  end
end

#check ensure attribute if version attribute not present
Facter.add('gitversion') do
  has_weight 50
  setcode do
    gitensure = Facter::Core::Execution.exec('puppet resource package git | grep ensure')
	if gitensure
		gitver=gitensure.match(/\d+\.\d+\.\d+/)
		gitver[0] if gitver
	else 
		nil
	end
  end
end
