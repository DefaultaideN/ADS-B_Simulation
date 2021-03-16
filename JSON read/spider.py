import time
import brotli
import json

from seleniumwire import webdriver
# options = webdriver.ChromeOptions()
# options.add_argument()
url = 'https://globe.adsbexchange.com/'
browser = webdriver.Chrome()
browser.get(url)
time.sleep(5)

icao_list = []

planesTable = browser.find_element_by_id('planesTable')
tbody = planesTable.find_element_by_tag_name('tbody')
print('Starting flight sniffing...')
for row in tbody.find_elements_by_xpath('./tr'):
    text_list = row.text.split()
    icao = text_list[0]
    print('ICAO: '+str(icao))
    icao_list.append(icao)

time.sleep(10)

print('Start requesting for the first plane...')
test_url = url + '?icao=' + icao_list[0].lower()
browser.get(test_url)

print('Done. Presenting results.')
# for request in browser.requests:
#     if 'trace' in request.response.path:
#         print(request.response.path)
for request in browser.requests:
    if (request.response):
        if icao_list[0].lower() in request.path: 
            print('Request path: '+str(request.path))
            decompressed = brotli.decompress(request.response.body)
            print(decompressed.decode('utf-8'))
            print('-------------------------------------')
            pass
            


