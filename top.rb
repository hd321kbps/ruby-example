#!/usr/bin/ruby
# -*- coding: utf-8 -*-
module TOP
  def TOP.tops( aa, bb)
    return 'Число A меньше B' if aa <= bb
    return 'Число A больше B'
    # if aa <= bb then
    #   return 'Число A меньше B'
    # else
    #   return 'Число A больше B'
    # end
  end
end