from datetime import datetime
from datetime import timedelta

def view_the_log() -> 'list of list':
    contents = []
    with open('trades.csv') as log:
        for line in log:
            contents.append(line.split(','))
            contents[-1][3] = contents[-1][3].strip()
    return contents
contents = view_the_log()
exchange = []
for i in range(len(contents)):
    if contents[i][3] not in exchange:
        exchange.append(contents[i][3])
    
sort_exchange = sorted(exchange)
max_num_of_trades = []
for j in range(len(sort_exchange)):
    max_num_of_trades.append(1)
    time_of_current_exchange = []
    i=0
    for i in range(len(contents)):
        if contents[i][3] == sort_exchange[j]:
            time_of_current_exchange.append(contents[i][0])
    for i in range(len(time_of_current_exchange)):
        time_of_current_exchange[i] = datetime.strptime(time_of_current_exchange[i], '%I:%M:%S.%f')
    for k in range((len(time_of_current_exchange)) - 1):
        if k == 0 or b <= k:
            c = 1
            i = k + 1
        else:
            c = max_num_of_trades[j] - 2
            i = b 
        time_plus_minute = time_of_current_exchange[k] + timedelta(0,60)
        cur_time = time_of_current_exchange[i]
        while i <= (len(time_of_current_exchange))-1 and cur_time <= time_plus_minute:
            c += 1
            i += 1
            if i <= (len(time_of_current_exchange))-1:
                cur_time = time_of_current_exchange[i]
            else:
                break
        b = i-1 
        if c > max_num_of_trades[j]:
            max_num_of_trades[j] = c       
			
for i in range(len(max_num_of_trades)):
	print(max_num_of_trades[i])
