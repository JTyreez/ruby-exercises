# takes in: stock prices (array)
# returns: pair of days, best day to buy and best day to sell

def stock_picker (prices)

    # find best days to sell <-- Sell days
    # look at previous days, determine best profit from those days <-- Buy day

    maxProfit = 0
    optimalDays = ""
    prices.each_with_index do |price1,index1|
        prices.each_with_index do |price2,index2|

            profit = price2 - price1 

        if profit > maxProfit && index1 < index2
            maxProfit = profit
            optimalDays = [index1, index2]
        end
        end
    end  

    return optimalDays  
end



puts stock_picker([17,3,6,9,15,8,6,1,10])