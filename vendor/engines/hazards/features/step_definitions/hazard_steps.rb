Given /^I have no hazards$/ do
  Hazard.delete_all
end

Given /^I (only )?have hazards titled "?([^\"]*)"?$/ do |only, titles|
  Hazard.delete_all if only
  titles.split(', ').each do |title|
    Hazard.create(:title => title)
  end
end

Then /^I should have ([0-9]+) hazards?$/ do |count|
  Hazard.count.should == count.to_i
end
