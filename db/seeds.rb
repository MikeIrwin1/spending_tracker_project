require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/transaction' )
require('pry')

Merchant.delete_all

merchant1 = Merchant.new({'name' => 'Tesco', 'catagory' => 'Supermarket'})
merchant2 = Merchant.new({'name' => 'Amazon', 'catagory' => 'Online Retailer'})
merchant1.save()
merchant2.save()


binding.pry
nil
