require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/transaction' )
require_relative( '../models/budget' )
require('pry')

Transaction.delete_all
Merchant.delete_all
Tag.delete_all
Budget.delete_all

merchant1 = Merchant.new({'name' => 'Tesco', 'catagory' => 'Supermarket'})
merchant2 = Merchant.new({'name' => 'Amazon', 'catagory' => 'Online Retailer'})
merchant3 = Merchant.new({'name' => 'Netflix', 'catagory' => 'TV'})
merchant4 = Merchant.new({'name' => 'British Gas', 'catagory' => 'Utility'})
merchant5 = Merchant.new({'name' => 'Virgin Media', 'catagory' => 'Subscription'})
merchant6 = Merchant.new({'name' => 'Nandos', 'catagory' => 'Restaurant'})
merchant7 = Merchant.new({'name' => 'Giffgaff', 'catagory' => 'Subscription'})
merchant8 = Merchant.new({'name' => 'BP', 'catagory' => 'Fuel'})
merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()
merchant6.save()
merchant7.save()
merchant8.save()


tag1 = Tag.new({'name' => 'groceries'})
tag2 = Tag.new({'name' => 'entertainment'})
tag3 = Tag.new({'name' => 'transport'})
tag4 = Tag.new({'name' => 'eating out'})
tag5 = Tag.new({'name' => 'finances'})
tag6 = Tag.new({'name' => 'bills'})
tag7 = Tag.new({'name' => 'holidays'})
tag8 = Tag.new({'name' => 'shopping'})
tag9 = Tag.new({'name' => 'general'})
tag10 = Tag.new({'name' => 'expenses'})
tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()
tag8.save()
tag9.save()
tag10.save()


transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'spend' => 10})
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'spend' => 12})
transaction1.save()
transaction2.save

budget = Budget.new({'value' => 200})
budget.save

binding.pry
nil
