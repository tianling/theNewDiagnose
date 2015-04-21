#__author__ = 'tianling'
from  xml.dom import  minidom
import json


def get_attrvalue(node, attrname):
     return node.getAttribute(attrname) if node else ''

def get_nodevalue(node, index = 0):
    return node.childNodes[index].nodeValue if node else ''

def get_xmlnode(node,name):
    return node.getElementsByTagName(name) if node else []

def xml_to_string(filename='/Library/WebServer/Documents/theNewDiagnose/public/deep_learn/01.xml'):
    doc = minidom.parse(filename)
    return doc.toxml('UTF-8')

def get_xml_data(filename='/Library/WebServer/Documents/theNewDiagnose/public/deep_learn/01.xml'):
    doc = minidom.parse(filename)
    root = doc.documentElement

    diagnose_nodes = get_xmlnode(root,'diagnose')
    diag_list=[]
    vector_list = []
    label_list = []
    for node in diagnose_nodes:
        vector =get_xmlnode(node,'vector')
        label = get_xmlnode(node,'office')

        real_vector =get_nodevalue(vector[0]).encode('utf-8','ignore')
        real_label = get_nodevalue(label[0]).encode('utf-8','ignore')

        vector_list.append(json.loads(real_vector))
        label_list.append(int(real_label))


    diag = {}
    diag['vector'] , diag['label']  = (
        vector_list,label_list
    )

    return diag

def test_xmltostring():
    print xml_to_string()

def test_laod_xml():
    diag_list = get_xml_data()
    for diag in diag_list['vector'] :
        print '-----------------------------------------------------'
        if diag:
            print diag
            print '====================================================='

    for label in diag_list['label']:
        print '-----------------------------------------------------'
        if(label):
            print label
            print '====================================================='



def load_json():
    diaglist = get_xml_data()
    diaData =  json.dumps(diaglist)
    print diaData

if __name__ == "__main__":
    #test_xmltostring()
    test_laod_xml()
# load_json()
# print '1'