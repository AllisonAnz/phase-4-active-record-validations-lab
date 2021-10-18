# Active Record Validation 

# Validations are special method calls that go at the top of medel class definitions and prevent them from being saved 
# to the database if their data doesn't look right 
# In general, they consist of code that performs the job of protecting the database from invalid data
# Active Record can validate our models for us before they even touch the database 
# meaning it harder to end up with bad data 

# Using ActiveRecord::Base helper methods like #validates to set things up

# Valiates takes two arguments: the first is the name of the attribute we want to validate 
# and the secondis a hash of options that will include details of how to validate it 

class Person < Active Record::Base 
    validates :name, presence: true 
end

Person.create(name: "John Doe").valid?
#=> true 
Person.create(name: nil).valid?
#=> false 

# What is the difference between #new and #create 
#new instantiates a new Active Record model without saving it to the database, 
#create immediately attemps to save it, as if you has called #new and then #save 

# Database activity triggers validation. 
# An Active Record model instantiated with #new will not be validated, because 
# no attemt to write to the database what made. 
# validations whon't run inless you call a method that actually hits the DB like #save 

# Validation Failure 
# Pay attention to return values 
# By default, Active Record does not raise an exception when validation fails 
# DB opeation methods (such as #save) will simply return false and decline to update the database 

# Every database method has a sister method with ! at the end which will raise an 
# exception 