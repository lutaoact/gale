require '../common/init'

fs = require 'fs'

Sentence = _u.getModel 'sentence'
KeyPoint = _u.getModel 'key_point'
SentenceUtils = _u.getUtils 'sentence'

dataPath = 'local_data/key_point_json'

list = process.argv[2]?.split ',' #可以传参数，逗号分隔，不含空格 28,29,32,33

fs.readdir dataPath, (err, files) ->
  needToProcess = []
  if list
    _.each list, (index) ->
      needToProcess.push files[~~index - 1]
  else
    needToProcess = files

  for file in needToProcess
#    console.log file
    datas = SentenceUtils.importKeyPoints file

# coffee scripts/load_key_point_json_to_db.coffee
# coffee scripts/load_key_point_json_to_db.coffee 41,42,43,44,45,46,47,48,49,50 #2015-04-02
# coffee scripts/load_key_point_json_to_db.coffee 31,32,33,34,35,36,37,38,39,40 #2015-04-02
# coffee scripts/load_key_point_json_to_db.coffee 61,62,63,64,65,66,67,68,69,70 #2015-04-07
# coffee scripts/load_key_point_json_to_db.coffee 54,55,56,57,58,59,60 #2015-04-07
