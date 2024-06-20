import logging
import sys
import jinja2
import json

logger = logging.getLogger(__name__)
def init():
    formatter = logging.Formatter('%(threadName)-11s %(name)-9s %(message)s')
    handler = logging.StreamHandler(sys.stdout)
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    
    handler = logging.FileHandler("./app.log")
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    logger.setLevel(logging.INFO)



def generate(refFile, values, output): 
    # file to transform
    templateLoader = jinja2.FileSystemLoader(searchpath="./")
    environment = jinja2.Environment(loader=templateLoader)
    template = environment.get_template(refFile)
    logger.info(template)

    # json mapping
    with open(values, 'r') as file:
        valuesAsJson = file.read()
        jsonFromString = json.loads(valuesAsJson)
        logger.info(valuesAsJson)
    
    # transform
    x = template.render(jsonFromString)
    logger.info(x)

    # save
    f = open(output, "w")
    f.write(x)
    f.close()



if __name__ == "__main__":
    import argparse
    
    init()
    logger.info('Started')

    parser = argparse.ArgumentParser(description='Parse mySQL init.')
    parser.add_argument("-f", "--file", help="SQL file to parse", required=True)
    parser.add_argument("-t", "--template", help="Nom du template de file", required=True)    
    parser.add_argument("-o", "--sqlfile", help="output file", required=True)    
    args = parser.parse_args()
    logger.info(args.file)
    logger.info(args.template)
    logger.info(args.sqlfile)
    
    generate(args.file, args.template, args.sqlfile)