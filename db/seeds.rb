require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/transaction' )
require('pry')

Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.new({'name' => 'Tesco', 'catagory' => 'Supermarket'})
merchant2 = Merchant.new({'name' => 'Amazon', 'catagory' => 'Online Retailer'})
merchant1.save()
merchant2.save()

tag1 = Tag.new({'name' => 'groceries'})
tag2 = Tag.new({'name' => 'entertainment'})
tag1.save()
tag2.save()

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'spend' => 10})
transaction1.save()

binding.pry
nil
