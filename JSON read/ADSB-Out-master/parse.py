import pyModeS as pms
file = open('../01.txt', 'r')
binMsg = file.readline()
hexMsg = ['8D75804B580FF2CF7E9BA6F701D0','8D4840D6202CC371C32CE0576098']
#print('Bin: '+str(bin))
for msg in hexMsg:
    pms.tell(msg)
    print('---------------------')