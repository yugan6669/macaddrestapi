############################################################################################################
#####              This program is hitting REST API to fetch data for respective MAC Address           #####
############################################################################################################
#!/usr/bin/env python3
import sys
import urllib.request
import json
import codecs
def fetchData():
  try:
    API_KEY=sys.argv[1]
    MAC_ADDRESS=sys.argv[2]
    url = 'https://api.macaddress.io/v1?apiKey='+API_KEY+'&output=json&search='+MAC_ADDRESS
    json_obj = urllib.request.urlopen(url)
    reader = codecs.getreader("utf-8")
    data = json.load(reader(json_obj))
    print('\n ')
    print('\n ')
  except IndexError:
    print("Please enter API_KEY and MAC_ADDRESS as arguments")
  except Exception:
    print("Please enter valid API KEY and MAC Address")
  else:
    print("MAC Address You entered  : "+data['macAddressDetails']['searchTerm'] )
    print("Company Name             : "+data['vendorDetails']['companyName']);
    print("Company Address          : "+data['vendorDetails']['companyAddress']);
    print("Country code             : "+data['vendorDetails']['countryCode']);
    with open('output.json','w') as f:
      f.write(json.dumps(data,indent=4,sort_keys=True))
if __name__ == "__main__":
    fetchData()


