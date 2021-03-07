import ijson
f = open('2018-10-01-0000Z.json', 'r')
objects = ijson.items(f, 'acList.item')
flight = (o for o in objects if o['Icao'] == '503DB3')
for o in objects:
    print(o['Icao'])
    print(o.__contains__('Call'))

print('OK')