namespace :users do
  desc "create manager, employee and customer"
  task create_user: :environment do
  	customer1 = Customer.where(email: 'customer1@yopmail.com').first_or_initialize
  	customer1.password = '123456'
  	customer1.save
  	customer2 = Customer.where(email: 'customer2@yopmail.com').first_or_initialize
  	customer2.password = '123456'
  	customer2.save
  	customer3 = Customer.where(email: 'customer3@yopmail.com').first_or_initialize
  	customer3.password = '123456'
  	customer3.save
  	employee = Employee.where(email: 'employee@yopmail.com').first_or_initialize
  	employee.password = '123456'
  	employee.save
  	manager = Manager.where(email: 'manager@yopmail.com').first_or_initialize
  	manager.password = '123456'
  	manager.save
  end

  desc "create an account for all users"
  task create_account: :environment do
  	customer1 = User.where(email: 'customer1@yopmail.com').first
  	customer1_account = Account.where(user_id: customer1.id).first_or_initialize
  	customer1_account.amount = 10000
  	customer1_account.number = rand(2734927423428423)
  	customer1_account.save

  	customer2 = User.where(email: 'customer2@yopmail.com').first
  	customer2_account = Account.where(user_id: customer2.id).first_or_initialize
  	customer2_account.amount = 10000
  	customer2_account.number = rand(2734927423428423)
  	customer2_account.save

  	customer3 = User.where(email: 'customer3@yopmail.com').first
  	customer3_account = Account.where(user_id: customer3.id).first_or_initialize
  	customer3_account.amount = 10000
  	customer3_account.number = rand(2734927423428423)
  	customer3_account.save

  	employee = User.where(email: 'employee@yopmail.com').first
  	employee_account = Account.where(user_id: employee.id).first_or_initialize
  	employee_account.amount = 10000
  	employee_account.number = rand(2734927423428423)
  	employee_account.save

  	manager = User.where(email: 'manager@yopmail.com').first
  	manager_account = Account.where(user_id: manager.id).first_or_initialize
  	manager_account.amount = 10000
  	manager_account.number = rand(2734927423428423)
  	manager_account.save
  end

  desc "Create transactions for all account"
  task create_transaction: :environment do
  	customer1 = User.where(email: 'customer1@yopmail.com').first
  	customer2 = User.where(email: 'customer2@yopmail.com').first
  	manager = User.where(email: 'manager@yopmail.com').first
  	Deposit.create(amount: 100, account_id: customer1.account.id)
  	Withdraw.create(amount: 1000, account_id: customer1.account.id)
  	Deposit.create(amount: 200, account_id: customer1.account.id)
  	Deposit.create(amount: 100, account_id: customer1.account.id)
  	Deposit.create(amount: 400, account_id: customer1.account.id)
  	Withdraw.create(amount: 100, account_id: customer1.account.id)
  	Deposit.create(amount: 100, account_id: customer1.account.id)
  	Withdraw.create(amount: 100, account_id: customer1.account.id)
  	Deposit.create(amount: 100, account_id: customer1.account.id)

  	Deposit.create(amount: 1100, account_id: customer2.account.id)
  	Withdraw.create(amount: 1050, account_id: customer2.account.id)
  	Deposit.create(amount: 200, account_id: customer2.account.id)
  	Deposit.create(amount: 800, account_id: customer2.account.id)
  	Deposit.create(amount: 400, account_id: customer2.account.id)
  	Withdraw.create(amount: 700, account_id: customer2.account.id)
  	Deposit.create(amount: 1100, account_id: customer2.account.id)
  	Withdraw.create(amount: 1900, account_id: customer2.account.id)
  	Deposit.create(amount: 1000, account_id: customer2.account.id)

  	Deposit.create(amount: 1100, account_id: manager.account.id)
  	Withdraw.create(amount: 1050, account_id: manager.account.id)
  	Deposit.create(amount: 200, account_id: manager.account.id)
  	Deposit.create(amount: 800, account_id: manager.account.id)
  	Deposit.create(amount: 400, account_id: manager.account.id)
  	Withdraw.create(amount: 700, account_id: manager.account.id)
  	Deposit.create(amount: 1100, account_id: manager.account.id)
  	Withdraw.create(amount: 1900, account_id: manager.account.id)
  	Deposit.create(amount: 1000, account_id: manager.account.id)
  end

end
